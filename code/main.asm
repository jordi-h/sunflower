/**
 * @file        main.asm
 * @authors     Jordi Hoorelbeke, Loïc Meunier, and Marco Naa
 * @brief       Solar tracker
 * @date        2022-2023
 * 
 */

PROCESSOR 16F1789 ; used processor definition

#include <xc.inc>

CONFIG  FOSC = INTOSC         ; INTOSC oscillator
CONFIG  WDTE = OFF            ; Watchdog Timer disabled
CONFIG  PWRTE = ON            ; Power-up Timer enabled
CONFIG  MCLRE = ON            ; MCLR/VPP pin function is MCLR
CONFIG  CP = OFF              ; Flash Program Memory Code Protection off
CONFIG  CPD = OFF             ; Data Memory Code Protection off
CONFIG  BOREN = ON            ; Brown-out Reset enabled
CONFIG  CLKOUTEN = OFF        ; Clock Out disabled
CONFIG  IESO = ON             ; Internal/External Switchover enabled
CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor enabled
CONFIG  WRT = OFF             ; Flash Memory Self-Write Protection off
CONFIG  VCAPEN = OFF          ; Voltage Regulator Capacitor disabled
;CONFIG  PLLEN = ON            ; 4x PLL enabled
CONFIG  STVREN = ON           ; Stack Overflow/Underflow Reset enabled
CONFIG  BORV = LO             ; Brown-out Reset Voltage trip point low
CONFIG  LPBOR = OFF           ; Low Power Brown-Out Reset disabled
CONFIG  LVP = OFF             ; Low-Voltage Programming disabled

PSECT udata_shr
ready:                  ; semaphore used to know if the timer interrupt has occured
        DS      1
delay_l:                ; last 8 bits of the acquisition delay needed after enabling the adc on a channel
        DS      1
delay_h:                ; first 8 bits of the acquisition delay needed after enabling the adc on a channel
        DS      1
ldr0h:                  ; left ldr
        DS      1
ldr0l:
        DS      1
ldr1h:                  ; right ldr
        DS      1
ldr1l:                  
        DS      1
ldr2h:                  ; lower ldr
        DS      1
ldr2l:
        DS      1
ldr3h:                  ; upper ldr
        DS      1
ldr3l:
        DS      1
servoh:                 ; horizontal servo
        DS      1
servov:                 ; vertical servo
        DS      1
temp:                   ; temporaty register
        DS      1

PSECT reset_vec, class = CODE, delta = 2  
reset_vec: 
        goto    start

PSECT isr_vec, class = CODE, delta = 2
isr_vec:
        goto    isr

PSECT code
start:  call    init_clock      ; 2MHz oscillator initialization 
        call    init_adc        ; ADC initialisation for LDRs
        call    init_portb      ; PORTB initialisation for led
        call    init_data
        call    init_timer_interrupt
        call    init_pwm
        clrf    BSR
        goto    loop            ; enter event loop

; Initialization
init_clock:
        banksel OSCCON
        movlw   0x60            ; 2MHz HF, FOSC bits in config
        movwf   OSCCON
        return

init_adc:
        banksel PORTA           ; PORTA initialization
        clrf    PORTA
        banksel LATA
        clrf    LATA
        banksel TRISA
        clrf    TRISA           ; set RA<0:3> to input
        banksel ANSELA
        movlw   0xff
        movwf   ANSELA          ; set RA<0:3> to analog
        banksel WPUA
        movlw   0x00
        movwf   WPUE            ; weak pull-ups disabled
        banksel ADCON2
        movlw   0x0f
        movwf   ADCON2          ; CHSN: single-ended signal
        movlw   0xf0
        movwf   ADCON1          ; Reference setting + FRC clock (see p.171)
        return

init_portb:
        banksel PORTB
        clrf    PORTB
        banksel LATB
        clrf    LATB
        banksel ANSELB
        clrf    ANSELB
        banksel TRISB
        clrf    TRISB
        return

init_data:
        clrf    ready           ; clear ready flag
        movlw   0x30            
        movwf   servoh          ; initialize 360 servo to a centered position
        movlw   0x30
        movwf   servov          ; initialize 180 servo to a centered position
        return

init_timer_interrupt:
        bsf     OPTION_REG, 1
        bsf     OPTION_REG, 2
        bcf     OPTION_REG, 0
        bcf     OPTION_REG, 5
        bsf     INTCON, 5
        bsf     INTCON, 7
        return

init_pwm:
        banksel PORTC
        clrf    PORTC
        banksel LATC
        clrf    LATC
        banksel TRISC
        movlw   0xff
        movf    TRISC           ; set RC0->RC7 to output
        banksel PR2
        movlw   0x9b
        movwf   PR2             ; pwm period (p.228) of 20ms
        ; 360 servo
        banksel CCP1CON
        bsf     CCP1CON, 2      ; pwm mode
        bsf     CCP1CON, 3
        movf    servoh, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        movwf   CCPR1L
        bcf     CCP1CON, 4
        bcf     CCP1CON, 5
        movlw   0x03
        andwf   servoh, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        banksel CCP1CON
        iorwf   CCP1CON, 1
        ; 180 servo
        bsf     CCP2CON, 2      ; pwm mode
        bsf     CCP2CON, 3
        movf    servov, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        movwf   CCPR2L
        bcf     CCP2CON, 4
        bcf     CCP2CON, 5
        movlw   0x03
        andwf   servov, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        banksel CCP2CON
        iorwf   CCP2CON, 1
        ; configure and start time 2
        banksel PIR1            ; timer 2 init and start
        bcf     PIR1, 1
        bsf     T2CON, 0        ; prescaler de 1:64
        bsf     T2CON, 1
        bsf     T2CON, 2        ; Timer 2 on
        banksel TRISC
        clrf    TRISC
        return

; main code
loop:   
        btfsc   ready, 0        ; Check ready every XX seconds
	call    computation     ; computations for LDRs
        goto    loop

computation:
        clrf    ready
        ; Horizontal (360) servomotor
        ; call    ldr0            ; Get LDR value (down)
        ; call    ldr1            ; Get LDR value (up)
        ; call    differenceH_360    ; Get vertical servomotor's direction
        ; Vertical (180) servomotor
        call    ldr2            ; Get LDR value (left)
        call    ldr3            ; Get LDR value (right)
        call    differenceH_180    ; Get horizontal servomotor's direction
        call    pwm
        return

; Getters
ldr0:
        banksel ADCON0
        movlw   0x81
        movwf   ADCON0  ; ADC enabled on channel AN0 with 10-bit result
        call    delay
        bsf     ADCON0, 1
        btfsc   ADCON0, 1
        goto    $-1
        banksel ADRESH
        movf    ADRESH, 0
        movwf   ldr0h
        movf    ADRESL, 0
        movwf   ldr0l
        return

ldr1:
        banksel ADCON0
        movlw   0x85
        movwf   ADCON0  ; ADC enabled on channel AN1 with 10-bit result
        call    delay
        bsf     ADCON0, 1
        btfsc   ADCON0, 1
        goto    $-1
        banksel ADRESH
        movf    ADRESH, 0
        movwf   ldr1h
        movf    ADRESL, 0
        movwf   ldr1l
        return

ldr2:
        banksel ADCON0
        movlw   0x89
        movwf   ADCON0  ; ADC enabled on channel AN2 with 10-bit result
        call    delay
        bsf     ADCON0, 1
        btfsc   ADCON0, 1
        goto    $-1
        banksel ADRESH
        movf    ADRESH, 0
        movwf   ldr2h
        movf    ADRESL, 0
        movwf   ldr2l
        return

ldr3:
        banksel ADCON0
        movlw   0x8d
        movwf   ADCON0  ; ADC enabled on channel AN3 with 10-bit result
        call    delay
        bsf     ADCON0, 1
        btfsc   ADCON0, 1
        goto    $-1
        banksel ADRESH
        movf    ADRESH, 0
        movwf   ldr3h
        movf    ADRESL, 0
        movwf   ldr3l
        return

; Movers
turn_right_360:
        banksel PORTB
        movlw   0xff
        movwf   PORTB
        movlw   0x2d
        movwf   servoh
        return

turn_left_360:
        banksel PORTB
        movlw   0x00
        movwf   PORTB
        movlw   0x31
        movwf   servoh
        return

stop:
        banksel PORTB
        movlw   0x00
        movwf   PORTB
        movlw   0x30
        movwf   servoh
        return

turn_right_180:
        banksel PORTB
        movlw   0xff
        movwf   PORTB
        movlw   0x10
        movwf   servov
        return

turn_left_180:
        banksel PORTB
        movlw   0x00
        movwf   PORTB
        movlw   0x50
        movwf   servov
        return

pwm:
        ; 360 servo
        movf    servoh, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        banksel CCP1CON
        movwf   CCPR1L
        bcf     CCP1CON, 4
        bcf     CCP1CON, 5
        movlw   0x03
        andwf   servoh, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        iorwf   CCP1CON, 1
        ; 180 servo
        movf    servov, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        banksel CCP2CON
        movwf   CCPR2L
        bcf     CCP2CON, 4
        bcf     CCP2CON, 5
        movlw   0x03
        andwf   servov, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        iorwf   CCP2CON, 1
        return

; Utility functions
differenceH_360:
        movf    ldr0h, 0
        subwf   ldr1h
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    differenceL_360    ; Call differenceL_360 if equal
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    turn_left_360
        goto    turn_right_360
        return
        
differenceL_360:
        movf    ldr0l, 0
        subwf   ldr1l
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    stop
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1s
        goto    turn_left_360
        goto    turn_right_360
        return

differenceH_180:
        movf    ldr2h, 0
        subwf   ldr3h
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    differenceL_180    ; Call differenceL_360 if equal
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    turn_left_180
        goto    turn_right_180
        return
        
differenceL_180:
        movf    ldr2l, 0
        subwf   ldr3l
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        return
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1s
        goto    turn_left_180
        goto    turn_right_180
        return

delay:
        movlw   0xff
        movwf   delay_h
        movlw   0xff
        movwf   delay_l

delay_loop:
        incfsz  delay_l, f
        goto    delay_loop
        incfsz  delay_h, f
        goto    delay_loop
        return

; Interrupt service routine
isr:
        btfss   INTCON, 2
        retfie
        movlw   0x01
        movwf   ready
        bcf     INTCON, 2
        retfie

	end	reset_vec
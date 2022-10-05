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

PSECT udata_bank0
ready:                  ; semaphore used to know if the timer interrupt has occured
        DS      1
servo:
        DS      1
counter_l:              ; last 8 bits of 24-bit counter 
        DS      1
counter_h:              ; middle 8 bits of 24-bit counter
        DS      1       
counter_hh:             ; first 8 bits of 24-bit counter
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
servo_180:              ; servo vertical
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
        call    init_counter
        movlw   0x1f            ; 
        movwf   servo_180
        return

init_counter:
        movlw   0xff
        movwf   counter_hh
        movlw   0xff
        movwf   counter_h
        clrf    counter_l
        return

init_timer_interrupt:
        banksel OPTION_REG
        bsf     OPTION_REG, 1
        bsf     OPTION_REG, 2
        bcf     OPTION_REG, 0
        bcf     OPTION_REG, 5
        bsf     INTCON, 5
        bsf     INTCON, 7
        return

init_pwm:
        ; 5-6 initialization steps page 228
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
        banksel CCP1CON
        bsf     CCP1CON, 2      ; pwm mode
        bsf     CCP1CON, 3
        movlw   0x30            ; REMOVE: is it working without it (cfr init_data function assigning another value)
        movwf   servo_180
        ; Put servo_180's value in the right PWM register
        movf    servo_180, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        movwf   CCPR1L
        bcf     CCP1CON, 4
        bcf     CCP1CON, 5
        movlw   0x03
        andwf   servo_180, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        iorwf   CCP1CON, 1
        ; end
        banksel PIR1            ; timer 2 init and start
        bcf     PIR1, 1
        bsf     T2CON, 0        ; prescaler de 1:64
        bsf     T2CON, 1
        bsf     T2CON, 2        ; Timer 2 on
        ; 6th  step (not mandatory)
        ; btfss   PIR1, 1 ; clear flag after
        ; goto    $-1
        ; bcf     PIR1, 1
        banksel TRISC
        clrf    TRISC
        return


; Main code
loop:   btfsc   ready, 0        ; Check ready every XX seconds
	call    computation     ; computations for LDRs
        ; btfsc   servo, 0      ; Check if servomotor has to move
        ; call    pwm           ; turn servomotor
        goto    loop

computation:
        clrf    ready
        ; Vertical (180) servomotor
        call    ldr0            ; Get LDR value (down)
        call    ldr1            ; Get LDR value (up)
        call    difference_h    ; Get vertical servomotor's direction
        ; Horizontal (360) servomotor
        ; call    ldr0            ; Get LDR value (left)
        ; call    ldr1            ; Get LDR value (right)
        ; call    difference_h    ; Get horizontal servomotor's direction
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

; Movers
turn_right:
        banksel PORTB
        movlw   0xff
        movwf   PORTB
        ; incf    servo_180, 1  ; REMOVE: empirical testing (maybe +5)
        ; call    pwm
        return

turn_left:
        banksel PORTB
        movlw   0x00
        movwf   PORTB
        ; decf    servo_180, 1 ; REMOVE: empirical testing (maybe -5)
        ; call    pwm
        return

pwm:
        banksel CCP1CON
        movf    servo_180, 0
        movwf   temp
        lsrf    temp, 1
        lsrf    temp, 0
        movwf   CCPR1L
        bcf     CCP1CON, 4
        bcf     CCP1CON, 5
        movlw   0x03
        andwf   servo_180, 0
        movwf   temp
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 1
        lslf    temp, 0
        iorwf   CCP1CON, 1
        banksel TRISC
        clrf    TRISC
        return

; Utility functions
difference_h:
        movf    ldr0h, 0
        subwf   ldr1h
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    difference_l    ; Call difference_l if equal
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    turn_left
        goto    turn_right
        
difference_l:
        movf    ldr0l, 0
        subwf   ldr1l
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    turn_left       ; REMOVE: We shouldn't move here
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    turn_left
        goto    turn_right

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
        btfsc   INTCON, 2
        goto    t0_code
        banksel PIR1
        btfss   PIR1, 1
        retfie
        goto    t2_code
        retfie

t0_code:
        incfsz  counter_l, f
        retfie
        incfsz  counter_h, f
        retfie
        incfsz  counter_hh, f
        retfie
        movlw   0x01
        movwf   ready
        call    init_counter
        bcf     INTCON, 2
        retfie

t2_code:
        banksel TRISC
        clrf    TRISC
        banksel PIR1
        movlw   0x01
        movwf   servo
        bcf     PIR1, 1
        retfie

	end	reset_vec
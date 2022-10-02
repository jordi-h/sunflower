/**
 * @file        main.asm
 * @authors     Jordi Hoorelbeke, Loïc Meunier, and Marco Naa
 * @brief       Solar tracker
 * @date        2022-2023
 * 
 */

PROCESSOR 16F1789 ; used processor definition

#include "config.asm"
#include "data.asm"

PSECT reset_vec, class = CODE, delta = 2  
reset_vec: 
        goto    start

PSECT isr_vec, class = CODE, delta = 2
isr_vec:
        goto    isr

PSECT code
start:  call    init_clock      ; 32MHz oscillator initialization 
        call    init_adc
        call    init_portb
        call    init_data
        call    init_timer_interrupt
        clrf    BSR
        goto    loop            ; enter event loop

init_clock:
        banksel OSCCON
        movlw   0xf8    ; PLL enable, 32MHz HF, FOSC bits in config
        movwf   OSCCON
        return

init_adc:
        banksel PORTA   ; PORTA initialization
        clrf    PORTA
        banksel LATA
        clrf    LATA
        banksel TRISA
        clrf    TRISA   ; set RA<0:3> to input
        banksel ANSELA
        movlw   0xff
        movwf   ANSELA  ; set RA<0:3> to analog
        banksel WPUA
        movlw   0x00
        movwf   WPUE    ; weak pull-ups disabled
        banksel ADCON2
        movlw   0x0f
        movwf   ADCON2  ; CHSN: single-ended signal
        movlw   0xf0
        movwf   ADCON1  ; Reference setting + FRC clock (see p.171)
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
        clrf    ready   ; clear ready flag
        call    init_counter
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

loop:   btfsc   ready, 0
	call    computation
        goto    loop

computation:
        clrf    ready
        call    ldr0
        call    ldr1
        call    difference_h
        return

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

difference_h:
        movf    ldr0h, 0
        subwf   ldr1h
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    difference_l
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    led_off
        goto    led_on
        
difference_l:
        movf    ldr0l, 0
        subwf   ldr1l
        btfsc   STATUS, 2       ; enter if Z = 1 (equal)
        goto    led_off
        btfsc   STATUS, 0       ; enter if ldr0 > ldr1
        goto    led_off
        goto    led_on

led_on:
        banksel PORTB
        movlw   0xff
        movwf   PORTB
        return

led_off:
        banksel PORTB
        movlw   0x00
        movwf   PORTB
        return

delay:
        movlw   0xcb
        movwf   delay_h
        clrf    delay_l

delay_loop:
        incfsz  delay_l, f
        goto    delay_loop
        incfsz  delay_h, f
        goto    delay_loop
        return

isr:
        btfss   INTCON, 2
        retfie
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

	end	reset_vec
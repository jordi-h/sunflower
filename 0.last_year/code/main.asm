/**
 * @file        main.asm
 * @authors     Jordi Hoorelbeke, Loïc Meunier, and Marco Naa
 * @brief       Sunflower project: a solar tracker
 * @date        2022-05-20
 * 
 */

PROCESSOR 16F1789 ; used processor definition

#include "config.asm"
#include "data.asm"

/**
 * RESET VECTOR
 */
PSECT reset_vec, class = CODE, delta = 2  
reset_vec: 
        goto    start

/**
 * INTERRUPT VECTOR
 */
PSECT isr_vec, class = CODE, delta = 2
isr:
        bcf     INTCON, 7 ; disable all interrupts inside isr (GIE)
        bsf     INTCON, 1 ; polling of the interrupt flag bit (INTF)
        incf    ready
        bcf     INTCON, 1 ; clear interrupt flag bit (INTF)
        bsf     INTCON, 7 ; enable all interrupts on exit (GIE)
        retfie

/**
 * INIT & EVENT LOOP
 */
PSECT code
start:  banksel OSCCON
        movlw   0xf8    ; PLL enable, 32MHz HF, FOSC bits in config
        movwf   OSCCON
        banksel PORTA   ; PORTA initialization
        clrf    PORTA
        banksel LATA
        clrf    LATA
        banksel TRISA
        clrf    TRISA   ; set RA<0:3> to input
        banksel ANSELA
        movlw   0xff
        movwf   ANSELA  ; set RA<0:3> to analog
        banksel PORTB   ; PORTB initialization
        clrf    PORTB
        banksel LATB
        clrf    LATB
        banksel TRISB
        movlw   0xff
        movwf   TRISB   ; set RB<0;1;3> to output
        banksel ANSELB
        clrf    ANSELB  ; set RB<0;1;3> to digital I/O
        movlw   0x00    ; clear ready
        movwf   ready
        banksel OPTION_REG
        movlw   0x87
        movwf   OPTION_REG ; set prescale of 1:256 for TIMR0
        banksel INTCON
        movlw   0xA0    ; select Timer0 Overflow Interrupt
        movwf   INTCON  ; enable interrupts
        clrf    BSR
loop:   btfsc   ready, 0
        goto    computation
        goto    loop

/**
 * LDR VALUE COMPUTATION
 */
computation:
        clrf    ready
        call    led_blink
        banksel ADCON0
        movlw   0x01    ; select channel AN0
        call    conversion ; left_ldr
        movlw   0x05    ; select channel AN1
        call    conversion ; right_ldr
        movlw   0x09    ; select channel AN2
        call    conversion ; lower_ldr
        movlw   0x0d    ; select channel AN3
        call    conversion ; upper_ldr
        clrf    ADCON0  ; turn of ADC module
        goto    rotate360
        goto    rotate180
        goto    loop

/**
 * ADC MODULE CONVERSION
 */
conversion:
        movwf   ADCON0  ; turn on ADC module
        call    delay   ; Acquisition delay
        bsf     ADCON0, 1 ; start conversion (ADGO)
        btfsc   ADCON0, 1 ; is conversion done? (ADGO)
        goto    $-1     ; no, test again
        ; <"Store result from ADRESH and ADRESL">
        return

/**
 * SERVOMOTORS ROATATION
 */
rotate360:
    ; <"rotate the 360 servo motor">
        goto    loop

rotate180:
    ; <"rotate the 180 servo motor">
        goto    loop

/**
 * LED BLINKING
 */
led_blink:
        banksel PORTB
        btfsc   PORTB, 0
        goto    turn_led_off ; if RB0 == 1
        goto    turn_led_on ; elsif RB0 == 0
led_blink_end:
        return
turn_led_off:
        bcf     PORTB, 0 ; clear RB0
        goto    led_blink_end
turn_led_on:
        bsf     PORTB, 0 ; set RB0
        goto    led_blink_end

/**
 * DELAY AFTER ADC MODULE TURNING ON
 */  
delay:  movlw   0xff
        movwf   counter_hh
        movlw   0xcb
        movwf   counter_h
        clrf    counter_l
delay_loop:
        incfsz  counter_l, f
        goto    delay_loop
        incfsz  counter_h, f
        goto    delay_loop
        incfsz  counter_hh, f
        goto    delay_loop
        return

/**
 * END OF SOURCE FILE
 */
        end	reset_vec
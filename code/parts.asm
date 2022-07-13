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

/**
 * INIT & EVENT LOOP
 */
PSECT code
start:  call    init_clock  ; 32MHz oscillator initialization 
        call    init_ADC    ; input with ADC module initialization
        call    init_PWM    ; output with PWM module initialization
        call    init_timer_interrupt    ; Timer1 interrupt enabled
        goto    loop    ; enter event loop

init_clock: ; enable Internal 32MHz oscillator
        banksel OSCCON
        movlw   0xf8    ; PLL enable, 32MHz HF, FOSC bits in config
        movwf   OSCCON
        return

init_ADC:
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
        banksel ADCON1
        movlw   0xf0
        movwf   ADCON1  ; FRC clock and Vdd-Vss are Vref
        banksel ADCON2
        movlw   0x0f
        movwf   ADCON2  ; port pins are set to ADC negative reference
        banksel ADCON0
        movlw   0x81    ; ADC enabled on channel AN0 with 10-bit result
        return

init_PWM:
        return

init_timer_interrupt:   ; with 32MHz oscillator, 16,384ms overflow delay
        banksel TMR1H
        clrf    TMR1H   ; clear 8 higher bits of Timer1
        banksel TMR1L
        clrf    TMR1L   ; clear 8 lower bits of Timer1
        banksel T1CON
        movlw   0x49
        movwf   T1CON   ; enable Timer 1 with instruction clock source (Fosc/4) and 1:8 prescale
        banksel INTCON
        movlw   0xc0
        movwf   INTCON  ; global and peripheral interrupts enabled
        banksel PIE1
        movlw   0x01
        movwf   PIE1    ; Timer1 overflow interrupt enabled
        banksel PIR1
        clrf    PIR1    ; Timer1 overflow interrupt flag bit cleared (interrupt has not happened)
        return

loop:   btfsc   ready, 0
        goto    computation
        goto    loop
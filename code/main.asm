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
start:  call    init_clock  ; 32MHz oscillator initialization 
        goto    loop    ; enter event loop

init_clock:
        banksel OSCCON
        movlw   0xf8    ; PLL enable, 32MHz HF, FOSC bits in config
        movwf   OSCCON
        return

loop:   btfsc   ready, 0
		; >Computations<
        goto    loop

isr:
        retfie

		end	reset_vec
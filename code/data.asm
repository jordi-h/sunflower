#include <xc.inc>

/**
 * DATA MEMORY
 */
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
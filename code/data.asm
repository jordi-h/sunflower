#include <xc.inc>

/**
 * DATA MEMORY
 */
PSECT udata_bank0
ready:              ; semaphore used to know if interrupt has occured
        DS      1
left_ldr_value:     ; value of left ldr
        DS      1
right_ldr_value:    ; value of right ldr
        DS      1
lower_ldr_value:    ; value of lower ldr
        DS      1
upper_ldr_value:    ; value of upper ldr
        DS      1
counter_l:          ; last 8 bits of 24-bit counter 
        DS      1
counter_h:          ; middle 8 bits of 24-bit counter
        DS      1       
counter_hh:         ; first 8 bits of 24-bit counter
        DS      1
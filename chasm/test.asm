nop
nop

movi ax, 0xAA ; Alternating ones and zeros

nop
nop
nop

@start
    nop
    not ax    ; Inverse the alternating ones and zeros
    out ax
    nop
jmp @start

; The output should be AA, then 55, then it keeps cycling.
; Connecting an array of leds to the output port then 
; running this program should give us an animation.
; bouncing ball logic
       ldx #5
       ldy #5
southwest:
       dex
       beq southeast
       dey
       beq northwest
       jmp southwest
northwest:
       dex
       beq northeast
       iny
       cpy #100
       bcs southwest
       jmp northwest
southeast:
       inx
       cpx #100
       bcs southwest
       dey
       beq northeast 
       jmp southeast
northeast:
       inx
       cpx #100
       bcs northwest
       iny
       cpy #100
       bcs southeast
       jmp northeast
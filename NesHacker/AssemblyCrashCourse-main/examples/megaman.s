.export Main
.segment "CODE"

.proc Main
  lda #25
  sta $00   ; current health
  lda #25
  sta $01   ; incoming damage
  lda #0
  sta $02   ; result

  lda $00
  cmp $01
  lda #0
  adc #0
  sta $02
  rts
.endproc
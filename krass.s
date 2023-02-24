; begin here

       LDA START,X
REPEAT CMP MAX
       BEQ NEXT
       TAX
       ADC #02
       JMP REPEAT ; repeat until max reached
;
; exercise page 62
;
       LDA #0   ; set the accumulator to zero
       ADC #25  ; add 25 to the accumulator
       CMP #20  ; compare the result to 20
;
; use op codes from fig. 9 and direct addressing to code instrctions that will:
;
       LDA $02FF ; copy data from location $02FF to accumulator
       JMP $72FF ; execute next the instruction beginning at address $72FF
;
; (a) $00F5
; (b) $29
; (c) uses less memory, saces one byte of space, executes faster
;
; (a) LDA #10
; (b) ADC $0306
; (c) CMP $02
; (d) whether there is # meaning literal value if $ without # then it is an
;
; (a) $0528
;     $0909
;
; (b) X = $02, Y = $15
        LDA $0711,X
        ADC $08E3,Y
;
; (a) A + $1111 = #4369
; (b) ADC #10
; (c) JMP $3212 ; direct
; (d) LDA $15
; (e) $0242
;
; Indirect addressing pg 70
; (a) JMP ($2020)
; (b) JMP ($1510)
; (c) JMP ($1510)
; (d) JMP ($0115)
;
; ex 15, pg 70
; (a) $1303
; (b) $02FA
; (c) JMP $FA13
; (d) JMP ($1531)
;
; Pre-Indexed Indirect Addressing
; ex 16, pg 71
; (a) $0013
; (b) INVALID
; (c) INVALID
; (d) $0027
; (e) $0001
;
; (f) $15,X
; (g) $F7,X
; (h) none
; (i) $E2,X
; (j) none
;
; ex 17 pg 73
; X = $12
; Y = $20
; A = $15
; 
; (a) X
; (b) $88BC
; (c) ($0014)
;
; PRE-INDEXED INDIRECT ADDRESSING, ex 16, pg 71
; (a) $0013
; (b) invalid, Y register
; (c) invalid, page 1
; (d) $0027
; (e) $0101 => $0001
;
; (f) ($15,X)
; (g) ($F7,X)
; (h) invalid page 1
; (i) ($E2,X)
; (j) invalid page 1
;
; POST-INDEXED INDIRECT ADDRESSING, ex 17, pg 73
;
; X = $12
; Y = $20
; A = $15
;
; (a) STA ($00,X), 
; (b) Byte $88BC = 15
; (c) JMP ($0014)
; (d) $00E3 + $20 = $0103, ADC #$0F, A = 15 + 15 = 30
; (e) JMP ($0100)
;
; (a) relative addressing
; (b) branch back 16 bytes
; (c) +127
; (d) -128
;
; ex 22, pg 76
; 
; TEMP   $00AA
; REPLAC $0515
;
; (a) JMP REPLAC
; (b) LDA TEMP,X
; (b) ADC (TEMP,X)
;
; CHAPTER 4 SELF TEST, pg 79
;
; (a) index direct
; (b) preindex indirect, zero page
; (c) direct
; (d) zero-page index direct
; (e) immediate
; (f) indirect
; (g) zero page post index indirect
; (h) immediate hex
; (i) zero page preindex indirect
; (j) zero page index direct
; (k) direct
; (l) zero page direct
;
; 11. ADC $72
; 12. LDA #'Z'
; 13. CMP #16
; 14. BEQ NEXT
; 15. JMP FOURTH
; 16. STA KEEP
; 17. STA KEEP,X
; 18. JMP ($1020)
; 19. $4020
;
; (b) LDA FIRST
; (c) LDA #0
;
LDX SECOND
STX THIRD
LDY THIRD
STY HOME

JSR INPUT
JSR OUTPUT

LDA MEMBYT
JSR ASCBIN
STA NEWBYT

JSR INPUT
JSR OUTPUT
JSR ASCBIN
STA BINNUM

ADC #15
ADC UPDATE
; one byte
;
LDA #15
CLC
ADC #17
;
       LDA #$FA   ; A = FA
STEP1  CLC
       ADC #$06   ; FA + 6, A = $00
       STA FIRST  ; FIRST = $00
       LDA #$03   ; A = 3
STEP2  CLC
       ADC #$02   ; A = 5
       STA SECOND ; SECOND = 5
; 
       SBC #25
       SBC WHAT
;
       LDA #125
       SEC
       SBC #12
       STA NEWNUM
;
       INC $15
       INC $15

TEITUR JSR INPUT
       JSR OUTPUT
       JMP TEITUR
;
       LDA #$30
CLOSED CLC
       ADC #1
       JSR OUTPUT
       JMP CLOSED
;
; Chapter 5 self test
;
; 1
       LDA LOMEM
; 2
       TYX ; ?
       TYA
       TAX
; 3
       STA $2105
; 4
       ADC #40
; 5
       JMP $2000
; 6
       LDA #$21
; 7
       CLC
       DEC COUNTR
       ;
       CLC
       LDA COUNTR
       SBC #1
       STA COUNTR
; 8 
JSR INPUT
; 9
       SEC
       SBC #$5
; 10
       TXA
;
       LDA X
; 11
       DEY
; 12
       LDX #0
; 13
       INC $27
; 14
       JMP NEWADD
; 15
       JSR OUTPUT
; 16
ENDIT  JMP ENDIT
; 17
       STY YREGIS
; 18
       CLC
; 19
       INX
; 20
       ADC $16
; 21
       JSR INPUT
       JSR OUTPUT
       STA MEMBYE
; 22
       LDA #'H'
       JSR OUTPUT
       LDA #'I'
       JSR OUTPUT
; 23
       LDX #0
LOOP   JSR INPUT
       JSR OUTPUT
       STA INMESG,X
       INX
       JSR LOOP
; 24
LOOP   JSR INPUT
       JSR OUTPUT
       CLC
       ADC #5
       JSR OUTPUT
       JSR LOOP
; 25
       LDA OLDADD
       STA NEWADD
; 26
       LDA TOTSUM
       SEC
       SBC #6
       STA TOTSUM
;
; neshacker cc3
;
       lda #25
       sta $00   ; current health
       lda #30
       sta $01   ; incoming damage
       lda #0
       sta $02   ; result

       lda $00 ; load hp
       sec
       sbc $01
       sta $00 ; update hp
       cmp #1 ; if carry flag is set, mega man is alive, else dead
       adc #0
       sta $02

       ; simpler
       lda $00
       inc $01 ; greater than or equal to
       cmp $01
       lda #0
       adc #0
       sta $02
;
; chapter 6, ex 1
;
; (a) 8013
; (b) 4C
;
QUEST ASC 'WHY  '
;
; (a)
HOWMUCH DFB 40,10,30
;
;
; DEFINE DATA AREAS
NAME DS 10 ; THIS RESERVES 10 BYTES FOR A NAME
; ca65 equivalent
_name: .res 10
;
MESSAGE ASC 'HI' ; A BEGINNING MESSAGE
; ascii valuues can be defined using DFB
MESSAGE DFB 'HA','I'
; ca65 equivalent
_message: .asciiz 'HI'
;
; DFB defines storage initalezed by any kind of value
TOMUCH DFB 3,$15,12,7
; ca65 equivalent
_tomuch: .byt "world", $0D, $00
;
; THE EQU DIRECTIVE
HIVAL EQU $FF
LOVAL EQU $00
; ca65 equivalent
_hival: $FF
;
; chapter 6 self test
;
; 1. Define initialized space
.byt    "world", $0D, $00 ; define byte sized data
.res    12, $AA ; reserve storage
four .set 4 ; numeric variable
;
; conditional jmps
beq ender
bne loop
bmi negval
bpl ok
bcs toobig
bvc cycle
; 
; count down from 5 to 0
ldx #5
loop:
dex
bne loop
;
;
cmp #50
bne NEXONE

cmp #'A'
bcs LETTER
;
;
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

;
; chapter 9: the stack
;
; ex 11 pg 197
TXA
PHA
TYA
PHA
JSR LOGON
PLA
TAY
PLA
TAX
;
; ex. 12
STY SAVEY
JSR NEWLOG
LDY SAVEY
_SAVEY: .res 1
;
; ex. 14
TSX
INX
TXS
;
; Chapter 9 self test
;
; 1
LDX #$FF
TXS
; 2
$01FF
$01FE
; 3
PHA ; A to stack
PHP ; status to stack

TXA ; x to a
PHA ; a to stack

TYA ; y to a
PHA ; a to stack
; 4
PLA
TAY
PLA
TAX

PLP
PLA
; 5
LDA #0
PHA
;
; chapter 10
; ex 9
a x status
PLP
PLA
TAX
PLA
;
; ex 16
TEITUR: CLC
        ADC #5
        BCS DRASL
        RTS
DRASL   LDA #0
;
; ex 13
ECHO:   JSR INPUT
        JSR OUTPUT
        STA INCHAR
;
; ex 14
TEITUR: JSR INPUT
        CMP #$20
        BCC BLA

BLA     TAX
        RTS
;
; ch 11, ex 22
; (a)
00001111
11110001
; (b)
01101110
10010010
;
; ez 2s complement
LDA NEGNUM
EOR #%11111111
CLC
ADC #1

LDA SUBBER
EOR #%11111111
CLC
ADC #1
STA SUBBER
;
; x 25
; (a)
#0
; (b)
#127
; (c)
%1000 0000
%0111 1111
%1000 0000
#-128
; (d)
%1111 1111
%0000 0001
#-1
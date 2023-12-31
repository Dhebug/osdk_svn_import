;lvlHarbour2.s
;Level Specific Effects..
;1) Twinkling stars                                     Done
;2) Distant waves glistening
;3) Seagulls
;4) Moored black Boat!
;5) Rats under jetty
LevelSettings	.byt %00000000

DetermineContourMap
	ldx HeroY
DetermineContourMap2
	ldy #00
	lda #<FloorTable
	sta ContourFloor
	lda #>FloorTable
	sta ContourFloor+1
	lda #<CeilingTable
	sta ContourCeiling
	lda #>CeilingTable
	sta ContourCeiling+1
	rts

LevelExit
LevelUnpack
        rts
LevelRun
        ;Twinkle stars
.(
        ldx #05
loop1   lda StarLocationsLo,x
        sta screen
        lda StarLocationsHi,x
        sta screen+1
        txa
        tay
        lda rndRandom
loop2   lsr
        dey
        bpl loop2
        and #3
        tay
        lda TwinkleColour,y
        ldy #00
        sta (screen),y
        dex
        bpl loop1

        ;flying insects(biting?)
.)
        rts

StarLocationsLo
 .byt <$29+$a758
 .byt <$7E+$a758
 .byt <$38+$a758
 .byt <$3B+$a758
 .byt <$12A+$a758
 .byt <$47+$a758
StarLocationsHi
 .byt >$29+$a758
 .byt >$7E+$a758
 .byt >$38+$a758
 .byt >$3B+$a758
 .byt >$12A+$a758
 .byt >$47+$a758
TwinkleColour
 .byt 6,3,2,7
LevelProse
 .byt "A Bridge to guide me..             "
 .byt "In a dark dank hollow              "
 .byt "the musty aroma is rank            "
 .byt "and lies their a lost hallow       "
 .byt "beyond salvation ence beheld.      "
 .byt "                                   "
 .byt "But is all is it seems?            "
LevelScreen
#include "Harbour2.s"

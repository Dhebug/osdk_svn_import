;EffectPlot

EffectPlot
	; Fetch Effect Screen Address
	ldy EffectCursorRow
	jsr SetupEditorScreen
.(	
loop2	; Branch if within Effects
	cmp #128
	bcc skip1
	
	; Plot blank row
	ldy #39
	lda #8
loop1	sta (screen),y
	dey
	bpl loop1

rent1	; Look to next row
	jsr nl_screen
	inc RowIndex
	lda RowIndex
	dec RowCounter
	bne loop2
	
	; Effect Plot ends here!
	rts

skip1	; Plot Effect row
	ldx EffectNumber
	lda RowIndex
	jsr CalcEffectAddress
	
	;Fetch Value
	ldy #00
	lda (source),y
	
	;Display Row
	jsr EffectPlotEntry
	
	; Show Effect Index
	ldy #00
	lda RowIndex
	and #63
	clc
	adc #SIXTYFOUR_CHARACTERBASE
	sta (screen),y
	
	; Progress to next row
	jmp rent1
.)


EffectPlotEntry
	pha
	lda seHighlightActive
.(
	beq skip1
	lda RowIndex
	cmp seHighlightRowStart
	bcc skip1
	cmp seHighlightRowEnd
	beq skip2
	bcs skip1
skip2	lda #128
	jmp skip3
skip1	lda #00
skip3	sta seHighlightInverse
.)	
	pla
	;Fetch Index
	ldx #27
.(
loop1	dex
	cmp EffectRangeThreshold,x
	bcc loop1
.)	
	; Index now in X - Reduce range to 0-X and store
	sbc EffectRangeThreshold,x
	sta seTemp01
	
	;
	lda seEffectTextLo,x
	sbc #01
	sta source
	lda seEffectTextHi,x
	sbc #00
	sta source+1
	
	ldy #00
.(
loop1	iny
	lda (source),y
	bmi EndOrValueInsertion
	ora seHighlightInverse
	sta (screen),y
	jmp loop1
.)
EndOrValueInsertion
	and #127
.(
	beq skip1
	tax
	lda seValueFormatCodeVectorLo-1,x

	sta vector1+1
	lda seValueFormatCodeVectorHi-1,x
	sta vector1+2
	lda seTemp01
	clc
vector1	jsr $dead
skip1	;Clear to end of line
.)
	jmp ClearToEndOfRow

seValueFormatCodeVectorLo
 .byt <seDisplayDecimal	;129
 .byt <seDisplayOffOrOn	;130
 .byt <seDisplayWaveName	;131
 .byt <seDisplayDecimal2	;132 Special calc for loop
seValueFormatCodeVectorHi
 .byt >seDisplayDecimal
 .byt >seDisplayOffOrOn
 .byt >seDisplayWaveName
 .byt >seDisplayDecimal2
seDisplayDecimal2
.(
	sta vector1+1
	lda RowIndex
	sec
vector1	sbc #00
.)
	clc
	adc #SIXTYFOUR_CHARACTERBASE
	jmp spSkip1
seDisplayDecimal
	adc #SIXTYFOUR_CHARACTERBASE+1
spSkip1	ora seHighlightInverse
	sta (screen),y
	iny
	rts
seDisplayOffOrOn
	asl
	asl
	tax
	lda #4
	sta seTemp01
.(
loop1	lda seOnOffText,x
	ora seHighlightInverse
	sta (screen),y
	inx
	iny
	dec seTemp01
	bne loop1
.)
	rts

seDisplayWaveName
	asl
	asl
	asl
	tax
	lda #8
	sta seTemp01
.(
loop1	lda seWaveNameText,x
	ora seHighlightInverse
	sta (screen),y
	inx
	iny
	dec seTemp01
	bne loop1
.)
	rts

seOnOffText
 .byt "OFF "
 .byt "ON  "
seWaveNameText
 .byt "SAWTOOTH"
 .byt "TRIANGLE"
 .byt "DECAY   "
 .byt "ATTACK  "

;Display Cursor based on PatternCursorX (Always middle row)
seDisplayCursor
	ldy #39
.(
loop1	lda $bb80+80+40*12,y
	ora #128
	sta $bb80+80+40*12,y
	dey
	bpl loop1
.)
	rts

seUpdateLegend
	;Display Current Effect Number
	lda EffectNumber
	clc
	adc #SIXTYFOUR_CHARACTERBASE+128
	sta seLegend_EffectNumber
	;Display Current Effect Name
	lda EffectNumber
	jsr CalcEffectNameAddress
	ldy #7
.(
loop1	lda (source),y
	ora #128
	sta seLegend_EffectName,y
	dey
	bpl loop1
.)
	rts
	
seDisplayLegend
	ldy #39
.(
loop1	lda seLegend,y
	ora #128
	sta $BB80+40,y
	dey
	bpl loop1
.)
	rts





seDisplayStatus
	;Display status
	ldx #39
.(
loop1	lda GenericGrabbedRowStatus,x
	ora #128
	sta $bb80+40*27,x
	dex
	bpl loop1
.)
	;Now display grabbed row
	rts

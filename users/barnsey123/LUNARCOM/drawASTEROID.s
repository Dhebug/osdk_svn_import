; Add 40 to "tmp1"
_Add40
.(
	clc
	lda tmp1+0
	adc #40
	sta tmp1+0
	bcc skip
	inc tmp1+1
skip	
	rts
.)

_BytePrint
.(
	lda (tmp0),y
	sta (tmp1),y
	iny
	rts
.)


_DisplayFrame
.(
	lda _PtrGraphic+0
	sta tmp0+0
	lda _PtrGraphic+1
	sta tmp0+1
		
	; set startaddress of video 
	
	lda #<$a002
	sta tmp1+0
	lda #>$a002
	sta tmp1+1			
	
	; Draw loop
	.(
	; 120 lines per frame)
	ldx #120	
loop
	ldy #0
	; now print 38 bytes (1byte=6pixels, image=120 pixels accross, so 20 bytes required
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint	
	
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	jsr _BytePrint
	
	.(
	clc
	lda tmp0+0
	adc #20	
	sta tmp0+0
	bcc skip
	inc tmp0+1
skip	
	.)

	jsr _Add40
			
	dex
	bne loop
	.)
		
	; Update PtrGraphic 
	lda tmp0+0
	sta _PtrGraphic+0
	lda tmp0+1
	sta _PtrGraphic+1
	
	rts
.)

_DrawFrame
.(
	.(
	ldx _Frame
loop
	beq end
	clc
	lda _PtrGraphic+0
	; 20 bytes (120 pixels) * 120 lines = 
	; add lower half 2400 to lower half of ptrgraph
	adc #<2400
	sta _PtrGraphic+0
	bcc skip
	inc _PtrGraphic+1	
skip
	; add upper half of 2400 to upper half of ptrgraph
	clc
	lda _PtrGraphic+1
	adc #>2400
	sta _PtrGraphic+1
	
	dex
	jmp loop
end	
	.)

	jmp _DisplayFrame
.)


; set ink to LEFT of video playback
_VideoInkLeft
.(
	ldx #120
	lda #<$a001
	sta tmp1+0
	lda #>$a001
	sta tmp1+1
	ldy #0
loop
	lda _InkColor
	sta (tmp1),y
	jsr _Add40
	dex
	bne loop
	rts
.)



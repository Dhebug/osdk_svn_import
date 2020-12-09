;char *strcpy(s1, s2)
_strcpy
	jsr get_2ptr

_strcpymc
	ldx op1
        stx strcpyend+3
	lda op1+1
        sta strcpyend+1
	sta tmp
	ldy #0
strcpyloop
	lda (op2),Y
	sta (op1),Y
	beq strcpyend
	iny
	bne strcpyloop
	inc op1+1
	inc op2+1
	jmp strcpyloop
strcpyend
        lda #$01
        ldx #$03
	rts

get_2ptr
	ldy #0
	lda (sp),y
	sta op1
	iny
	lda (sp),y
	sta op1+1

	ldy #2
	lda (sp),y
	sta op2
	iny
	lda (sp),y
	sta op2+1
	rts


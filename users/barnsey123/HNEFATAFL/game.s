
_incmodeone
	inc _modeonevalid
	rts
	
_incroute
	inc _route
	rts

_decroute
	dec _route
	rts

_incpoints
	inc _points
	rts
	
_decpoints
.(
	dec _points
	bne end
	inc _points
end
	rts
.)	
	
_setpoints
	lda #10
	sta _points
	rts
	
_doublepoints
	clc
	lda _points
	adc #10
	sta _points
	rts

_incsurround
	inc _surrounded
	rts
	
; multiply the points around king depending on the "surrounded" figure	
_surroundpoints
.(
	lda _points
	ldx _surrounded
loop	
	beq end
	clc
	adc #10
	dex
	bne loop
end	
	sta _point
	rts
.)	
	
_inccounter
	inc _counter
	rts

_zerocounter
	lda #0
	sta _counter
	rts

_zerofoundpiece
	lda #0
	sta _foundpiece
	rts
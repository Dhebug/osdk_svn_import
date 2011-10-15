;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -----------------------------------
;;            Skool Daze
;;         The Oric Version
;; -----------------------------------
;;			(c) Chema 2011
;;         enguita@gmail.com
;; -----------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Program tail and screen
;; -----------------------


; Strings that cannot be compressed
names_extras
	.asc "        "
empty_st
	.byt 0
st_char_names
	.asc "ERIC"
	.byt 0
	.dsb 9,0
	.asc "EINSTEIN"
	.byt 0
	.dsb 5,0
	.asc "ANGELFACE"
	.byt 0
	.dsb 4,0
	.asc "BOY WANDER"
	.byt 0
	.dsb 3,0
st_teacher_names
	.asc "MR ROCKITT"
	.byt 0
	.dsb 3,0
	.asc "MR WACKER"
	.byt 0
	.dsb 4,0
	.asc "MR WITHIT"
	.byt 0
	.dsb 4,0
	.asc "MR CREAK"
	.byt 0
	.dsb 5,0
	.asc "Please Sir - I cannot tell a lie . . "
	.byt 0
	.asc "REVISION"
	.byt 0
number_template
	.byt "000",0
number_question
	.byt "12 X 32",0
number_answer
	.byt "1234",0

st_safeletter
	.byt 0,0
st_space
	.asc " ",0


st_lines
	.asc "000 lines"
	.byt 0



freespace
.dsb $a000-*
_LabelPicture

_HiresScreenData
/*	Quitar 24 en total */
/*
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$40,$47,$70,$40,$40,$40,$4e,$40,$40,$40,$7f,$7f,$01,$5f,$7f,$43,$7f,$77,$7f,$7c,$4f,$7f,$7f,$7f,$7f,$7c,$4f,$03,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$40,$6f,$60,$40,$40,$40,$4e,$40,$45,$54,$7f,$7f,$01,$5f,$7f,$43,$78,$4b,$7f,$7e,$4f,$7f,$7f,$7f,$7f,$7c,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$41,$5f,$40,$40,$40,$40,$4e,$40,$42,$68,$7f,$7f,$01,$5f,$7f,$41,$7f,$61,$7f,$7e,$4f,$7f,$7f,$7f,$7f,$7c,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$42,$7e,$40,$40,$40,$40,$4e,$40,$45,$54,$7f,$7f,$01,$4f,$7f,$40,$7f,$7e,$7f,$7e,$5f,$7f,$7f,$7f,$7f,$78,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$45,$7c,$40,$40,$40,$40,$46,$40,$42,$68,$7f,$7f,$01,$4f,$87,$60,$11,$40,$40,$40,$40,$40,$10,$01,$7f,$78,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$4b,$78,$40,$40,$40,$40,$46,$40,$45,$54,$7f,$7f,$01,$47,$87,$78,$11,$40,$40,$42,$50,$40,$10,$01,$7f,$70,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$57,$70,$40,$40,$40,$40,$46,$40,$42,$68,$7f,$7f,$01,$47,$87,$7c,$01,$7f,$7f,$7e,$5f,$7f,$7f,$7f,$7f,$70,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$03,$6f,$60,$40,$40,$40,$40,$47,$40,$45,$54,$7f,$7f,$01,$47,$87,$7e,$01,$7f,$7f,$7e,$4f,$7f,$7f,$7f,$7f,$70,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$03,$41,$5f,$40,$40,$40,$40,$40,$47,$40,$42,$68,$7f,$7f,$01,$43,$87,$7f,$01,$7f,$7f,$7e,$47,$7f,$7f,$7f,$7f,$60,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$03,$42,$7e,$40,$40,$40,$40,$40,$47,$40,$45,$54,$7f,$7f,$01,$43,$87,$7f,$01,$7f,$7f,$7c,$00,$11,$40,$40,$41,$10,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$03,$45,$7c,$40,$40,$40,$40,$40,$43,$40,$42,$6a,$7f,$7f,$60,$07,$7f,$7d,$01,$7f,$7f,$7c,$00,$11,$40,$40,$41,$10,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$03,$53,$78,$40,$40,$40,$40,$40,$43,$40,$41,$54,$7f,$7f,$70,$07,$7f,$7c,$01,$7f,$7f,$7c,$4f,$7f,$7f,$7f,$7e,$40,$83,$5e,$55,$55
*/
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$03,$6f,$70,$40,$40,$40,$40,$40,$43,$40,$42,$6a,$7f,$7f,$70,$07,$7f,$7f,$01,$7f,$7f,$7c,$4f,$7f,$7f,$7f,$7c,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$41,$5f,$60,$40,$40,$40,$40,$40,$43,$40,$41,$54,$7f,$7f,$70,$07,$5f,$7f,$01,$7f,$7f,$78,$4f,$7f,$7f,$7f,$7c,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$42,$7f,$40,$40,$40,$40,$40,$40,$43,$40,$42,$6a,$7f,$7f,$78,$07,$5f,$7f,$01,$7f,$7f,$78,$47,$7f,$7f,$7f,$7c,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$45,$7e,$40,$40,$40,$40,$40,$40,$43,$60,$41,$54,$7f,$7f,$78,$07,$4f,$7f,$01,$7f,$7f,$78,$43,$7f,$7f,$7f,$7c,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$4b,$7c,$40,$40,$40,$40,$40,$40,$41,$60,$42,$6a,$7f,$7f,$78,$07,$47,$7e,$01,$7f,$7f,$79,$51,$7f,$7e,$4f,$50,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$57,$78,$40,$40,$40,$40,$40,$40,$41,$60,$41,$54,$7f,$7f,$78,$07,$43,$7c,$01,$5f,$7f,$70,$41,$7f,$7f,$47,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$6f,$70,$4e,$5e,$7b,$74,$66,$7c,$41,$60,$42,$6a,$5f,$7f,$78,$07,$41,$7c,$01,$5f,$7f,$70,$55,$7f,$7f,$46,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$03,$41,$5f,$60,$f4,$e7,$dc,$f9,$d7,$cf,$41,$60,$41,$55,$5f,$7f,$78,$07,$40,$78,$01,$4f,$7f,$60,$69,$7f,$7f,$44,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$03,$42,$7f,$40,$f4,$ef,$cd,$fa,$d7,$df,$41,$70,$40,$6a,$5f,$7f,$78,$07,$40,$01,$49,$4f,$7f,$64,$54,$7f,$7f,$40,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$03,$45,$7e,$40,$f1,$e1,$dc,$cb,$d9,$c3,$40,$70,$41,$55,$5f,$7f,$78,$40,$01,$40,$42,$77,$7f,$6a,$6a,$5f,$7f,$40,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$03,$53,$7c,$40,$ff,$ff,$ff,$ff,$ff,$ff,$40,$70,$40,$6a,$5f,$7f,$78,$40,$01,$40,$41,$51,$7f,$55,$55,$5f,$7f,$40,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$03,$6f,$78,$40,$ff,$c6,$cc,$dc,$d0,$ff,$40,$70,$41,$55,$5f,$7f,$78,$40,$01,$40,$4a,$6a,$78,$68,$6a,$47,$7f,$40,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$03,$41,$5f,$70,$40,$ff,$dd,$f5,$eb,$f3,$ff,$40,$70,$40,$6a,$5f,$7f,$78,$40,$01,$45,$55,$55,$44,$55,$55,$47,$7f,$60,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$03,$42,$7f,$60,$40,$ff,$cd,$f4,$db,$f7,$ff,$40,$70,$41,$55,$5f,$7f,$78,$40,$01,$42,$6a,$6a,$6a,$68,$6a,$67,$7f,$60,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$03,$45,$7f,$40,$40,$40,$61,$72,$53,$6f,$40,$40,$78,$40,$6a,$5f,$7f,$78,$40,$01,$45,$45,$55,$55,$55,$55,$53,$7f,$70,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$03,$5b,$7e,$40,$40,$40,$40,$40,$40,$40,$40,$40,$78,$41,$55,$5f,$7f,$78,$40,$01,$40,$6a,$6a,$42,$68,$6a,$63,$7f,$70,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$03,$77,$7c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40,$6a,$6f,$7f,$78,$40,$01,$45,$55,$55,$55,$45,$55,$55,$7f,$78,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$03,$41,$6f,$78,$40,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40,$55,$4f,$7f,$78,$40,$01,$48,$6a,$6a,$60,$48,$40,$61,$7f,$78,$40,$40,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$03,$42,$5f,$70,$40,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40,$6a,$6f,$7f,$78,$40,$01,$45,$55,$55,$44,$54,$45,$44,$7f,$78,$40,$40,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$03,$45,$7f,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40,$55,$4f,$7f,$78,$40,$01,$48,$6a,$6a,$40,$40,$40,$6a,$5f,$78,$07,$41,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$03,$4b,$7f,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$5c,$40,$6a,$6f,$7f,$78,$40,$01,$45,$55,$55,$51,$54,$55,$45,$4f,$78,$07,$43,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$03,$57,$7e,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$5c,$40,$55,$4f,$7f,$78,$40,$01,$40,$6a,$6a,$60,$40,$4a,$6a,$6f,$78,$07,$47,$83,$5e,$55,$55
	.byt $40,$40,$40,$03,$41,$6f,$7c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$5c,$40,$6a,$6f,$7f,$78,$40,$01,$45,$55,$55,$40,$50,$55,$55,$4f,$78,$07,$47,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$03,$43,$5f,$78,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$4c,$40,$55,$57,$7f,$78,$40,$01,$40,$6a,$6a,$60,$40,$4a,$60,$67,$70,$07,$4f,$83,$5e,$55,$55
	.byt $40,$40,$40,$03,$46,$7f,$70,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$4c,$40,$4a,$67,$7f,$78,$40,$01,$45,$55,$55,$50,$41,$45,$50,$53,$60,$07,$4f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$03,$4d,$7f,$60,$07,$41,$40,$40,$40,$40,$40,$40,$40,$03,$4c,$40,$55,$57,$7f,$78,$40,$01,$40,$6a,$6a,$60,$40,$62,$60,$48,$40,$07,$4f,$83,$5e,$55,$55
	.byt $40,$40,$40,$03,$53,$7f,$40,$07,$43,$40,$40,$40,$40,$40,$40,$40,$03,$4c,$40,$4a,$67,$7f,$78,$40,$01,$45,$55,$55,$50,$41,$55,$50,$40,$40,$07,$5f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$03,$6f,$7e,$40,$07,$43,$40,$40,$40,$40,$40,$40,$40,$03,$4c,$40,$55,$57,$7f,$78,$40,$01,$40,$6a,$6a,$60,$40,$6a,$60,$42,$40,$07,$7f,$83,$5e,$55,$55
	.byt $40,$40,$03,$41,$5f,$7c,$40,$07,$43,$40,$40,$40,$40,$40,$40,$40,$03,$4e,$40,$4a,$67,$7f,$7c,$40,$01,$41,$55,$55,$50,$45,$55,$50,$41,$07,$41,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$03,$42,$7f,$78,$40,$07,$43,$60,$40,$40,$40,$40,$40,$40,$03,$4e,$40,$45,$57,$7f,$7e,$40,$01,$40,$6a,$6a,$60,$40,$6a,$60,$42,$07,$43,$7f,$83,$5e,$55,$55
	.byt $40,$40,$03,$4d,$7f,$70,$40,$07,$41,$60,$40,$40,$40,$40,$40,$40,$03,$46,$40,$4a,$67,$7f,$7e,$40,$01,$41,$55,$55,$50,$43,$55,$50,$41,$07,$47,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$03,$5b,$7f,$60,$40,$07,$41,$60,$40,$40,$40,$40,$40,$5c,$03,$46,$40,$45,$57,$7f,$7f,$40,$01,$40,$6a,$6a,$60,$40,$6a,$60,$42,$07,$47,$7f,$83,$5e,$55,$55
	.byt $40,$40,$03,$77,$7f,$40,$40,$07,$41,$60,$40,$40,$40,$40,$60,$7e,$03,$46,$40,$4a,$67,$7f,$7f,$60,$01,$41,$55,$55,$50,$45,$55,$50,$41,$07,$47,$7f,$83,$5e,$6a,$6a
	.byt $40,$03,$41,$6f,$7e,$40,$40,$07,$41,$60,$40,$40,$40,$41,$61,$73,$03,$46,$40,$45,$57,$7f,$7f,$60,$01,$40,$6a,$6a,$60,$40,$6a,$60,$42,$07,$47,$7f,$83,$5e,$55,$55
	.byt $40,$03,$43,$5f,$7c,$40,$40,$07,$40,$70,$40,$40,$40,$43,$61,$73,$03,$46,$40,$4a,$67,$7f,$7f,$70,$01,$40,$55,$55,$50,$43,$55,$50,$44,$07,$47,$7f,$83,$5e,$6a,$6a
	.byt $40,$03,$44,$7f,$78,$40,$40,$07,$40,$70,$40,$40,$40,$47,$61,$63,$03,$46,$40,$45,$53,$7f,$7f,$70,$01,$40,$6a,$6a,$60,$40,$6a,$60,$40,$07,$47,$7f,$83,$5e,$55,$55
	.byt $40,$03,$5b,$7f,$70,$40,$40,$07,$40,$70,$40,$40,$40,$47,$61,$66,$03,$47,$40,$4a,$68,$01,$40,$40,$40,$40,$55,$55,$50,$45,$55,$50,$40,$40,$40,$40,$03,$5e,$6a,$6a
	.byt $40,$03,$77,$7f,$60,$40,$07,$46,$40,$78,$40,$40,$40,$4f,$63,$6c,$03,$43,$40,$45,$50,$01,$40,$40,$40,$40,$6a,$6a,$60,$40,$6a,$60,$40,$40,$40,$40,$03,$5e,$55,$55
	.byt $03,$41,$6f,$7f,$40,$40,$07,$4f,$40,$58,$40,$40,$40,$5f,$63,$7c,$03,$43,$40,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$50,$42,$55,$40,$40,$06,$47,$7f,$83,$5e,$6a,$6a
	.byt $03,$43,$5f,$7e,$40,$40,$07,$59,$60,$58,$4c,$40,$40,$5d,$63,$78,$03,$43,$40,$45,$50,$06,$7f,$78,$01,$40,$6a,$6a,$60,$40,$6a,$68,$40,$06,$4f,$7f,$83,$5e,$55,$55
	.byt $03,$46,$7f,$7c,$40,$40,$07,$50,$60,$58,$4c,$40,$40,$7d,$63,$71,$03,$43,$40,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$58,$45,$55,$54,$40,$06,$5f,$7f,$83,$5e,$6a,$6a
	.byt $03,$4d,$7f,$78,$40,$40,$07,$50,$78,$5c,$4c,$40,$41,$79,$63,$73,$03,$43,$40,$45,$54,$06,$7f,$78,$01,$40,$6a,$6a,$6c,$40,$6a,$68,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$5b,$7f,$70,$40,$40,$07,$58,$58,$4c,$58,$40,$41,$71,$63,$73,$03,$43,$60,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$50,$43,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$57,$7f,$60,$40,$40,$07,$58,$4c,$4c,$70,$40,$41,$71,$61,$73,$03,$43,$60,$45,$54,$06,$7f,$78,$01,$40,$6a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$6f,$7f,$40,$40,$40,$07,$58,$44,$4f,$70,$40,$40,$61,$61,$73,$03,$41,$60,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$50,$45,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$5f,$7e,$40,$40,$40,$07,$48,$46,$47,$60,$40,$40,$41,$61,$7b,$03,$41,$60,$41,$54,$06,$7f,$78,$01,$40,$4a,$6a,$60,$42,$6a,$68,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$7f,$7c,$40,$40,$40,$07,$4c,$46,$47,$40,$40,$40,$41,$60,$7e,$03,$41,$60,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$50,$60,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$7f,$78,$40,$40,$40,$07,$46,$46,$46,$40,$40,$40,$41,$60,$5c,$03,$41,$60,$41,$54,$06,$7f,$78,$01,$40,$4a,$6a,$60,$62,$6a,$68,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$7f,$70,$40,$40,$40,$07,$47,$46,$42,$40,$40,$40,$41,$60,$40,$03,$41,$60,$42,$68,$06,$7f,$78,$01,$40,$55,$55,$58,$60,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$7f,$60,$40,$40,$40,$07,$43,$46,$40,$40,$40,$40,$41,$60,$40,$03,$41,$70,$41,$54,$06,$7f,$7c,$01,$40,$4a,$6a,$68,$62,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$7f,$40,$40,$40,$40,$07,$41,$66,$40,$40,$40,$40,$61,$62,$40,$03,$41,$70,$42,$6a,$06,$7f,$7c,$01,$40,$55,$55,$71,$60,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$7e,$40,$40,$40,$40,$07,$41,$7e,$40,$40,$40,$41,$61,$66,$40,$03,$40,$70,$41,$54,$06,$7f,$7c,$01,$40,$4a,$6a,$61,$62,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$7c,$40,$40,$40,$07,$47,$40,$7e,$40,$40,$40,$41,$61,$6c,$40,$03,$40,$70,$40,$6a,$06,$7f,$7c,$01,$40,$55,$55,$61,$64,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$78,$40,$40,$40,$07,$5f,$60,$58,$40,$40,$40,$4f,$61,$6c,$40,$03,$40,$70,$41,$54,$06,$7f,$7c,$01,$40,$6a,$6a,$61,$62,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $03,$70,$40,$40,$07,$40,$78,$70,$40,$40,$40,$40,$5f,$71,$78,$40,$03,$40,$70,$40,$6a,$06,$7f,$7c,$01,$40,$55,$55,$60,$61,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $03,$60,$40,$40,$07,$41,$70,$70,$40,$40,$40,$40,$59,$71,$78,$40,$03,$40,$70,$41,$54,$06,$7f,$7c,$01,$41,$6a,$6a,$60,$60,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$41,$70,$58,$40,$40,$47,$40,$70,$71,$70,$40,$03,$40,$70,$40,$6a,$06,$7f,$7e,$01,$41,$55,$55,$60,$65,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$41,$60,$58,$40,$40,$5f,$60,$70,$79,$70,$40,$03,$40,$70,$41,$54,$06,$7f,$7f,$01,$41,$6a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$41,$60,$58,$40,$40,$79,$71,$60,$79,$60,$40,$03,$40,$78,$40,$6a,$06,$7f,$7f,$60,$01,$55,$55,$60,$41,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$61,$60,$58,$40,$41,$70,$71,$60,$59,$60,$40,$03,$41,$70,$41,$55,$06,$7f,$7f,$60,$01,$6a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$41,$61,$60,$58,$40,$43,$60,$71,$70,$5d,$40,$40,$03,$41,$70,$40,$6a,$06,$7f,$7f,$40,$01,$55,$55,$60,$45,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$71,$61,$70,$78,$40,$47,$40,$70,$70,$5c,$40,$40,$03,$43,$60,$41,$55,$06,$7f,$7f,$40,$01,$6a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$41,$71,$60,$70,$70,$40,$46,$40,$58,$70,$7c,$40,$40,$03,$43,$60,$40,$6a,$06,$7f,$7f,$40,$01,$55,$55,$40,$42,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$47,$78,$41,$71,$60,$7b,$70,$40,$4e,$40,$58,$58,$70,$40,$40,$03,$47,$40,$40,$55,$06,$7f,$7f,$40,$01,$4a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$4f,$7e,$40,$79,$60,$5f,$60,$40,$46,$40,$58,$5d,$60,$40,$40,$03,$47,$40,$40,$6a,$06,$7f,$7f,$40,$01,$45,$55,$40,$45,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$5f,$7f,$40,$7d,$60,$4e,$40,$40,$47,$40,$58,$5f,$60,$40,$40,$03,$4e,$40,$40,$55,$06,$7f,$7f,$40,$01,$4a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$7f,$7f,$60,$7d,$60,$40,$40,$40,$47,$40,$58,$4f,$40,$40,$40,$03,$4e,$40,$40,$6a,$06,$7f,$7f,$40,$01,$45,$55,$40,$42,$55,$50,$40,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $41,$7f,$73,$70,$7d,$60,$40,$40,$40,$43,$40,$4c,$46,$40,$40,$40,$03,$5c,$40,$40,$55,$06,$7f,$7f,$40,$01,$4a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $43,$7e,$43,$70,$5f,$60,$40,$40,$40,$43,$40,$4c,$40,$40,$40,$40,$03,$5c,$40,$40,$6a,$06,$7f,$7f,$60,$01,$45,$55,$40,$45,$55,$50,$50,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $47,$7c,$43,$70,$5f,$60,$40,$40,$40,$43,$60,$4c,$40,$40,$40,$40,$03,$7c,$40,$40,$55,$06,$7f,$7f,$60,$01,$4a,$6a,$60,$40,$6a,$60,$40,$06,$7f,$7f,$83,$5e,$55,$55
	.byt $4f,$70,$41,$70,$5f,$70,$40,$40,$40,$43,$60,$4c,$40,$40,$40,$40,$03,$78,$40,$40,$6a,$06,$7f,$7f,$60,$01,$45,$55,$50,$62,$55,$50,$50,$06,$7f,$7f,$83,$5e,$6a,$6a
	.byt $47,$70,$41,$70,$4f,$70,$40,$40,$40,$41,$60,$5c,$40,$40,$40,$03,$41,$78,$40,$40,$55,$06,$7f,$7f,$60,$01,$4a,$6a,$60,$60,$6a,$06,$6f,$41,$7f,$7f,$83,$5e,$55,$55
	.byt $47,$70,$41,$70,$4f,$7c,$40,$40,$40,$41,$60,$5c,$40,$40,$40,$03,$41,$70,$40,$40,$6a,$06,$7f,$7f,$70,$01,$45,$55,$40,$65,$55,$06,$4f,$71,$7f,$7f,$83,$5e,$6a,$6a
	.byt $47,$70,$40,$60,$4f,$7f,$40,$40,$40,$41,$70,$5c,$40,$40,$40,$03,$43,$70,$40,$40,$55,$06,$7f,$7f,$78,$01,$4a,$6a,$40,$60,$6a,$06,$6f,$79,$7f,$7f,$83,$5e,$55,$55
	.byt $47,$78,$40,$40,$47,$4f,$60,$40,$40,$40,$70,$58,$40,$40,$40,$03,$43,$60,$40,$40,$6a,$06,$7f,$7f,$7e,$01,$45,$55,$40,$61,$55,$06,$4f,$7d,$7f,$7f,$83,$5e,$6a,$6a
	.byt $47,$78,$40,$40,$47,$43,$70,$40,$40,$40,$70,$78,$40,$40,$40,$03,$47,$60,$40,$40,$55,$06,$7f,$7f,$7f,$01,$4a,$6a,$40,$60,$6a,$06,$6f,$7d,$7f,$7f,$83,$5e,$55,$55
	.byt $47,$7c,$40,$40,$43,$61,$78,$40,$40,$40,$78,$70,$40,$40,$40,$03,$47,$40,$40,$40,$4a,$06,$7f,$7f,$7f,$7f,$65,$55,$40,$50,$55,$50,$4f,$7d,$7f,$7f,$83,$5e,$6a,$6a
	.byt $43,$7e,$40,$40,$43,$60,$78,$40,$40,$40,$79,$70,$40,$40,$40,$03,$4f,$40,$40,$40,$55,$06,$7f,$7f,$7f,$7f,$6a,$6a,$40,$50,$6a,$60,$6f,$7d,$7f,$7f,$83,$5e,$55,$55
	.byt $43,$7f,$60,$40,$41,$70,$50,$40,$40,$40,$5f,$62,$40,$40,$40,$03,$4e,$40,$40,$40,$4a,$06,$7f,$7f,$7f,$7f,$6d,$55,$40,$50,$55,$50,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $43,$7f,$78,$58,$41,$70,$40,$40,$40,$03,$e0,$42,$40,$40,$40,$03,$5e,$40,$40,$40,$55,$06,$5f,$7f,$7f,$7f,$6e,$6a,$40,$50,$6a,$60,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$7f,$7f,$7c,$41,$70,$40,$40,$40,$40,$5e,$44,$70,$40,$40,$03,$5c,$40,$40,$40,$4a,$06,$5f,$7f,$7f,$7f,$6f,$55,$40,$58,$45,$51,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$4f,$7f,$7e,$41,$78,$40,$40,$40,$03,$e0,$7d,$7e,$40,$40,$03,$7c,$40,$40,$40,$55,$06,$5f,$7f,$7f,$7f,$6f,$6a,$40,$58,$4a,$60,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$47,$7f,$7f,$40,$78,$40,$40,$40,$40,$03,$55,$58,$40,$40,$03,$78,$40,$40,$40,$4a,$06,$5f,$7f,$7f,$7f,$6f,$55,$40,$58,$55,$50,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$47,$7f,$7f,$40,$78,$40,$40,$40,$03,$60,$40,$40,$60,$03,$41,$78,$40,$40,$40,$55,$06,$5f,$7f,$7f,$7f,$6f,$6a,$40,$58,$6a,$60,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$5f,$40,$58,$40,$40,$03,$43,$40,$40,$75,$40,$03,$41,$78,$40,$40,$40,$4a,$06,$4f,$7f,$7f,$7f,$6f,$54,$40,$58,$55,$50,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$4f,$60,$40,$40,$40,$03,$44,$40,$40,$46,$40,$03,$43,$70,$40,$40,$40,$55,$06,$4f,$7f,$7f,$7f,$6f,$68,$40,$58,$6a,$68,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$4f,$60,$40,$40,$40,$03,$4f,$60,$50,$63,$50,$03,$43,$70,$40,$40,$40,$4a,$06,$47,$7f,$7f,$7f,$5f,$40,$40,$59,$55,$50,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$4f,$60,$40,$40,$40,$03,$7c,$4e,$44,$44,$6c,$03,$47,$60,$40,$40,$40,$55,$06,$47,$7f,$7f,$7f,$5e,$4a,$40,$5a,$6a,$40,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$4f,$40,$40,$40,$03,$41,$71,$40,$42,$7a,$40,$03,$47,$60,$40,$40,$40,$4a,$06,$47,$7f,$7f,$7f,$5c,$55,$40,$59,$41,$40,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$4f,$40,$40,$40,$03,$41,$64,$40,$58,$55,$40,$03,$4f,$40,$40,$40,$40,$55,$06,$43,$7f,$7f,$7f,$5a,$6a,$40,$5a,$4a,$60,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$4f,$40,$40,$40,$03,$43,$70,$40,$4c,$66,$40,$03,$4f,$40,$40,$40,$40,$4a,$06,$43,$7f,$7f,$7f,$5d,$55,$50,$58,$55,$41,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$4f,$40,$40,$40,$03,$43,$60,$44,$40,$42,$54,$60,$5e,$40,$40,$40,$40,$45,$06,$41,$7f,$7f,$7e,$7e,$6a,$40,$58,$6a,$40,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$4f,$40,$40,$40,$03,$47,$40,$41,$50,$40,$40,$40,$5e,$40,$40,$40,$40,$4a,$60,$06,$7f,$7f,$7e,$7d,$50,$44,$58,$44,$50,$4f,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$5e,$40,$40,$40,$03,$46,$40,$51,$62,$74,$44,$5c,$7c,$40,$40,$40,$40,$45,$50,$06,$7f,$7f,$7e,$7a,$6a,$63,$58,$48,$42,$6f,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$5e,$40,$40,$40,$03,$4e,$41,$48,$07,$54,$40,$7e,$7c,$40,$40,$40,$03,$4a,$60,$06,$7f,$7f,$7e,$7d,$50,$40,$58,$40,$40,$57,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$5c,$40,$40,$40,$03,$5c,$42,$07,$59,$76,$40,$5e,$5c,$40,$40,$40,$03,$45,$50,$06,$7f,$7f,$7e,$7a,$68,$41,$58,$48,$40,$4b,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$7c,$40,$40,$40,$03,$58,$07,$58,$7b,$7f,$40,$5f,$58,$40,$40,$40,$03,$42,$68,$06,$7f,$7f,$7e,$7c,$40,$40,$58,$40,$40,$43,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$47,$41,$78,$40,$40,$40,$03,$7b,$5d,$07,$77,$7f,$40,$4f,$04,$40,$40,$40,$03,$45,$50,$06,$7f,$7f,$7f,$58,$40,$40,$5c,$40,$40,$43,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$47,$43,$70,$40,$40,$40,$03,$76,$07,$6b,$7f,$7f,$60,$47,$04,$4f,$78,$40,$03,$42,$68,$06,$7f,$7f,$7f,$50,$40,$40,$5c,$40,$40,$41,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$47,$7f,$70,$40,$40,$40,$03,$62,$46,$47,$87,$7f,$70,$47,$04,$5b,$7c,$40,$03,$41,$54,$06,$7f,$7f,$7f,$4c,$40,$40,$5c,$4c,$40,$41,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$43,$7f,$60,$40,$40,$40,$03,$6c,$07,$4f,$7f,$7f,$7f,$47,$04,$75,$7e,$40,$03,$42,$68,$06,$7f,$7f,$7e,$7c,$40,$40,$5c,$4c,$40,$40,$7f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$41,$7f,$60,$40,$40,$40,$03,$60,$07,$7f,$7f,$7f,$7f,$67,$04,$6b,$7f,$40,$03,$41,$54,$06,$7f,$7f,$7e,$70,$40,$40,$5e,$44,$40,$40,$7f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$79,$41,$87,$7f,$79,$7f,$77,$04,$55,$5f,$60,$03,$42,$68,$06,$7f,$7f,$7e,$70,$40,$40,$5e,$40,$40,$40,$5f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$58,$47,$87,$7f,$77,$7f,$7f,$04,$6a,$6b,$70,$03,$41,$54,$06,$7f,$7f,$7e,$70,$40,$40,$5f,$40,$40,$40,$5f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$50,$4f,$87,$7f,$6f,$7f,$7e,$04,$45,$55,$78,$03,$40,$6a,$06,$7f,$7f,$7e,$50,$40,$40,$5f,$68,$60,$40,$4f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$58,$5f,$87,$7f,$5f,$47,$7f,$84,$4a,$6a,$7c,$03,$41,$54,$06,$7f,$7f,$7e,$50,$40,$40,$5f,$74,$50,$40,$4f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$50,$87,$7f,$7e,$7c,$47,$7f,$84,$55,$55,$57,$03,$40,$6a,$06,$7f,$7f,$7f,$58,$40,$40,$6f,$7a,$4c,$40,$4f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$5c,$87,$7f,$7d,$7a,$4f,$7f,$84,$6a,$6a,$6b,$60,$03,$54,$06,$7f,$7f,$7f,$4c,$40,$41,$57,$7c,$46,$40,$4f,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$4a,$87,$7f,$73,$7a,$4f,$7f,$84,$55,$55,$55,$70,$03,$6a,$06,$7f,$7f,$7f,$4f,$60,$42,$6b,$7a,$40,$40,$4f,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$4d,$87,$7f,$7f,$77,$5f,$7e,$84,$7a,$6a,$6a,$78,$03,$54,$06,$7f,$7f,$7f,$66,$40,$45,$55,$7d,$40,$40,$57,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$46,$87,$7f,$7f,$70,$7f,$7f,$4e,$04,$55,$55,$5c,$03,$6a,$06,$7f,$7f,$7f,$66,$40,$4a,$6b,$7e,$68,$40,$6b,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$44,$f0,$87,$7f,$77,$7f,$7f,$6e,$04,$6a,$6a,$6e,$03,$55,$06,$7f,$7f,$7f,$70,$40,$55,$55,$7f,$54,$41,$55,$7f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$41,$6f,$87,$7f,$7f,$7f,$7f,$66,$04,$55,$55,$56,$03,$6a,$06,$7f,$7f,$7f,$70,$40,$6a,$6a,$7e,$6a,$6a,$6a,$7f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$03,$03,$e8,$87,$7f,$7f,$7f,$4f,$74,$04,$6a,$6a,$6b,$03,$55,$06,$7f,$7f,$7f,$7c,$41,$55,$55,$7f,$55,$55,$55,$5f,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$67,$7c,$7d,$7f,$5c,$77,$74,$04,$55,$55,$57,$03,$4a,$06,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$7f,$6a,$6a,$6a,$6f,$7f,$83,$5e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$4b,$78,$7e,$7f,$6b,$7b,$70,$04,$6a,$6a,$6b,$03,$55,$06,$7f,$7f,$7f,$7f,$45,$55,$55,$5f,$75,$55,$55,$57,$7f,$83,$5e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$53,$73,$63,$5f,$6f,$7d,$70,$04,$55,$55,$55,$60,$06,$41,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$7f,$7a,$6a,$6a,$6b,$7f,$03,$4e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$49,$66,$43,$5f,$4f,$4f,$70,$04,$6a,$6a,$7b,$70,$06,$41,$7f,$7f,$7f,$7f,$75,$55,$55,$5f,$7d,$55,$55,$54,$40,$83,$6e,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$45,$6d,$47,$6f,$4e,$67,$60,$04,$55,$57,$7d,$78,$06,$43,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6f,$7a,$68,$40,$42,$7f,$83,$6e,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$42,$7b,$67,$6c,$5e,$67,$60,$04,$6a,$6b,$7e,$7c,$06,$43,$7f,$7f,$7f,$7f,$7d,$55,$55,$5c,$40,$41,$55,$55,$5f,$83,$76,$55,$55
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$5b,$4f,$70,$7d,$57,$60,$04,$55,$57,$7d,$5e,$06,$47,$7f,$7f,$7f,$7f,$7e,$60,$40,$43,$7e,$6a,$6a,$6a,$6f,$83,$76,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$4c,$7f,$7f,$7d,$57,$04,$6a,$6a,$6b,$7e,$7f,$06,$47,$7f,$7f,$7e,$40,$40,$45,$55,$57,$7f,$55,$55,$55,$57,$83,$76,$55,$55
	.byt $40,$44,$40,$40,$40,$40,$40,$40,$40,$40,$47,$7f,$7f,$7c,$6f,$04,$55,$55,$55,$7d,$5f,$06,$47,$78,$40,$41,$7f,$7e,$6a,$6a,$6b,$7e,$6a,$6a,$6a,$6b,$83,$7a,$6a,$60
	.byt $40,$64,$40,$40,$40,$40,$40,$40,$40,$40,$43,$7f,$7f,$78,$5f,$04,$6a,$6a,$6a,$7e,$6f,$06,$40,$47,$7f,$7f,$7f,$7f,$75,$55,$55,$7f,$55,$55,$55,$55,$7f,$7a,$40,$40
	.byt $40,$64,$40,$40,$40,$40,$40,$40,$40,$40,$43,$7f,$7f,$61,$7f,$04,$55,$55,$55,$5d,$57,$60,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6b,$7f,$6a,$6a,$6a,$6a,$70,$40,$40,$45
	.byt $40,$68,$40,$40,$40,$40,$40,$40,$40,$40,$41,$7f,$7f,$4f,$7f,$04,$6a,$6a,$6a,$6e,$6f,$70,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$7f,$55,$55,$50,$40,$4f,$7f,$6a,$6a
	.byt $40,$7c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$7f,$7f,$7f,$7e,$04,$55,$55,$55,$55,$57,$70,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$7f,$68,$40,$42,$6a,$6f,$7f,$75,$55
	.byt $40,$6b,$40,$48,$40,$40,$40,$40,$40,$40,$40,$4e,$7f,$7f,$7c,$04,$7f,$6a,$6a,$6a,$6b,$78,$06,$7f,$7f,$7f,$7f,$7f,$7f,$55,$50,$40,$45,$55,$55,$55,$57,$7f,$7a,$6a
	.byt $41,$60,$60,$50,$40,$40,$40,$40,$40,$40,$40,$47,$40,$5f,$70,$04,$7f,$7f,$55,$55,$55,$7c,$06,$7f,$7f,$7f,$7f,$7f,$7c,$40,$42,$7f,$7a,$6a,$6a,$6a,$6b,$7f,$7f,$55
	.byt $41,$60,$50,$60,$40,$40,$40,$40,$40,$40,$40,$40,$7f,$7f,$04,$4b,$7f,$7f,$6a,$6a,$6a,$7c,$06,$7f,$7f,$7f,$7e,$40,$43,$55,$55,$5f,$75,$55,$55,$55,$55,$7f,$7f,$6a
	.byt $42,$60,$51,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$04,$57,$7f,$7f,$75,$55,$55,$7c,$06,$7f,$7c,$40,$41,$7f,$7e,$6a,$6a,$6f,$7a,$6a,$6a,$6a,$6a,$7f,$7f,$7d
	.byt $42,$40,$51,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$04,$6f,$40,$47,$7a,$6a,$6a,$7e,$06,$40,$40,$7f,$7f,$7f,$7f,$55,$55,$57,$7d,$55,$55,$55,$55,$5d,$7f,$7e
	.byt $44,$43,$4a,$40,$40,$40,$40,$40,$40,$40,$40,$44,$5d,$55,$04,$5e,$40,$41,$7d,$55,$55,$5e,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6b,$7a,$6a,$6a,$6a,$6a,$6a,$7f,$7f
	.byt $44,$40,$44,$40,$58,$40,$40,$40,$40,$40,$40,$44,$5d,$5a,$04,$7c,$40,$40,$7e,$6a,$6a,$6e,$06,$7f,$7f,$7f,$7f,$7f,$7f,$55,$55,$57,$7d,$55,$55,$55,$55,$55,$5f,$7f
	.byt $44,$40,$44,$40,$5c,$40,$40,$40,$40,$40,$03,$4c,$87,$7c,$04,$58,$40,$40,$5f,$55,$55,$5f,$06,$7f,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6b,$7a,$6a,$6a,$6a,$6a,$6a,$6f,$7f
	.byt $44,$58,$58,$40,$4e,$40,$40,$40,$40,$40,$03,$4c,$87,$7e,$04,$78,$40,$40,$4f,$6a,$6a,$7f,$06,$7f,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$7d,$55,$55,$55,$55,$55,$55,$5f
	.byt $42,$58,$48,$40,$47,$40,$40,$40,$40,$40,$03,$5c,$87,$7e,$04,$58,$40,$40,$4f,$55,$55,$5f,$06,$7f,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$7a,$6a,$6a,$6a,$6a,$6a,$6a,$6f
	.byt $42,$40,$44,$40,$43,$40,$40,$40,$40,$40,$03,$5c,$84,$c1,$42,$78,$40,$40,$4f,$6a,$6a,$6f,$60,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$7d,$55,$55,$55,$55,$55,$55,$57
	.byt $42,$44,$42,$40,$40,$40,$40,$40,$40,$40,$03,$7c,$84,$c1,$43,$50,$40,$40,$47,$55,$55,$57,$60,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$7e,$6a,$6a,$6a,$6a,$6a,$6a,$6b
	.byt $41,$44,$42,$40,$40,$40,$40,$40,$40,$40,$03,$7c,$84,$c2,$42,$60,$40,$40,$47,$6a,$6a,$6b,$70,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$5f,$55,$55,$55,$55,$55,$55,$55
	.byt $41,$5a,$41,$40,$40,$41,$60,$40,$40,$40,$40,$40,$84,$c0,$43,$40,$40,$40,$47,$75,$55,$55,$78,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6f,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$72,$41,$40,$40,$41,$60,$40,$40,$40,$40,$41,$84,$c0,$42,$60,$40,$40,$43,$6a,$6a,$6a,$78,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$57,$75,$55,$55,$55,$55,$55,$55
	.byt $40,$62,$41,$40,$7e,$79,$60,$40,$40,$40,$43,$7f,$84,$c0,$6b,$40,$40,$40,$41,$55,$55,$55,$7c,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6b,$7a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$62,$42,$7d,$78,$5d,$60,$40,$40,$40,$43,$7f,$84,$c0,$42,$60,$40,$40,$42,$6a,$6a,$6a,$7c,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$7d,$55,$55,$55,$55,$55,$55
	.byt $41,$41,$42,$7f,$47,$7d,$60,$40,$40,$40,$43,$7f,$84,$c0,$57,$40,$40,$40,$41,$55,$55,$55,$5c,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$7e,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $42,$40,$64,$40,$7f,$7e,$70,$40,$40,$40,$41,$7f,$7f,$84,$46,$40,$40,$40,$42,$6a,$6a,$6a,$7e,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$5f,$55,$55,$55,$55,$55,$55
	.byt $42,$40,$58,$47,$47,$7f,$50,$40,$40,$40,$40,$41,$7e,$84,$65,$40,$40,$40,$41,$55,$55,$55,$7e,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6e,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $44,$40,$40,$40,$7f,$7f,$60,$40,$40,$40,$40,$40,$40,$84,$46,$40,$40,$40,$42,$68,$6a,$6a,$7e,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$5f,$7f,$70,$40,$40,$03,$5f,$70,$04,$4c,$65,$40,$40,$40,$45,$55,$55,$55,$5f,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$47,$7f,$7f,$78,$40,$40,$03,$5f,$70,$04,$41,$4e,$60,$40,$40,$42,$68,$6a,$6a,$7f,$06,$7f,$7f,$7f,$7f,$7f,$7f,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$4f,$7f,$7f,$78,$40,$40,$03,$7f,$60,$04,$40,$6d,$40,$40,$40,$45,$51,$55,$55,$5f,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6b,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$4f,$7f,$7f,$7c,$40,$40,$03,$7f,$60,$04,$41,$4a,$60,$40,$40,$4a,$68,$6a,$6a,$6f,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$75,$55,$55,$55,$55
	.byt $40,$40,$40,$5f,$5f,$7f,$7c,$40,$03,$41,$7f,$04,$40,$40,$6d,$50,$40,$40,$55,$51,$55,$55,$5f,$60,$06,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6a,$7a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$5e,$5f,$7f,$7e,$40,$03,$41,$7f,$04,$40,$41,$4a,$68,$40,$40,$6a,$60,$6a,$6a,$6f,$60,$06,$7f,$7f,$7f,$7f,$7f,$55,$55,$55,$55,$55,$5d,$55,$55,$55,$55
	.byt $40,$40,$40,$7c,$4f,$7f,$84,$7e,$03,$43,$7e,$04,$40,$40,$45,$54,$40,$41,$55,$61,$55,$55,$5f,$60,$06,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$6a,$6a,$6e,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$7f,$4f,$84,$46,$7f,$03,$43,$7e,$04,$40,$40,$42,$6a,$40,$42,$6f,$40,$6a,$6a,$6f,$60,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$57,$55,$55,$55,$55
	.byt $40,$40,$40,$5f,$57,$84,$4d,$57,$03,$47,$7e,$04,$40,$40,$41,$55,$40,$41,$56,$41,$55,$55,$4f,$70,$06,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$6a,$6a,$6b,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$4f,$57,$84,$7a,$6b,$7c,$83,$7c,$04,$40,$40,$40,$6a,$60,$42,$6e,$42,$6a,$6a,$5f,$70,$06,$7f,$7f,$7f,$7f,$7f,$55,$55,$55,$55,$55,$55,$75,$55,$55,$55
	.byt $40,$40,$40,$47,$7b,$84,$75,$55,$7f,$83,$7c,$04,$40,$40,$44,$55,$50,$41,$56,$45,$55,$54,$5f,$70,$06,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$6a,$6a,$6a,$7a,$6a,$6a,$6a
	.byt $40,$40,$40,$43,$7b,$84,$6a,$6a,$6f,$83,$78,$04,$40,$40,$4e,$4a,$68,$42,$6a,$42,$6a,$40,$5f,$78,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$5d,$55,$55,$55
	.byt $40,$40,$40,$40,$71,$7d,$04,$55,$57,$77,$78,$40,$40,$40,$4f,$45,$54,$41,$5c,$45,$54,$40,$5f,$78,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6a,$6a,$6a,$6e,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$41,$7b,$04,$6a,$6b,$7b,$70,$40,$40,$40,$4f,$62,$6a,$42,$6c,$4a,$68,$40,$6f,$78,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$57,$55,$55,$55
	.byt $40,$40,$40,$40,$03,$c7,$04,$41,$55,$5c,$70,$40,$40,$40,$4f,$71,$55,$41,$5c,$55,$50,$43,$5f,$7c,$06,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$6a,$6a,$6a,$6b,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$49,$40,$40,$6a,$6f,$40,$40,$40,$40,$4f,$70,$6a,$62,$6c,$6a,$60,$42,$6f,$7c,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$55,$55,$55,$55
/*
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$45,$57,$60,$40,$40,$40,$4f,$70,$55,$55,$5c,$54,$40,$45,$55,$7c,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$42,$40,$40,$42,$6b,$78,$40,$40,$40,$4b,$78,$4a,$6a,$6c,$68,$40,$42,$6a,$7c,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$45,$55,$7e,$40,$40,$40,$45,$7c,$45,$55,$5c,$40,$40,$45,$55,$5e,$06,$7f,$7f,$7f,$7f,$7f,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$41,$50,$40,$42,$6a,$6f,$40,$40,$40,$42,$7c,$42,$6a,$7c,$40,$40,$4a,$6a,$6e,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$55,$57,$78,$40,$41,$61,$5e,$41,$55,$5c,$40,$40,$45,$54,$56,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$41,$48,$40,$40,$42,$6b,$7c,$40,$59,$70,$6f,$40,$6a,$7c,$40,$40,$4a,$68,$6e,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$41,$55,$5e,$40,$7d,$78,$57,$41,$55,$78,$40,$40,$55,$51,$5e,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$40,$6a,$6f,$40,$7d,$7c,$4b,$40,$6b,$70,$40,$40,$6a,$60,$6f,$06,$7f,$7f,$7f,$7f,$7f,$75,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$49,$48,$40,$40,$55,$57,$70,$7f,$7e,$45,$60,$55,$70,$40,$41,$50,$41,$57,$06,$7f,$7f,$7f,$7f,$7f,$7a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$40,$4a,$6a,$78,$7f,$6f,$42,$60,$4b,$70,$40,$42,$60,$42,$6f,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$42,$52,$40,$40,$55,$55,$5f,$7f,$67,$65,$50,$47,$70,$40,$50,$40,$45,$57,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$40,$4a,$6a,$6f,$5f,$41,$7e,$60,$4b,$70,$40,$40,$40,$4a,$6f,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$55,$55,$55,$55
*/
	.byt $40,$40,$40,$40,$04,$40,$40,$64,$64,$40,$45,$54,$47,$5f,$60,$7f,$50,$57,$60,$40,$40,$40,$45,$57,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$04,$40,$40,$52,$52,$40,$4a,$60,$4b,$4f,$70,$41,$68,$6b,$60,$40,$40,$40,$4a,$6b,$06,$7f,$7f,$7f,$7f,$7f,$7d,$55,$55,$55,$55,$55,$55,$55,$55,$55
	.byt $40,$40,$40,$40,$04,$40,$40,$40,$40,$40,$45,$40,$47,$47,$78,$40,$45,$57,$60,$40,$40,$40,$55,$57,$06,$7f,$7f,$7f,$7f,$7f,$7e,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a,$6a
	.byt $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	.byt $02,$5c,$44,$42,$40,$48,$58,$40,$40,$40,$40,$40,$40,$40,$40,$44,$40,$4f,$40,$42,$44,$5e,$41,$42,$40,$40,$40,$01,$78,$48,$40,$40,$40,$42,$40,$43,$64,$40,$40,$40
	.byt $02,$62,$40,$40,$40,$48,$64,$40,$40,$60,$40,$40,$40,$40,$40,$44,$40,$48,$60,$40,$44,$51,$40,$42,$40,$40,$01,$41,$44,$40,$40,$40,$41,$42,$40,$44,$54,$40,$40,$40
	.byt $02,$62,$74,$7a,$73,$48,$51,$71,$46,$76,$6b,$70,$5d,$67,$62,$47,$4a,$48,$6c,$6a,$5c,$51,$49,$4e,$68,$40,$01,$41,$45,$69,$63,$63,$4d,$63,$65,$44,$46,$49,$79,$60
	.byt $07,$62,$65,$4a,$68,$68,$49,$4a,$68,$64,$6a,$68,$64,$55,$55,$44,$6a,$48,$62,$6a,$64,$5e,$55,$52,$68,$43,$03,$41,$45,$4a,$42,$54,$69,$42,$55,$44,$45,$55,$54,$50
	.byt $07,$62,$65,$4a,$6a,$68,$65,$4a,$48,$64,$6a,$68,$65,$55,$54,$44,$6a,$48,$6a,$52,$64,$51,$51,$52,$68,$40,$03,$41,$45,$4a,$42,$54,$69,$42,$55,$44,$55,$51,$55,$50
	.byt $02,$5c,$64,$7a,$69,$68,$59,$71,$66,$54,$5a,$68,$5c,$75,$53,$47,$44,$4f,$46,$52,$5c,$51,$4d,$4e,$50,$40,$01,$40,$79,$49,$63,$63,$48,$63,$62,$43,$65,$4d,$54,$70
	.byt $02,$40,$40,$48,$40,$40,$41,$40,$40,$40,$40,$40,$44,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$40,$50,$40,$01,$40,$40,$40,$42,$40,$40,$40,$42,$40,$40,$40,$40,$40
	.byt $02,$40,$40,$70,$40,$40,$41,$40,$40,$40,$40,$40,$58,$40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$60,$40,$01,$40,$40,$40,$42,$40,$40,$40,$44,$40,$40,$40,$40,$40

scoreboard
	.byt $01,$40,$40,$40,$40,$43,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	.byt $05,$40,$40,$40,$40,$43,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,3,16,$43,$60,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40
	.byt $05,$40,$40,$40,$40,$43,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$40,$40,$40,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $06,$40,$40,$40,$40,$43,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,3,16,$44,$47,$4c,$68,$70,$40,$40,$40,$40,$40,$64,$40
	.byt $06,$40,$40,$40,$40,$41,$60,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$43,$48,$52,$75,$48,$40,$40,$40,$40,$40,$6c,$40
	.byt $02,$40,$40,$40,$40,$41,$60,$58,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,3,16,$40,$68,$52,$61,$79,$78,$40,$40,$40,$40,$74,$40
	.byt $02,$40,$40,$40,$40,$41,$60,$58,$40,$40,$43,$60,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$40,$68,$52,$61,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $03,$40,$70,$40,$40,$40,$70,$58,$40,$40,$46,$70,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,3,16,$47,$47,$4c,$60,$70,$40,$40,$40,$40,$40,$58,$40
	.byt $03,$40,$70,$40,$40,$78,$70,$4c,$40,$47,$4c,$70,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	.byt $03,$40,$70,$40,$41,$6c,$70,$4c,$41,$47,$6d,$60,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,7,16,$44,$40,$40,$40,$40,$40,$40,$40,$40,$40,$58,$40
	.byt $07,$40,$70,$43,$63,$46,$58,$4c,$4f,$68,$6f,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$48,$40,$40,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $07,$40,$58,$46,$73,$52,$58,$46,$59,$60,$66,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,7,16,$44,$42,$63,$47,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $07,$40,$58,$6c,$5f,$46,$58,$46,$59,$61,$46,$58,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$4b,$54,$68,$40,$40,$40,$40,$40,$40,$6c,$40
	.byt $07,$43,$59,$6d,$49,$64,$58,$7e,$58,$71,$63,$70,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,7,16,$44,$4a,$57,$66,$41,$78,$40,$40,$40,$40,$74,$40
	.byt $03,$47,$4f,$4c,$58,$7c,$41,$66,$50,$70,$79,$60,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$4a,$54,$41,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $03,$4c,$4a,$46,$50,$58,$41,$67,$5d,$78,$5c,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,7,16,$47,$6a,$53,$4e,$40,$40,$40,$40,$40,$40,$58,$40
	.byt $03,$48,$4b,$63,$70,$40,$41,$63,$46,$40,$58,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	.byt $02,$4e,$4c,$79,$60,$40,$41,$43,$40,$40,$58,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,2,16,$44,$60,$47,$40,$40,$40,$40,$40,$40,$40,$58,$40
	.byt $02,$47,$66,$4c,$40,$40,$41,$77,$60,$40,$70,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$68,$48,$40,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $06,$40,$76,$40,$40,$40,$40,$58,$40,$41,$60,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,2,16,$44,$60,$48,$4e,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $06,$41,$60,$40,$40,$40,$40,$40,$40,$43,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$47,$68,$46,$50,$40,$40,$40,$40,$40,$40,$6c,$40
	.byt $05,$47,$40,$40,$40,$40,$40,$40,$40,$42,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,2,16,$44,$6b,$61,$50,$41,$78,$40,$40,$40,$40,$74,$40
	.byt $05,$5c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,6,16,$44,$68,$41,$50,$40,$40,$40,$40,$40,$40,$64,$40
	.byt $01,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,17,6,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,2,16,$44,$68,$4e,$4e,$40,$40,$40,$40,$40,$40,$58,$40


.dsb $bfe0-*,0

#echo **** Free space:
#print ($a000-freespace)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; String pack 36
.(
.byt RESOURCE_STRING
.word (res_end-res_start +4)
.byt 36
res_start
.asc "Tt looks like a hair curl iron or a",0 ; String 0
.asc "pulley stopper.",0 ; String 1
res_end
.)

; Object Code 36
.(
.byt RESOURCE_OBJECTCODE
.word (res_end-res_start +4)
.byt 36
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 36
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 36
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
.byt SC_STOP_SCRIPT
res_end
.)

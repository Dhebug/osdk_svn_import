;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Script 200
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 200
res_start
+script_200_start
.byt SC_ASSIGN, 6	; nScribbleMsg=0
.byt 0
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 200
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 200
res_start
; Response table
.byt VERB_WALKTO
.word (l_WalkTo-res_start)
.byt $ff ; End of response table
l_WalkTo
.byt SC_SET_OBJECT_POS
.byt SF_GET_ACTIONACTOR
.byt 45
.byt 14
.byt 21
.byt SC_LOOK_DIRECTION
.byt SF_GET_ACTIONACTOR
.byt 3
.byt SC_CHANGE_ROOM_AND_STOP
.byt 45
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 206
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 206
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 0
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 207
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 207
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 15
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 208
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 208
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 1
.byt SC_STOP_SCRIPT
l_Use
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 2
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 209
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 209
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 3
.byt SC_STOP_SCRIPT
l_Use
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_ACTIONOBJ1
.byt 49
.byt 31
; then part
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_STATE
.byt 49
.byt 0
.byt 17
; then part
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 17
.byt SC_SET_STATE
.byt 49
.byt 1
.byt SC_JUMP_REL, 7
; else part
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 16
.byt SC_STOP_SCRIPT
.byt SC_JUMP_REL, 7
; else part
.byt SC_ACTOR_TALK
.byt SF_GET_EGO
.byt 64, 200
.byt 4
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 201
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 201
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CHAIN_SCRIPT
.byt 64, 210
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_CHAIN_SCRIPT
.byt 64, 211
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,58	; bCouplet1Known
.byt 10
; then part
.byt SC_SETFLAG, 58	; bCouplet1Known=true
.byt 1
.byt SC_SAVEGAME
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 202
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 202
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CHAIN_SCRIPT
.byt 64, 210
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 2
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 3
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_CHAIN_SCRIPT
.byt 64, 211
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,59	; bCouplet2Known
.byt 10
; then part
.byt SC_SETFLAG, 59	; bCouplet2Known=true
.byt 1
.byt SC_SAVEGAME
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 203
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 203
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CHAIN_SCRIPT
.byt 64, 210
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 4
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 5
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_CHAIN_SCRIPT
.byt 64, 211
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,60	; bCouplet3Known
.byt 10
; then part
.byt SC_SETFLAG, 60	; bCouplet3Known=true
.byt 1
.byt SC_SAVEGAME
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 204
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 204
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CHAIN_SCRIPT
.byt 64, 210
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 6
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 7
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_CHAIN_SCRIPT
.byt 64, 211
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,61	; bCouplet4Known
.byt 10
; then part
.byt SC_SETFLAG, 61	; bCouplet4Known=true
.byt 1
.byt SC_SAVEGAME
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 205
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 205
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CHAIN_SCRIPT
.byt 64, 210
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 8
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 201
.byt 9
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_CHAIN_SCRIPT
.byt 64, 211
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,62	; bCouplet5Known
.byt 10
; then part
.byt SC_SETFLAG, 62	; bCouplet5Known=true
.byt 1
.byt SC_SAVEGAME
.byt SC_STOP_SCRIPT
res_end
.)

; Script 210
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 210
res_start
+script_210_start
.byt SC_CURSOR_ON
.byt 0
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 200
.byt SF_ADD
.byt 5
.byt SF_GETVAL,6	; nScribbleMsg
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_STOP_SCRIPT
res_end
.)

; Script 211
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 211
res_start
+script_211_start
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 64, 200
.byt SF_ADD
.byt 6
.byt SF_GETVAL,6	; nScribbleMsg
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
.byt SC_ASSIGN, 6	; nScribbleMsg=nScribbleMsg+2
.byt SF_ADD
.byt SF_GETVAL,6	; nScribbleMsg
.byt 2
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GE
.byt SF_GETVAL,6	; nScribbleMsg
.byt 10
.byt 10
; then part
.byt SC_ASSIGN, 6	; nScribbleMsg=8
.byt 8
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
res_end
.)

; String pack 200
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 200
res_start
.asc "It is a stickman.",0 ; String 0
.asc "What can I say? It is a WC...",0 ; String 1
.asc "No, thanks. No need now.",0 ; String 2
.asc "It is a washbasin. Nothing unusual.",0 ; String 3
.asc "I don't need to wash my hands.",0 ; String 4
.asc "There are scribbles everywhere.",0 ; String 5
.asc "Anyway...",0 ; String 6
.asc "Look, this one says:",0 ; String 7
.asc "That is a bad one.",0 ; String 8
.asc "Let's see...",0 ; String 9
.asc "I think all of them are terrible.",0 ; String 10
.asc "This is difficult to read...",0 ; String 11
.asc "Oh, my...",0 ; String 12
.asc "Will this one be better?",0 ; String 13
.asc "No. It wasn't.",0 ; String 14
.asc "It reads: Out of Order.",0 ; String 15
.asc "It is already full.",0 ; String 16
.asc "Okay, I'll fill it up with water.",0 ; String 17
res_end
.)

; String pack 201
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 201
res_start
.asc "'My feelings for you no words can tell",0 ; String 0
.asc "Except for maybe go to hell'.",0 ; String 1
.asc "'Oh loving beauty you float with grace",0 ; String 2
.asc "If only you could hide your face.'",0 ; String 3
.asc "'Kind, intelligent, loving and hot",0 ; String 4
.asc "This describes everything you are not.'",0 ; String 5
.asc "'I love your smile, face, and eyes",0 ; String 6
.asc "Damn, I'm good at telling lies!'",0 ; String 7
.asc "'I see your face when I am dreaming",0 ; String 8
.asc "That's why I always wake up screaming.'",0 ; String 9
res_end
.)

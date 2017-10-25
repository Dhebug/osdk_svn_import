;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Dialog 200
.(
.byt RESOURCE_DIALOG|$80
.word (res_end-res_start +4)
.byt 200
res_start
.byt 220	; Stringpack with options
.byt 220	; Script with response actions
.byt 1,1,1,1,1,$ff	; Active flags
.word (l_back-script_220_start),(l_stomach-script_220_start),(l_constipation-script_220_start),(l_tooth-script_220_start),(l_bye-script_220_start)	; Jump labels
res_end
.)
; String pack for dialog 200
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 220
res_start
.asc "Me duele mucho la espalda.",0 ; String 0
.asc "El est",94,"mago me duele mucho.",0 ; String 1
.asc "Tengo un estre",35,"imiento horrible.",0 ; String 2
.asc "Me duele mucho una muela.",0 ; String 3
.asc "Nada, gracias.",0 ; String 4
res_end
.)

; Script 220
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 220
res_start
+script_220_start
+l_back
.byt SC_ASSIGN, 64, 200	; opt=4
.byt 4
.byt SC_JUMP
.word (l_common-res_start)
+l_stomach
.byt SC_ASSIGN, 64, 200	; opt=5
.byt 5
.byt SC_JUMP
.word (l_common-res_start)
+l_constipation
.byt SC_ASSIGN, 64, 200	; opt=6
.byt 6
.byt SC_JUMP
.word (l_common-res_start)
+l_tooth
.byt SC_ASSIGN, 64, 200	; opt=7
.byt 7
l_common
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 2
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt SF_GETVAL,64, 200	; opt
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_LOOK_DIRECTION
.byt 64, 254
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 3
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 221
.byt 8
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 221
.byt 9
.byt SC_WAIT_FOR_ACTOR
.byt 0
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_AND
.byt SF_EQ
.byt SF_GETVAL,64, 200	; opt
.byt 6
.byt SF_NOT
.byt SF_GETFLAG,10	; bNurseGaveLaxative
.byt 36
; then part
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 10
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 11
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_PUT_IN_INVENTORY
.byt 5
.byt SC_SETFLAG, 10	; bNurseGaveLaxative=true
.byt 1
.byt SC_SAVEGAME
.byt SC_SETFLAG, 9	; bEscapeFromNurse=true
.byt 1
.byt SC_JUMP
.word (l_end-res_start)
+l_bye
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 12
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 13
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 221
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 15
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
l_end
.byt SC_SETFLAG, 12	; bAutoExit=true
.byt 1
.byt SC_LOOK_DIRECTION
.byt 64, 254
.byt 3
.byt SC_END_DIALOG
.byt SC_CURSOR_ON
.byt 0
.byt SC_EXECUTE_ACTION
.byt 0
.byt 9
.byt 64, 221
.byt 64, 255
.byt SC_STOP_SCRIPT
res_end
.)

; String pack 221
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 221
res_start
.asc "No me da mucha tranquilidad...",0 ; String 0
.asc "Hola cari",35,"o. ",126,"C",94,"mo puedo ayudarte?",0 ; String 1
.asc "Eso es un momento...",0 ; String 2
.asc "y procedamos AHORA MISMO.",0 ; String 3
.asc "D",92,"jame coger la jeringuilla larga",0 ; String 4
.asc "D",92,"jame coger el tubo g",91,"strico",0 ; String 5
.asc "D",92,"jame coger el enema rectal",0 ; String 6
.asc "D",92,"jame coger los f",94,"rceps dentales",0 ; String 7
.asc "Eeee... no gracias.",0 ; String 8
.asc "Me encuentro mejor. ",125,"Adi",94,"s!",0 ; String 9
.asc "Al menos toma este laxante.",0 ; String 10
.asc "",125,"S",94,"lo una gota! Es muy potente.",0 ; String 11
.asc "",126,"Sabes si por casualidad han rellenado",0 ; String 12
.asc "la m",91,"quina de caf",92,"?",0 ; String 13
.asc "No.",0 ; String 14
.asc "Vaya. Me hace falta un caf",92,".",0 ; String 15
res_end
.)

; Object Code 254
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 254
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_TALKTO
.word (l_TalkTo-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ASSIGN, 64, 200	; actor=sfGetActorExecutingAction()
.byt SF_GET_ACTIONACTOR
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_STOP_SCRIPT
l_TalkTo
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 254
.byt 64, 221
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt 64, 254
.byt SC_CURSOR_ON
.byt 1
.byt SC_LOAD_DIALOG
.byt 64, 200
.byt SC_START_DIALOG
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 221
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 221
res_start
; Response table
.byt VERB_WALKTO
.word (l_WalkTo-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_WalkTo
l_Use
.byt SC_ASSIGN, 64, 200	; actor=sfGetActorExecutingAction()
.byt SF_GET_ACTIONACTOR
.byt SC_SET_OBJECT_POS
.byt SF_GETVAL,64, 200	; actor
.byt 3
.byt 13
.byt 64, 72
.byt SC_LOOK_DIRECTION
.byt SF_GETVAL,64, 200	; actor
.byt 3
.byt SC_CHANGE_ROOM_AND_STOP
.byt 3
.byt SC_STOP_SCRIPT
res_end
.)

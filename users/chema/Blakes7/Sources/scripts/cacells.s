;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; String pack 200
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 200
res_start
.asc "",125,"Vila! ",125,"Gan!",0 ; String 0
.asc "Hola hermano, me pregunto si t",95,"...",0 ; String 1
.asc "",125,"Soy yo! ",125,"Blake!",0 ; String 2
.asc "",125,"Blake! ",126,"Qu",92," haces aqu",93,"?",0 ; String 3
.asc "Vengo a por vosotros. ",125,"Tengo una nave!",0 ; String 4
.asc "",126,"Y c",94,"mo vamos a escapar de aqu",93,"?",0 ; String 5
.asc "Con estas pulseras. Pon",92,"oslas.",0 ; String 6
.asc "Qu",92," raro. Pensaba que tra",93,"a tres...",0 ; String 7
.asc "Habr",92," perdido una en alg",95,"n sitio.",0 ; String 8
.asc "Listo, ",126,"y ahora?",0 ; String 9
res_end
.)

; Script 200
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 200
res_start
+script_200_start
.byt SC_CURSOR_ON
.byt 0
.byt SC_LOAD_OBJECT
.byt 21
.byt SC_LOAD_OBJECT
.byt 23
.byt SC_SET_OBJECT_POS
.byt 21
.byt 37
.byt 14
.byt 4
.byt SC_LOOK_DIRECTION
.byt 21
.byt 3
.byt SC_SET_OBJECT_POS
.byt 23
.byt 37
.byt 15
.byt 8
.byt SC_LOOK_DIRECTION
.byt 23
.byt 1
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_LOOK_DIRECTION
.byt 21
.byt 0
.byt SC_LOOK_DIRECTION
.byt 23
.byt 0
.byt SC_ACTOR_WALKTO
.byt 0
.byt 27
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_LOOK_DIRECTION
.byt 0
.byt 1
.byt SC_ACTOR_TALK
.byt 21
.byt 64, 200
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt 21
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 2
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_SET_COSTUME
.byt 0
.byt 0
.byt 0
.byt SC_ACTOR_WALKTO
.byt 21
.byt 18
.byt 14
.byt SC_ACTOR_TALK
.byt 23
.byt 64, 200
.byt 3
.byt SC_WAIT_FOR_ACTOR
.byt 23
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 4
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt 21
.byt SC_LOOK_DIRECTION
.byt 21
.byt 0
.byt SC_ACTOR_TALK
.byt 21
.byt 64, 200
.byt 5
.byt SC_WAIT_FOR_ACTOR
.byt 21
.byt SC_ACTOR_WALKTO
.byt 0
.byt 22
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 6
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_REMOVE_FROM_INVENTORY
.byt 42
.byt SC_DELAY
.byt 50
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 7
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 8
.byt SC_ACTOR_WALKTO
.byt 21
.byt 11
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 21
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_LOOK_DIRECTION
.byt 21
.byt 0
.byt SC_ACTOR_TALK
.byt 23
.byt 64, 200
.byt 9
.byt SC_WAIT_FOR_ACTOR
.byt 23
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
res_end
.)

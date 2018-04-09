; Common header
#include "..\params.h"
#include "..\object.h"
#include "..\script.h"
#include "..\resource.h"
#include "..\verbs.h"

#include "..\gameids.h"
#include "..\language.h"


*=$500
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Room: Nursery
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.(
	.byt RESOURCE_ROOM
	.word (res_end - res_start + 4)
	.byt 9
res_start
; No. columns, offset to tile map, offset to tiles
	.byt 38, <(column_data-res_start), >(column_data-res_start), <(tiles_start-res_start), >(tiles_start-res_start)
; No. zplanes and offsets to zplanes
	.byt 0
; No. Walkboxes and offsets to wb data and matrix
	.byt 3, <(wb_data-res_start), >(wb_data-res_start), <(wb_matrix-res_start), >(wb_matrix-res_start)
; Offset to palette
	.byt 0, 0	; No palette information
; Entry and exit scripts
	.byt 255, 255
; Number of objects in the room and list of ids
	.byt 2, 221, 254
; Room name (null terminated)
	.asc "Nursery", 0
; Room tile map
column_data
	.byt 001, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 213, 223, 231
	.byt 002, 008, 008, 008, 008, 008, 008, 008, 008, 008, 008, 008, 008, 193, 214, 224, 232
	.byt 003, 009, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 007, 194, 000, 224, 232
	.byt 004, 010, 008, 008, 008, 008, 008, 008, 008, 008, 008, 008, 166, 195, 000, 224, 232
	.byt 004, 011, 007, 007, 007, 007, 007, 007, 007, 007, 007, 145, 167, 000, 000, 224, 232
	.byt 004, 012, 017, 039, 044, 052, 044, 044, 044, 107, 128, 146, 168, 000, 215, 225, 233
	.byt 004, 004, 018, 040, 045, 053, 063, 075, 086, 108, 129, 147, 169, 196, 216, 226, 234
	.byt 004, 004, 019, 041, 046, 054, 064, 076, 087, 109, 130, 147, 170, 197, 217, 227, 199
	.byt 004, 004, 020, 042, 047, 055, 065, 077, 088, 110, 131, 148, 171, 198, 218, 199, 199
	.byt 004, 004, 021, 043, 038, 038, 038, 038, 038, 038, 132, 149, 172, 199, 219, 199, 199
	.byt 004, 004, 022, 007, 007, 007, 007, 007, 007, 111, 133, 150, 173, 200, 199, 199, 199
	.byt 004, 004, 021, 008, 048, 056, 066, 008, 089, 112, 134, 151, 174, 201, 199, 199, 199
	.byt 004, 004, 023, 007, 049, 057, 067, 007, 090, 113, 135, 018, 175, 199, 199, 199, 199
	.byt 004, 004, 024, 008, 049, 058, 067, 008, 091, 114, 136, 019, 176, 199, 199, 199, 199
	.byt 004, 004, 025, 007, 050, 059, 068, 007, 007, 061, 137, 018, 175, 199, 199, 199, 199
	.byt 004, 004, 026, 008, 049, 057, 067, 008, 008, 115, 138, 019, 176, 199, 199, 199, 199
	.byt 004, 004, 027, 007, 051, 060, 069, 007, 092, 116, 139, 152, 177, 202, 199, 199, 199
	.byt 004, 004, 028, 008, 008, 008, 070, 078, 093, 117, 140, 153, 178, 203, 199, 199, 199
	.byt 004, 004, 029, 007, 007, 061, 071, 022, 007, 118, 141, 154, 179, 203, 199, 199, 199
	.byt 004, 004, 030, 008, 008, 008, 072, 079, 094, 119, 141, 155, 180, 203, 199, 199, 199
	.byt 004, 004, 031, 007, 007, 061, 073, 080, 095, 120, 141, 153, 178, 203, 199, 199, 199
	.byt 004, 004, 030, 008, 008, 062, 073, 081, 096, 119, 141, 156, 181, 203, 199, 199, 199
	.byt 004, 004, 032, 007, 007, 061, 074, 082, 097, 120, 141, 154, 179, 203, 199, 199, 199
	.byt 004, 004, 033, 008, 008, 008, 072, 083, 098, 121, 141, 155, 180, 203, 199, 199, 199
	.byt 004, 004, 032, 007, 007, 061, 073, 080, 099, 122, 141, 153, 178, 203, 199, 199, 199
	.byt 004, 004, 034, 008, 008, 062, 073, 081, 100, 123, 141, 156, 182, 203, 199, 199, 199
	.byt 004, 004, 031, 007, 007, 061, 074, 082, 101, 124, 141, 157, 183, 203, 199, 199, 199
	.byt 004, 004, 030, 008, 008, 008, 038, 084, 102, 125, 141, 158, 184, 203, 199, 199, 199
	.byt 004, 004, 035, 007, 007, 007, 007, 007, 103, 126, 141, 153, 183, 203, 199, 199, 199
	.byt 004, 004, 036, 008, 008, 008, 008, 008, 008, 062, 141, 159, 185, 204, 199, 199, 199
	.byt 004, 004, 025, 007, 007, 007, 007, 007, 007, 061, 141, 141, 186, 205, 220, 199, 199
	.byt 004, 004, 015, 008, 008, 008, 008, 008, 008, 062, 141, 160, 187, 206, 221, 200, 199
	.byt 004, 004, 037, 007, 007, 007, 007, 007, 007, 061, 141, 161, 188, 207, 182, 203, 199
	.byt 004, 013, 038, 038, 038, 038, 038, 038, 038, 038, 142, 162, 189, 208, 183, 203, 199
	.byt 004, 014, 007, 007, 007, 007, 007, 007, 007, 007, 143, 163, 190, 209, 183, 203, 199
	.byt 004, 015, 008, 008, 008, 008, 008, 008, 104, 008, 144, 164, 141, 210, 183, 228, 235
	.byt 005, 016, 007, 007, 007, 007, 007, 085, 105, 127, 127, 165, 191, 211, 222, 229, 236
	.byt 006, 008, 008, 008, 008, 008, 008, 008, 106, 008, 008, 008, 192, 212, 183, 230, 237

; Room tile set
tiles_start
	.byt $E0, $D0, $73, $5C, $7F, $77, $7F, $5D	; tile #1
	.byt $C0, $C0, $C0, $C0, $E0, $47, $79, $76	; tile #2
	.byt $C0, $C0, $C0, $C0, $C0, $C0, $C0, $E0	; tile #3
	.byt $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0	; tile #4
	.byt $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C7	; tile #5
	.byt $C0, $C0, $C0, $C0, $C3, $71, $4F, $77	; tile #6
	.byt $7F, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #7
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $77	; tile #8
	.byt $63, $74, $7F, $5D, $7F, $77, $7F, $5D	; tile #9
	.byt $C0, $E0, $61, $76, $7F, $5D, $7F, $77	; tile #10
	.byt $C0, $C0, $C0, $F0, $70, $77, $7F, $5D	; tile #11
	.byt $C0, $C0, $C0, $C0, $C0, $F0, $73, $75	; tile #12
	.byt $C0, $C0, $C0, $C0, $C0, $C3, $63, $5F	; tile #13
	.byt $C0, $C0, $C0, $78, $47, $77, $7F, $5D	; tile #14
	.byt $C0, $70, $4F, $77, $7F, $5D, $7F, $77	; tile #15
	.byt $47, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #16
	.byt $74, $55, $77, $77, $77, $55, $77, $77	; tile #17
	.byt $40, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #18
	.byt $40, $5D, $7F, $77, $7F, $5D, $7F, $77	; tile #19
	.byt $43, $74, $7F, $5D, $7F, $77, $7F, $5D	; tile #20
	.byt $C0, $40, $7F, $77, $7F, $5D, $7F, $77	; tile #21
	.byt $C0, $40, $7F, $5D, $7F, $77, $7F, $5D	; tile #22
	.byt $C0, $47, $78, $5D, $7F, $77, $7F, $5D	; tile #23
	.byt $C0, $C0, $40, $77, $7F, $5D, $7F, $77	; tile #24
	.byt $C0, $C0, $40, $5D, $7F, $77, $7F, $5D	; tile #25
	.byt $C0, $C0, $43, $74, $7F, $5D, $7F, $77	; tile #26
	.byt $C0, $C0, $C0, $40, $7F, $77, $7F, $5D	; tile #27
	.byt $C0, $C0, $C0, $40, $7F, $5D, $7F, $77	; tile #28
	.byt $C0, $C0, $C0, $43, $7C, $77, $7F, $5D	; tile #29
	.byt $C0, $C0, $C0, $C0, $40, $5D, $7F, $77	; tile #30
	.byt $C0, $C0, $C0, $C0, $40, $77, $7F, $5D	; tile #31
	.byt $C0, $C0, $C0, $C0, $C0, $40, $7F, $5D	; tile #32
	.byt $C0, $C0, $C0, $C0, $C0, $40, $7F, $77	; tile #33
	.byt $C0, $C0, $C0, $C0, $C1, $41, $7F, $77	; tile #34
	.byt $C0, $C0, $C0, $70, $4F, $77, $7F, $5D	; tile #35
	.byt $C0, $C0, $C1, $41, $7F, $5D, $7F, $77	; tile #36
	.byt $60, $5F, $7F, $5D, $7F, $77, $7F, $5D	; tile #37
	.byt $5F, $5D, $5F, $57, $5F, $5D, $5F, $57	; tile #38
	.byt $77, $55, $77, $76, $76, $54, $76, $76	; tile #39
	.byt $7F, $77, $7F, $40, $C1, $C2, $C4, $C4	; tile #40
	.byt $7F, $5D, $7F, $40, $40, $C0, $C0, $C0	; tile #41
	.byt $7F, $77, $7F, $40, $C0, $E0, $D0, $D0	; tile #42
	.byt $7F, $5D, $7F, $57, $5F, $5D, $5F, $57	; tile #43
	.byt $76, $54, $76, $76, $76, $54, $76, $76	; tile #44
	.byt $C5, $C5, $C5, $C4, $C6, $C2, $C3, $C1	; tile #45
	.byt $F7, $F7, $F7, $C8, $C0, $EA, $D5, $C1	; tile #46
	.byt $D0, $D0, $D0, $D0, $E0, $E0, $E0, $C0	; tile #47
	.byt $40, $5F, $5F, $5F, $5F, $5F, $5F, $5F	; tile #48
	.byt $40, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #49
	.byt $40, $7F, $5F, $5F, $5F, $5F, $5F, $5F	; tile #50
	.byt $40, $7E, $7E, $7E, $7E, $7E, $7E, $7E	; tile #51
	.byt $74, $56, $76, $76, $76, $54, $76, $76	; tile #52
	.byt $DD, $E7, $E0, $E3, $D6, $D5, $D6, $D5	; tile #53
	.byt $FF, $F7, $C0, $F7, $C0, $F7, $C0, $F7	; tile #54
	.byt $DC, $F2, $C2, $E2, $F4, $D4, $F4, $D4	; tile #55
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $5F, $5F	; tile #56
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #57
	.byt $7F, $7F, $7F, $7F, $7D, $7D, $7D, $7F	; tile #58
	.byt $5F, $5F, $5F, $5F, $57, $57, $57, $5F	; tile #59
	.byt $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E	; tile #60
	.byt $7F, $77, $7F, $5D, $7F, $77, $7F, $40	; tile #61
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $40	; tile #62
	.byt $D6, $D6, $D5, $E2, $E2, $D4, $D4, $D4	; tile #63
	.byt $C0, $C0, $C1, $F6, $D4, $D4, $D4, $D4	; tile #64
	.byt $F4, $F4, $D4, $E2, $E2, $D4, $D4, $D4	; tile #65
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $5F, $40	; tile #66
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $40	; tile #67
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $7F, $40	; tile #68
	.byt $7E, $7E, $7E, $7E, $7E, $7E, $7E, $40	; tile #69
	.byt $7E, $5E, $7E, $76, $7E, $5E, $7E, $76	; tile #70
	.byt $C0, $D4, $C0, $D4, $C0, $D4, $C0, $DA	; tile #71
	.byt $5E, $5E, $5E, $56, $5E, $5E, $5E, $56	; tile #72
	.byt $FF, $40, $FF, $40, $FF, $40, $FF, $40	; tile #73
	.byt $FF, $4C, $FD, $42, $FD, $40, $FF, $40	; tile #74
	.byt $D4, $D4, $F5, $E2, $EA, $EA, $EA, $DC	; tile #75
	.byt $D4, $D4, $E3, $D4, $F6, $FE, $FE, $D4	; tile #76
	.byt $D4, $D4, $D6, $E2, $EA, $EA, $EA, $DC	; tile #77
	.byt $7E, $5F, $7F, $77, $7F, $5D, $7F, $77	; tile #78
	.byt $5E, $7E, $7E, $77, $7F, $5D, $7F, $77	; tile #79
	.byt $EF, $50, $F3, $40, $7F, $77, $7F, $5D	; tile #80
	.byt $FF, $40, $FF, $40, $7F, $5D, $7F, $77	; tile #81
	.byt $FF, $40, $FF, $40, $7F, $77, $7F, $5D	; tile #82
	.byt $5E, $5E, $5E, $77, $7F, $5D, $7F, $77	; tile #83
	.byt $5F, $5D, $5F, $77, $7F, $5D, $7F, $77	; tile #84
	.byt $7F, $73, $73, $61, $65, $61, $65, $45	; tile #85
	.byt $C4, $C2, $C2, $C2, $C2, $C2, $C2, $C2	; tile #86
	.byt $D4, $E2, $E2, $E2, $E2, $E2, $E2, $E2	; tile #87
	.byt $F0, $E0, $E0, $E0, $E0, $E0, $E0, $E0	; tile #88
	.byt $7F, $5D, $7F, $77, $7F, $40, $5F, $50	; tile #89
	.byt $7F, $77, $7F, $5D, $7F, $40, $7F, $40	; tile #90
	.byt $7F, $5D, $7F, $77, $7F, $40, $7E, $42	; tile #91
	.byt $63, $E2, $41, $6B, $6B, $48, $F0, $48	; tile #92
	.byt $7F, $5D, $7F, $77, $7F, $5D, $6F, $77	; tile #93
	.byt $7F, $5D, $7F, $78, $73, $63, $63, $43	; tile #94
	.byt $7F, $77, $7F, $40, $7E, $6E, $46, $7E	; tile #95
	.byt $7F, $5D, $7F, $40, $7B, $6A, $6B, $7B	; tile #96
	.byt $7F, $77, $7F, $47, $73, $71, $51, $70	; tile #97
	.byt $7F, $5D, $7F, $76, $78, $5C, $7E, $7E	; tile #98
	.byt $7F, $7F, $40, $40, $7F, $FF, $7F, $FF	; tile #99
	.byt $7F, $5D, $7F, $5C, $44, $4C, $5E, $56	; tile #100
	.byt $7F, $77, $7F, $40, $C0, $C0, $C0, $C0	; tile #101
	.byt $7F, $5D, $7F, $40, $C0, $C0, $C0, $C0	; tile #102
	.byt $7F, $77, $7F, $41, $41, $41, $5F, $5D	; tile #103
	.byt $7F, $57, $70, $70, $7F, $5D, $7F, $77	; tile #104
	.byt $65, $65, $44, $44, $65, $65, $65, $45	; tile #105
	.byt $7F, $75, $47, $47, $7F, $5D, $7F, $77	; tile #106
	.byt $76, $56, $74, $76, $76, $54, $76, $76	; tile #107
	.byt $C2, $C4, $C4, $C2, $C2, $C2, $C2, $C2	; tile #108
	.byt $E2, $D4, $D4, $E2, $E2, $E2, $E2, $E2	; tile #109
	.byt $E0, $D0, $D0, $E0, $E0, $E0, $E0, $E0	; tile #110
	.byt $7F, $77, $7F, $5D, $7F, $77, $7F, $78	; tile #111
	.byt $E9, $50, $57, $50, $52, $57, $50, $5F	; tile #112
	.byt $60, $43, $C3, $40, $60, $DB, $40, $7F	; tile #113
	.byt $5A, $CD, $42, $42, $72, $42, $42, $7E	; tile #114
	.byt $7F, $5D, $7F, $77, $7F, $5F, $7E, $41	; tile #115
	.byt $6B, $6B, $6B, $41, $7F, $41, $48, $DE	; tile #116
	.byt $57, $55, $57, $5B, $5B, $59, $5B, $78	; tile #117
	.byt $7E, $76, $7E, $5D, $7F, $77, $7F, $40	; tile #118
	.byt $40, $FF, $40, $77, $7F, $5D, $7F, $40	; tile #119
	.byt $40, $FF, $40, $5D, $7F, $77, $7F, $40	; tile #120
	.byt $56, $5E, $5F, $77, $7F, $5D, $7F, $40	; tile #121
	.byt $5E, $FF, $4C, $61, $7F, $77, $7F, $40	; tile #122
	.byt $5E, $5E, $7E, $77, $7F, $5D, $7F, $40	; tile #123
	.byt $C0, $C0, $EA, $6A, $7F, $77, $7F, $40	; tile #124
	.byt $C0, $C0, $EA, $6A, $7F, $5D, $7F, $40	; tile #125
	.byt $5F, $57, $5F, $7D, $7F, $77, $7F, $40	; tile #126
	.byt $65, $65, $65, $45, $65, $65, $65, $45	; tile #127
	.byt $76, $54, $76, $76, $76, $54, $76, $77	; tile #128
	.byt $C2, $C2, $C2, $C4, $73, $78, $C0, $40	; tile #129
	.byt $E2, $E2, $E2, $DC, $63, $40, $C0, $40	; tile #130
	.byt $E0, $E0, $E0, $D1, $66, $4F, $C0, $40	; tile #131
	.byt $5F, $58, $40, $55, $40, $45, $50, $5E	; tile #132
	.byt $40, $54, $41, $55, $42, $57, $40, $45	; tile #133
	.byt $FF, $7F, $6A, $55, $6A, $7F, $40, $55	; tile #134
	.byt $FF, $7F, $6A, $55, $7E, $7F, $40, $55	; tile #135
	.byt $FF, $7F, $6B, $55, $69, $7F, $40, $55	; tile #136
	.byt $40, $55, $60, $75, $50, $79, $40, $55	; tile #137
	.byt $43, $56, $40, $55, $40, $55, $40, $55	; tile #138
	.byt $C0, $FF, $40, $55, $40, $55, $40, $55	; tile #139
	.byt $78, $5D, $40, $55, $40, $55, $40, $55	; tile #140
	.byt $40, $55, $40, $55, $40, $55, $40, $55	; tile #141
	.byt $4F, $55, $43, $55, $40, $57, $46, $57	; tile #142
	.byt $7F, $77, $7F, $60, $5F, $77, $7D, $7D	; tile #143
	.byt $7F, $5D, $7F, $77, $5F, $6D, $5F, $57	; tile #144
	.byt $7F, $77, $7E, $5C, $7C, $74, $78, $58	; tile #145
	.byt $76, $40, $40, $40, $40, $40, $40, $40	; tile #146
	.byt $7F, $40, $40, $40, $40, $40, $40, $40	; tile #147
	.byt $7F, $40, $41, $40, $41, $41, $41, $42	; tile #148
	.byt $7F, $7D, $5F, $57, $5F, $5D, $5F, $57	; tile #149
	.byt $78, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #150
	.byt $40, $59, $59, $59, $59, $59, $59, $59	; tile #151
	.byt $40, $76, $7E, $5C, $7E, $76, $7E, $5C	; tile #152
	.byt $40, $40, $7F, $7F, $7F, $7F, $7F, $7F	; tile #153
	.byt $40, $40, $7F, $7B, $7C, $7F, $7F, $7F	; tile #154
	.byt $40, $40, $7F, $77, $4F, $7F, $7F, $7F	; tile #155
	.byt $40, $40, $5F, $5F, $5F, $5F, $5F, $5F	; tile #156
	.byt $40, $40, $7F, $7F, $7D, $7D, $7D, $7F	; tile #157
	.byt $40, $40, $5F, $5F, $57, $57, $57, $5F	; tile #158
	.byt $40, $45, $70, $75, $70, $75, $76, $77	; tile #159
	.byt $40, $55, $40, $40, $4F, $57, $43, $55	; tile #160
	.byt $40, $55, $40, $40, $7F, $7F, $7F, $7F	; tile #161
	.byt $46, $56, $40, $40, $7E, $7E, $7E, $7E	; tile #162
	.byt $4D, $4D, $4D, $4D, $4F, $67, $70, $7A	; tile #163
	.byt $5F, $5D, $4F, $57, $43, $55, $40, $55	; tile #164
	.byt $65, $65, $65, $45, $65, $65, $45, $45	; tile #165
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7E, $7C	; tile #166
	.byt $70, $70, $60, $40, $60, $4F, $40, $40	; tile #167
	.byt $40, $40, $40, $40, $40, $67, $40, $40	; tile #168
	.byt $40, $40, $40, $40, $40, $4B, $40, $40	; tile #169
	.byt $40, $40, $40, $40, $40, $57, $40, $40	; tile #170
	.byt $42, $42, $44, $44, $48, $48, $50, $61	; tile #171
	.byt $5F, $5D, $7F, $77, $40, $45, $6A, $65	; tile #172
	.byt $7F, $77, $7F, $5D, $40, $55, $6A, $54	; tile #173
	.byt $59, $59, $59, $59, $58, $59, $58, $58	; tile #174
	.byt $7F, $77, $7F, $5D, $40, $55, $6A, $55	; tile #175
	.byt $7F, $5D, $7F, $77, $40, $55, $6A, $55	; tile #176
	.byt $7E, $76, $7E, $5C, $40, $54, $68, $53	; tile #177
	.byt $40, $7F, $7F, $7F, $7F, $7F, $40, $7F	; tile #178
	.byt $40, $7F, $7F, $7B, $7C, $7F, $40, $7F	; tile #179
	.byt $40, $7F, $7F, $77, $4F, $7F, $40, $7F	; tile #180
	.byt $40, $5F, $5F, $5F, $5F, $5F, $40, $7F	; tile #181
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $40, $7F	; tile #182
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $40, $7F	; tile #183
	.byt $5F, $5F, $5F, $5F, $5F, $7F, $40, $7F	; tile #184
	.byt $77, $77, $77, $77, $77, $77, $47, $73	; tile #185
	.byt $60, $65, $70, $75, $78, $75, $74, $75	; tile #186
	.byt $40, $55, $40, $55, $40, $55, $40, $61	; tile #187
	.byt $40, $5F, $40, $55, $40, $55, $40, $55	; tile #188
	.byt $40, $7F, $40, $55, $40, $55, $40, $55	; tile #189
	.byt $7C, $5E, $40, $55, $40, $55, $40, $55	; tile #190
	.byt $45, $45, $44, $45, $44, $45, $44, $45	; tile #191
	.byt $7F, $5D, $7F, $57, $4F, $55, $41, $54	; tile #192
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $76	; tile #193
	.byt $7F, $77, $7F, $5C, $78, $70, $40, $40	; tile #194
	.byt $70, $60, $40, $40, $40, $40, $40, $40	; tile #195
	.byt $40, $40, $40, $40, $40, $40, $41, $42	; tile #196
	.byt $41, $42, $44, $48, $50, $61, $43, $47	; tile #197
	.byt $43, $47, $4E, $5D, $7C, $75, $64, $41	; tile #198
	.byt $6A, $55, $6A, $55, $6A, $55, $6A, $55	; tile #199
	.byt $68, $54, $6A, $55, $6A, $55, $6A, $55	; tile #200
	.byt $40, $41, $6A, $55, $6A, $55, $6A, $55	; tile #201
	.byt $68, $50, $6A, $55, $6A, $55, $6A, $55	; tile #202
	.byt $40, $40, $6A, $55, $6A, $55, $6A, $55	; tile #203
	.byt $41, $42, $61, $50, $68, $54, $6A, $55	; tile #204
	.byt $7D, $7D, $5D, $6D, $55, $4B, $45, $42	; tile #205
	.byt $7C, $5F, $5F, $5F, $7F, $7F, $7F, $7F	; tile #206
	.byt $40, $58, $5F, $5F, $5F, $5F, $5F, $5F	; tile #207
	.byt $40, $55, $60, $7F, $7F, $7F, $7F, $7F	; tile #208
	.byt $40, $55, $40, $41, $7E, $7F, $7F, $7F	; tile #209
	.byt $40, $55, $40, $55, $40, $7E, $7F, $7F	; tile #210
	.byt $44, $45, $44, $45, $44, $44, $65, $65	; tile #211
	.byt $40, $54, $41, $53, $47, $5F, $7F, $7F	; tile #212
	.byt $7F, $77, $7F, $5F, $7C, $78, $70, $40	; tile #213
	.byt $7C, $50, $60, $40, $40, $40, $40, $40	; tile #214
	.byt $40, $40, $40, $40, $41, $42, $44, $48	; tile #215
	.byt $44, $48, $50, $61, $43, $47, $4E, $5C	; tile #216
	.byt $4E, $5C, $78, $70, $60, $41, $42, $45	; tile #217
	.byt $40, $40, $4C, $5A, $52, $4C, $60, $55	; tile #218
	.byt $6A, $55, $4A, $55, $4A, $55, $6A, $55	; tile #219
	.byt $61, $50, $68, $54, $6A, $55, $6A, $55	; tile #220
	.byt $5F, $6F, $57, $4B, $45, $42, $61, $51	; tile #221
	.byt $65, $65, $65, $65, $65, $65, $44, $65	; tile #222
	.byt $5F, $40, $40, $7F, $7F, $40, $60, $60	; tile #223
	.byt $7F, $40, $40, $7F, $7F, $40, $40, $40	; tile #224
	.byt $70, $49, $43, $7F, $7E, $40, $44, $44	; tile #225
	.byt $78, $70, $60, $41, $42, $45, $4A, $55	; tile #226
	.byt $4A, $55, $6A, $55, $6A, $55, $6A, $55	; tile #227
	.byt $40, $40, $6A, $55, $6A, $55, $6A, $50	; tile #228
	.byt $44, $44, $64, $45, $64, $45, $40, $40	; tile #229
	.byt $40, $40, $6A, $55, $6A, $55, $4A, $45	; tile #230
	.byt $68, $45, $62, $71, $58, $49, $70, $41	; tile #231
	.byt $40, $55, $6A, $55, $6A, $55, $6A, $55	; tile #232
	.byt $44, $51, $60, $46, $4D, $49, $46, $40	; tile #233
	.byt $6A, $55, $6A, $55, $4A, $55, $4A, $55	; tile #234
	.byt $60, $50, $68, $55, $6A, $55, $6A, $55	; tile #235
	.byt $40, $47, $40, $55, $6A, $55, $6A, $55	; tile #236
	.byt $50, $61, $42, $55, $6A, $55, $6A, $55	; tile #237
; Walkbox Data
wb_data
	.byt 010, 025, 013, 016, $01
	.byt 026, 031, 015, 016, $01
	.byt 007, 009, 015, 016, $01
; Walk matrix
wb_matrix
	.byt 0, 1, 2
	.byt 0, 1, 0
	.byt 0, 0, 2


res_end
.)


.(
	.byt RESOURCE_OBJECT
	.word (res_end - res_start +4)
	.byt 221
res_start
	.byt OBJ_FLAG_PROP	; If OBJ_FLAG_PROP skip all costume data
	.byt 18,1		; Size (col, row)
	.byt $ff		; Room ($ff = current)
	.byt 11,16		; Pos (col, row)
	.byt ZPLANE_1		; Zplane
	.byt 11,16		; Walk position (col, row)
	.byt FACING_DOWN	; Facing direction for interaction
	.byt 00			; Color of text
#ifdef ENGLISH
	.asc "Exit",0
#endif
#ifdef SPANISH
	.asc "Salida",0
#endif
#ifdef FRENCH
	.asc "Sortie",0
#endif
res_end	
.)


.(
	.byt RESOURCE_OBJECT
	.word (res_end - res_start +4)
	.byt 254
res_start
	.byt OBJ_FLAG_ACTOR	; If OBJ_FLAG_PROP skip all costume data
	.byt 5,7		; Size (col, row)
	.byt $ff		; Room ($ff = current)
	.byt 22,14		; Pos (col, row)
	.byt ZPLANE_1		; Zplane
	.byt 22-6,15		; Walk position (col, row)
	.byt FACING_RIGHT	; Facing direction for interaction
	.byt 06			; Color of text

	; META: TODO
	; tiles and pointers to animatory states are setup in the costume
	; Load the costume ID, load the resource, setup pointers, load animatory state and set it.
	; also setup direction and anim_speed	
	.byt 204			; costume ($ff for none) and skip the rest
	.byt 0			; entry in costume resource		
	.byt FACING_DOWN			; direction (0 or LOOK_RIGHT for animstate 0)
	.byt 1			; animation speed	
#ifdef ENGLISH
	.asc "Nurse",0
#endif
#ifdef SPANISH
	.asc "Enfermera",0
#endif
#ifdef FRENCH
	.asc "Infirmiere",0
#endif
res_end	
.)

; Costume for nurse
#include "..\characters\Nurse\cost_res.s"

#include "..\scripts\nursery.s"

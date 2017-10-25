;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OASIS resource data file
;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
; Room: Caveint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.(
	.byt RESOURCE_ROOM
	.word (res_end - res_start + 4)
	.byt 33
res_start
; No. columns, offset to tile map, offset to tiles
	.byt 53, <(column_data-res_start), >(column_data-res_start), <(tiles_start-res_start), >(tiles_start-res_start)
; No. zplanes and offsets to zplanes
	.byt 1
	.byt <(zplane_data-res_start), >(zplane_data-res_start), <(zplane_tiles-res_start), >(zplane_tiles-res_start)		
; No. Walkboxes and offsets to wb data and matrix
	.byt 2, <(wb_data-res_start), >(wb_data-res_start), <(wb_matrix-res_start), >(wb_matrix-res_start)
; Offset to palette
	.byt 0, 0	; No palette information
; Entry and exit scripts
	.byt 255, 255
; Number of objects in the room and list of ids
	.byt 2,200,201
; Room name (null terminated)
	.asc "Caveint", 0
; Room tile map
column_data
	.byt 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 000, 082, 043, 017, 107, 114, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 052, 083, 092, 101, 108, 115, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 069, 084, 046, 046, 046, 046, 125, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 070, 046, 046, 046, 046, 046, 126, 136, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 071, 085, 000, 000, 000, 000, 127, 137, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 058, 072, 086, 000, 000, 000, 000, 126, 126, 150, 000, 000, 000, 000
	.byt 000, 000, 000, 059, 073, 023, 093, 017, 017, 116, 127, 127, 151, 000, 000, 000, 000
	.byt 000, 000, 038, 060, 074, 087, 094, 102, 109, 117, 128, 138, 126, 159, 000, 000, 000
	.byt 000, 000, 039, 040, 040, 040, 095, 103, 110, 110, 129, 139, 127, 127, 169, 000, 000
	.byt 000, 010, 040, 040, 040, 040, 040, 040, 040, 040, 040, 140, 126, 126, 170, 000, 000
	.byt 001, 011, 041, 040, 040, 040, 040, 040, 040, 040, 040, 141, 127, 127, 171, 000, 000
	.byt 002, 012, 042, 040, 040, 040, 096, 104, 111, 118, 040, 142, 126, 126, 126, 183, 000
	.byt 003, 013, 043, 047, 047, 047, 017, 017, 017, 119, 130, 127, 127, 127, 127, 184, 000
	.byt 004, 014, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 185, 000
	.byt 000, 015, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 186, 000
	.byt 005, 016, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 187, 000
	.byt 006, 017, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 188, 000
	.byt 007, 018, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 189, 000
	.byt 008, 019, 044, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 127, 200
	.byt 000, 020, 045, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 126, 201
	.byt 000, 021, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 190, 202
	.byt 000, 022, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 191, 203
	.byt 000, 023, 023, 023, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 192, 204
	.byt 000, 024, 046, 046, 075, 088, 088, 102, 102, 120, 132, 126, 126, 126, 126, 193, 000
	.byt 000, 025, 047, 047, 076, 047, 047, 076, 076, 121, 076, 143, 127, 127, 127, 194, 000
	.byt 000, 026, 016, 016, 016, 016, 016, 016, 016, 016, 016, 144, 126, 126, 126, 195, 000
	.byt 000, 027, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 127, 196, 000
	.byt 000, 028, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 126, 197, 000
	.byt 000, 029, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 160, 172, 198, 000
	.byt 000, 030, 016, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 161, 173, 199, 000
	.byt 000, 031, 048, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 162, 174, 000, 000
	.byt 000, 032, 049, 055, 016, 016, 016, 016, 016, 016, 131, 126, 126, 163, 175, 000, 000
	.byt 009, 033, 050, 061, 077, 017, 017, 017, 017, 017, 116, 127, 152, 164, 176, 000, 000
	.byt 000, 034, 051, 062, 078, 016, 016, 016, 016, 016, 131, 145, 153, 165, 000, 000, 000
	.byt 000, 000, 000, 063, 079, 017, 017, 017, 017, 017, 133, 050, 050, 166, 000, 000, 000
	.byt 000, 000, 000, 064, 050, 089, 097, 097, 097, 122, 050, 050, 154, 147, 000, 000, 000
	.byt 000, 000, 000, 065, 080, 090, 098, 050, 050, 050, 050, 146, 155, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 000, 000, 099, 105, 112, 123, 134, 147, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 000, 081, 091, 100, 106, 113, 000, 000, 000, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 066, 016, 016, 016, 016, 016, 124, 135, 148, 000, 000, 000, 000, 000
	.byt 000, 000, 000, 067, 017, 017, 017, 017, 017, 017, 116, 149, 156, 000, 000, 000, 000
	.byt 000, 000, 052, 068, 016, 016, 016, 016, 016, 016, 131, 126, 157, 000, 000, 000, 000
	.byt 000, 000, 053, 017, 017, 017, 017, 017, 017, 017, 116, 127, 158, 167, 000, 000, 000
	.byt 000, 035, 054, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 168, 177, 000, 000
	.byt 000, 036, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 178, 000, 000
	.byt 000, 037, 055, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 179, 000, 000
	.byt 000, 000, 017, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 180, 000, 000
	.byt 000, 000, 056, 016, 016, 016, 016, 016, 016, 016, 131, 126, 126, 126, 181, 000, 000
	.byt 000, 000, 057, 017, 017, 017, 017, 017, 017, 017, 116, 127, 127, 127, 182, 000, 000

; Room tile set
tiles_start
	.byt $40, $40, $40, $40, $41, $43, $42, $46	; tile #1
	.byt $60, $6A, $60, $6A, $60, $6A, $40, $6A	; tile #2
	.byt $40, $6A, $40, $6A, $40, $6B, $47, $6C	; tile #3
	.byt $50, $70, $50, $70, $70, $60, $40, $40	; tile #4
	.byt $40, $40, $41, $43, $45, $4F, $57, $7F	; tile #5
	.byt $41, $40, $5D, $7F, $77, $7F, $5D, $7F	; tile #6
	.byt $40, $7A, $74, $7E, $5C, $7E, $76, $7E	; tile #7
	.byt $42, $6A, $40, $6A, $42, $6A, $41, $6B	; tile #8
	.byt $40, $40, $40, $40, $40, $40, $44, $4F	; tile #9
	.byt $40, $40, $40, $40, $41, $43, $4F, $4F	; tile #10
	.byt $44, $46, $44, $76, $74, $76, $74, $7E	; tile #11
	.byt $40, $6A, $40, $6A, $40, $6A, $40, $6B	; tile #12
	.byt $48, $78, $58, $70, $60, $60, $61, $61	; tile #13
	.byt $40, $40, $40, $43, $4D, $5F, $77, $7F	; tile #14
	.byt $41, $47, $5D, $7F, $77, $7F, $5D, $7F	; tile #15
	.byt $5D, $7F, $77, $7F, $5D, $7F, $77, $7F	; tile #16
	.byt $77, $7F, $5D, $7F, $77, $7F, $5D, $7F	; tile #17
	.byt $5C, $7E, $76, $7F, $5D, $7F, $77, $7F	; tile #18
	.byt $41, $6A, $40, $6A, $40, $6A, $40, $6A	; tile #19
	.byt $40, $60, $70, $70, $50, $70, $50, $71	; tile #20
	.byt $40, $40, $40, $40, $47, $5F, $5D, $7F	; tile #21
	.byt $41, $4F, $47, $7F, $5D, $7F, $77, $7F	; tile #22
	.byt $76, $7E, $5C, $7E, $76, $7E, $5C, $7E	; tile #23
	.byt $40, $6A, $55, $6A, $55, $6A, $55, $6A	; tile #24
	.byt $40, $5C, $5C, $5E, $57, $5F, $5D, $5F	; tile #25
	.byt $40, $40, $40, $40, $5D, $7F, $77, $7F	; tile #26
	.byt $40, $40, $40, $47, $77, $7F, $5D, $7F	; tile #27
	.byt $40, $40, $40, $7F, $5D, $7F, $77, $7F	; tile #28
	.byt $40, $40, $40, $60, $60, $70, $58, $7F	; tile #29
	.byt $40, $40, $40, $40, $40, $40, $40, $7F	; tile #30
	.byt $40, $40, $40, $40, $40, $40, $5D, $6A	; tile #31
	.byt $40, $40, $40, $40, $41, $4F, $70, $6A	; tile #32
	.byt $51, $5B, $50, $6A, $60, $6A, $40, $6A	; tile #33
	.byt $40, $60, $60, $60, $40, $70, $50, $70	; tile #34
	.byt $40, $40, $40, $40, $40, $40, $43, $43	; tile #35
	.byt $40, $40, $40, $41, $57, $7F, $5D, $7F	; tile #36
	.byt $40, $40, $50, $78, $58, $78, $76, $7E	; tile #37
	.byt $40, $40, $40, $40, $40, $40, $41, $43	; tile #38
	.byt $41, $43, $4F, $5F, $5F, $7F, $7F, $7F	; tile #39
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #40
	.byt $7E, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #41
	.byt $43, $6A, $62, $7A, $7D, $7F, $7F, $7F	; tile #42
	.byt $47, $4F, $5D, $5F, $57, $5F, $5D, $5F	; tile #43
	.byt $70, $7A, $58, $7E, $76, $7F, $5D, $7F	; tile #44
	.byt $51, $77, $57, $7F, $5D, $7F, $77, $7F	; tile #45
	.byt $55, $6A, $55, $6A, $55, $6A, $55, $6A	; tile #46
	.byt $57, $5F, $5D, $5F, $57, $5F, $5D, $5F	; tile #47
	.byt $70, $7A, $58, $7A, $74, $7F, $5D, $7F	; tile #48
	.byt $40, $6A, $40, $6A, $40, $7E, $74, $7E	; tile #49
	.byt $40, $6A, $40, $6A, $40, $6A, $40, $6A	; tile #50
	.byt $50, $70, $50, $70, $50, $70, $50, $68	; tile #51
	.byt $40, $40, $40, $40, $40, $40, $40, $41	; tile #52
	.byt $40, $40, $40, $40, $40, $41, $41, $7F	; tile #53
	.byt $4D, $4F, $57, $7F, $5D, $7F, $77, $7F	; tile #54
	.byt $5C, $7F, $77, $7F, $5D, $7F, $77, $7F	; tile #55
	.byt $58, $7C, $76, $7E, $5C, $7F, $77, $7F	; tile #56
	.byt $40, $40, $40, $41, $47, $7F, $5D, $7F	; tile #57
	.byt $40, $40, $40, $40, $40, $40, $40, $43	; tile #58
	.byt $40, $40, $41, $4A, $55, $6A, $55, $4A	; tile #59
	.byt $47, $4F, $47, $67, $57, $67, $57, $67	; tile #60
	.byt $40, $6A, $40, $6A, $70, $7A, $58, $7E	; tile #61
	.byt $48, $68, $40, $68, $4C, $6C, $40, $68	; tile #62
	.byt $40, $43, $44, $4E, $50, $5A, $50, $5A	; tile #63
	.byt $40, $70, $50, $6C, $44, $6B, $41, $6A	; tile #64
	.byt $40, $40, $40, $40, $40, $40, $40, $60	; tile #65
	.byt $40, $40, $44, $4C, $4D, $5F, $57, $5F	; tile #66
	.byt $40, $40, $40, $40, $40, $60, $40, $71	; tile #67
	.byt $41, $47, $47, $5F, $5D, $7F, $77, $7F	; tile #68
	.byt $40, $40, $40, $40, $40, $42, $48, $72	; tile #69
	.byt $40, $40, $40, $40, $45, $4A, $55, $6A	; tile #70
	.byt $40, $40, $40, $47, $50, $6A, $55, $6A	; tile #71
	.byt $45, $5F, $77, $7F, $5D, $47, $53, $69	; tile #72
	.byt $65, $72, $59, $78, $75, $7C, $5C, $7E	; tile #73
	.byt $57, $67, $53, $6B, $53, $6B, $53, $6B	; tile #74
	.byt $55, $4A, $55, $4A, $55, $4A, $55, $4A	; tile #75
	.byt $47, $6F, $4D, $6F, $47, $6F, $4D, $6F	; tile #76
	.byt $74, $7E, $5C, $7F, $77, $7F, $5D, $7F	; tile #77
	.byt $58, $70, $57, $7F, $5D, $7F, $77, $7F	; tile #78
	.byt $50, $7A, $58, $7E, $76, $7E, $5D, $7F	; tile #79
	.byt $70, $70, $50, $70, $50, $70, $50, $70	; tile #80
	.byt $40, $40, $40, $40, $40, $40, $41, $41	; tile #81
	.byt $40, $40, $40, $40, $40, $41, $41, $43	; tile #82
	.byt $41, $4F, $47, $5F, $5D, $7F, $77, $7C	; tile #83
	.byt $75, $72, $45, $6A, $55, $4A, $55, $6A	; tile #84
	.byt $55, $6A, $55, $6A, $55, $68, $50, $60	; tile #85
	.byt $54, $6A, $54, $6A, $40, $40, $40, $40	; tile #86
	.byt $53, $6B, $53, $69, $55, $68, $54, $6A	; tile #87
	.byt $45, $6A, $65, $6A, $45, $6A, $65, $6A	; tile #88
	.byt $40, $6A, $60, $6A, $40, $6A, $60, $7A	; tile #89
	.byt $50, $70, $50, $70, $50, $68, $4C, $6C	; tile #90
	.byt $41, $41, $41, $41, $41, $43, $41, $43	; tile #91
	.byt $59, $7A, $71, $72, $55, $62, $65, $6A	; tile #92
	.byt $76, $7F, $5D, $7F, $77, $7F, $5D, $7F	; tile #93
	.byt $54, $4A, $55, $4A, $45, $6A, $65, $62	; tile #94
	.byt $7F, $5F, $5F, $5F, $5F, $5F, $5F, $5F	; tile #95
	.byt $7E, $7E, $7D, $7D, $79, $7B, $7B, $7B	; tile #96
	.byt $50, $7A, $70, $7A, $50, $7A, $70, $7A	; tile #97
	.byt $46, $6A, $40, $6A, $42, $6B, $41, $6A	; tile #98
	.byt $40, $40, $40, $40, $40, $40, $60, $60	; tile #99
	.byt $43, $43, $41, $43, $43, $43, $41, $43	; tile #100
	.byt $45, $4A, $55, $4A, $55, $4A, $55, $62	; tile #101
	.byt $55, $72, $75, $72, $55, $72, $75, $72	; tile #102
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $5F, $5F	; tile #103
	.byt $79, $7B, $7B, $7B, $79, $7D, $7D, $7D	; tile #104
	.byt $40, $60, $60, $70, $50, $70, $50, $70	; tile #105
	.byt $43, $43, $41, $43, $43, $41, $41, $41	; tile #106
	.byt $77, $5F, $5D, $5F, $47, $4F, $4D, $4F	; tile #107
	.byt $55, $72, $75, $72, $55, $62, $45, $4A	; tile #108
	.byt $51, $7A, $71, $7A, $59, $7A, $75, $72	; tile #109
	.byt $4F, $6F, $4F, $6F, $4F, $6F, $4F, $6F	; tile #110
	.byt $7D, $7C, $7E, $7E, $7E, $7E, $7E, $7E	; tile #111
	.byt $50, $70, $48, $68, $4C, $6C, $44, $6C	; tile #112
	.byt $41, $41, $41, $41, $40, $40, $40, $40	; tile #113
	.byt $47, $4E, $4C, $44, $41, $40, $41, $40	; tile #114
	.byt $55, $4A, $55, $6A, $55, $6A, $55, $40	; tile #115
	.byt $77, $7F, $5D, $7F, $77, $7F, $5D, $40	; tile #116
	.byt $55, $72, $65, $6A, $55, $4A, $55, $4A	; tile #117
	.byt $7E, $7E, $7E, $7E, $7E, $7F, $7F, $7F	; tile #118
	.byt $77, $7F, $5D, $7F, $77, $5F, $5D, $5F	; tile #119
	.byt $59, $7A, $71, $7A, $59, $7A, $71, $7A	; tile #120
	.byt $57, $67, $55, $67, $57, $67, $55, $67	; tile #121
	.byt $50, $7A, $60, $6A, $40, $6A, $40, $6A	; tile #122
	.byt $44, $6C, $44, $6C, $44, $6C, $44, $6C	; tile #123
	.byt $5D, $5F, $57, $5F, $5D, $4F, $47, $4F	; tile #124
	.byt $47, $41, $40, $40, $40, $40, $40, $40	; tile #125
	.byt $7F, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #126
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $77	; tile #127
	.byt $55, $6A, $65, $42, $75, $72, $79, $58	; tile #128
	.byt $4F, $6F, $4F, $6F, $4F, $5F, $5F, $5F	; tile #129
	.byt $57, $5F, $5D, $5F, $57, $5F, $5D, $40	; tile #130
	.byt $5D, $7F, $77, $7F, $5D, $7F, $77, $40	; tile #131
	.byt $5D, $7C, $75, $7C, $5D, $7C, $75, $40	; tile #132
	.byt $77, $7F, $5D, $7F, $77, $7E, $5C, $6A	; tile #133
	.byt $44, $6C, $4C, $68, $58, $70, $50, $70	; tile #134
	.byt $4D, $47, $47, $47, $41, $43, $43, $42	; tile #135
	.byt $7F, $57, $5F, $4D, $43, $40, $40, $40	; tile #136
	.byt $7F, $5D, $7F, $77, $7F, $4D, $43, $40	; tile #137
	.byt $7D, $74, $7C, $5C, $7F, $77, $7F, $5D	; tile #138
	.byt $5F, $7F, $7F, $7F, $40, $5D, $7F, $77	; tile #139
	.byt $7F, $7F, $7F, $7F, $40, $77, $7F, $5D	; tile #140
	.byt $7F, $61, $6C, $57, $5F, $5D, $7F, $77	; tile #141
	.byt $7C, $73, $4F, $5D, $7F, $77, $7F, $5D	; tile #142
	.byt $47, $40, $7F, $77, $7F, $5D, $7F, $77	; tile #143
	.byt $40, $77, $7F, $5D, $7F, $77, $7F, $5D	; tile #144
	.byt $7E, $76, $7E, $5C, $7C, $76, $7C, $5A	; tile #145
	.byt $40, $6B, $43, $6E, $44, $6C, $48, $78	; tile #146
	.byt $70, $60, $40, $40, $40, $40, $40, $40	; tile #147
	.byt $41, $41, $40, $40, $40, $40, $40, $40	; tile #148
	.byt $7F, $5D, $7F, $57, $5F, $4D, $4F, $47	; tile #149
	.byt $4F, $41, $40, $40, $40, $40, $40, $40	; tile #150
	.byt $7F, $5D, $4F, $47, $43, $41, $40, $40	; tile #151
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7E, $72	; tile #152
	.byt $78, $72, $70, $5A, $70, $6A, $40, $6A	; tile #153
	.byt $40, $6A, $41, $6B, $42, $6E, $44, $78	; tile #154
	.byt $70, $60, $60, $40, $40, $40, $40, $40	; tile #155
	.byt $47, $45, $43, $41, $41, $41, $40, $40	; tile #156
	.byt $7F, $77, $7F, $5D, $78, $70, $60, $40	; tile #157
	.byt $7F, $5D, $7F, $77, $7F, $5D, $5F, $47	; tile #158
	.byt $5F, $47, $47, $41, $41, $41, $40, $40	; tile #159
	.byt $7F, $5D, $7F, $77, $7F, $5C, $7E, $76	; tile #160
	.byt $7F, $77, $7E, $59, $72, $6A, $42, $6A	; tile #161
	.byt $7F, $5D, $5F, $57, $5F, $4D, $4F, $47	; tile #162
	.byt $7F, $76, $7E, $5C, $7C, $72, $60, $48	; tile #163
	.byt $40, $6A, $40, $6A, $40, $6B, $46, $70	; tile #164
	.byt $40, $6A, $40, $6F, $5C, $60, $40, $40	; tile #165
	.byt $40, $6B, $47, $7C, $40, $40, $40, $40	; tile #166
	.byt $47, $45, $47, $47, $43, $40, $40, $40	; tile #167
	.byt $7F, $77, $7F, $5D, $7F, $77, $43, $41	; tile #168
	.byt $5F, $4D, $40, $40, $40, $40, $40, $40	; tile #169
	.byt $7F, $77, $40, $40, $40, $40, $40, $40	; tile #170
	.byt $7F, $5D, $4F, $43, $43, $41, $41, $40	; tile #171
	.byt $7E, $5C, $7E, $72, $60, $4A, $60, $6A	; tile #172
	.byt $42, $6A, $42, $6A, $42, $6A, $42, $6A	; tile #173
	.byt $46, $45, $40, $40, $40, $40, $40, $40	; tile #174
	.byt $4F, $70, $40, $40, $40, $40, $40, $40	; tile #175
	.byt $70, $40, $40, $40, $40, $40, $40, $40	; tile #176
	.byt $41, $40, $40, $40, $40, $40, $40, $40	; tile #177
	.byt $7F, $5D, $5F, $47, $4F, $40, $40, $40	; tile #178
	.byt $7F, $77, $7C, $50, $60, $40, $40, $40	; tile #179
	.byt $7F, $5D, $5F, $47, $43, $40, $40, $40	; tile #180
	.byt $7F, $77, $7F, $5D, $7F, $77, $5F, $40	; tile #181
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $54	; tile #182
	.byt $5F, $47, $43, $41, $40, $40, $40, $40	; tile #183
	.byt $7F, $5D, $7F, $77, $5F, $40, $40, $40	; tile #184
	.byt $7F, $77, $7F, $5D, $7F, $40, $40, $40	; tile #185
	.byt $7F, $5D, $7F, $77, $7F, $45, $43, $40	; tile #186
	.byt $7F, $77, $7F, $5D, $7F, $77, $7C, $40	; tile #187
	.byt $7F, $5D, $7F, $77, $7F, $5D, $40, $40	; tile #188
	.byt $7F, $77, $7F, $5D, $7F, $77, $41, $40	; tile #189
	.byt $7F, $5D, $7F, $77, $7F, $5D, $7F, $72	; tile #190
	.byt $7F, $77, $7F, $5D, $7F, $77, $78, $4A	; tile #191
	.byt $7F, $5D, $7F, $77, $78, $4A, $41, $6F	; tile #192
	.byt $7F, $77, $7F, $5D, $48, $70, $60, $40	; tile #193
	.byt $7F, $5D, $7F, $76, $40, $40, $40, $40	; tile #194
	.byt $7F, $77, $7F, $41, $40, $40, $40, $40	; tile #195
	.byt $7F, $5D, $7F, $63, $7C, $45, $40, $40	; tile #196
	.byt $7F, $76, $7C, $5A, $40, $77, $40, $40	; tile #197
	.byt $40, $6A, $40, $62, $4F, $58, $40, $40	; tile #198
	.byt $42, $66, $44, $48, $78, $40, $40, $40	; tile #199
	.byt $5F, $40, $40, $40, $40, $40, $40, $40	; tile #200
	.byt $63, $40, $40, $40, $40, $40, $40, $40	; tile #201
	.byt $70, $4F, $40, $40, $40, $40, $40, $40	; tile #202
	.byt $40, $7F, $40, $40, $40, $40, $40, $40	; tile #203
	.byt $7C, $60, $40, $40, $40, $40, $40, $40	; tile #204
zplane_data
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 054, 058, 000, 062, 064, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 012, 055, 000, 000, 000, 065, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 046, 000, 000, 000, 000, 066, 069, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 047, 000, 000, 000, 000, 000, 000, 072, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 048, 000, 000, 000, 000, 000, 000, 073, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 039, 049, 000, 000, 000, 000, 000, 000, 000, 077, 001, 001, 001, 001
	.byt 001, 001, 001, 040, 000, 000, 000, 000, 000, 000, 000, 000, 078, 001, 001, 001, 001
	.byt 001, 001, 026, 041, 000, 000, 000, 000, 000, 000, 000, 000, 000, 084, 001, 001, 001
	.byt 001, 001, 027, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 091, 001, 001
	.byt 001, 005, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 092, 001, 001
	.byt 001, 006, 028, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 093, 001, 001
	.byt 001, 001, 029, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 102, 001
	.byt 001, 007, 030, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 103, 001
	.byt 001, 008, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 104, 001
	.byt 001, 009, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 105, 001
	.byt 002, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 106, 001
	.byt 003, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 107, 001
	.byt 004, 010, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 108, 001
	.byt 001, 011, 031, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 117
	.byt 001, 012, 032, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 118
	.byt 001, 013, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 109, 119
	.byt 001, 014, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 110, 001
	.byt 001, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 111, 001
	.byt 001, 015, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 112, 001
	.byt 001, 016, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 113, 001
	.byt 001, 017, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 114, 001
	.byt 001, 018, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 115, 001
	.byt 001, 019, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 116, 001
	.byt 001, 020, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 085, 094, 001, 001
	.byt 001, 021, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 086, 001, 001, 001
	.byt 001, 022, 033, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 087, 095, 001, 001
	.byt 001, 001, 034, 028, 000, 000, 000, 000, 000, 000, 000, 000, 000, 088, 001, 001, 001
	.byt 001, 001, 001, 042, 050, 000, 000, 000, 000, 000, 000, 000, 079, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 051, 000, 000, 000, 000, 000, 000, 074, 080, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 052, 000, 000, 000, 000, 000, 070, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 056, 059, 059, 059, 067, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 001, 007, 057, 060, 061, 063, 001, 001, 001, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 043, 053, 000, 000, 000, 000, 068, 071, 075, 001, 001, 001, 001, 001
	.byt 001, 001, 001, 044, 000, 000, 000, 000, 000, 000, 000, 076, 081, 001, 001, 001, 001
	.byt 001, 001, 012, 045, 000, 000, 000, 000, 000, 000, 000, 000, 082, 001, 001, 001, 001
	.byt 001, 001, 035, 000, 000, 000, 000, 000, 000, 000, 000, 000, 083, 089, 001, 001, 001
	.byt 001, 023, 036, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 090, 096, 001, 001
	.byt 001, 024, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 097, 001, 001
	.byt 001, 025, 028, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 098, 001, 001
	.byt 001, 001, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 099, 001, 001
	.byt 001, 001, 037, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 100, 001, 001
	.byt 001, 001, 038, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 000, 101, 001, 001
zplane_tiles
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #1
	.byt $7F, $7F, $7E, $7C, $78, $70, $60, $40	; tile #2
	.byt $7F, $7F, $40, $40, $40, $40, $40, $40	; tile #3
	.byt $7F, $7F, $43, $41, $41, $41, $41, $41	; tile #4
	.byt $7F, $7F, $7F, $7F, $7E, $7C, $70, $70	; tile #5
	.byt $7F, $7F, $7F, $4F, $4F, $4F, $4F, $43	; tile #6
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7E, $7E	; tile #7
	.byt $7F, $7F, $7F, $7C, $70, $60, $40, $40	; tile #8
	.byt $7E, $78, $40, $40, $40, $40, $40, $40	; tile #9
	.byt $41, $41, $41, $40, $40, $40, $40, $40	; tile #10
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $5F, $5F	; tile #11
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7E	; tile #12
	.byt $7F, $7F, $7F, $7F, $78, $60, $60, $40	; tile #13
	.byt $7C, $70, $70, $40, $40, $40, $40, $40	; tile #14
	.byt $5F, $40, $40, $40, $40, $40, $40, $40	; tile #15
	.byt $7F, $43, $41, $41, $40, $40, $40, $40	; tile #16
	.byt $7F, $7F, $7F, $7F, $40, $40, $40, $40	; tile #17
	.byt $7F, $7F, $7F, $78, $40, $40, $40, $40	; tile #18
	.byt $7F, $7F, $7F, $40, $40, $40, $40, $40	; tile #19
	.byt $7F, $7F, $7F, $5F, $5F, $4F, $47, $40	; tile #20
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $40	; tile #21
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $5F	; tile #22
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7C, $7C	; tile #23
	.byt $7F, $7F, $7F, $7E, $60, $40, $40, $40	; tile #24
	.byt $7F, $7F, $67, $47, $47, $47, $41, $41	; tile #25
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7E, $7C	; tile #26
	.byt $7E, $7C, $70, $60, $60, $40, $40, $40	; tile #27
	.byt $41, $40, $40, $40, $40, $40, $40, $40	; tile #28
	.byt $7F, $7F, $5F, $4F, $42, $40, $40, $40	; tile #29
	.byt $78, $70, $60, $40, $40, $40, $40, $40	; tile #30
	.byt $4F, $4F, $47, $43, $41, $40, $40, $40	; tile #31
	.byt $7C, $78, $70, $60, $40, $40, $40, $40	; tile #32
	.byt $4F, $4F, $47, $47, $43, $40, $40, $40	; tile #33
	.byt $7F, $7F, $7F, $7F, $7F, $43, $43, $41	; tile #34
	.byt $7F, $7F, $7F, $7F, $7F, $7E, $7C, $40	; tile #35
	.byt $70, $70, $60, $40, $40, $40, $40, $40	; tile #36
	.byt $47, $43, $41, $41, $41, $40, $40, $40	; tile #37
	.byt $7F, $7F, $7F, $7E, $78, $40, $40, $40	; tile #38
	.byt $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7C	; tile #39
	.byt $7F, $7F, $7E, $70, $60, $40, $40, $40	; tile #40
	.byt $78, $70, $40, $40, $40, $40, $40, $40	; tile #41
	.byt $7F, $7F, $7F, $5F, $4F, $4F, $47, $43	; tile #42
	.byt $7F, $7F, $73, $73, $70, $60, $60, $60	; tile #43
	.byt $7F, $7F, $7F, $7F, $7F, $5F, $5F, $4E	; tile #44
	.byt $7C, $78, $70, $60, $60, $40, $40, $40	; tile #45
	.byt $7F, $7F, $7F, $7F, $7F, $7C, $70, $40	; tile #46
	.byt $7F, $7F, $7F, $7F, $70, $40, $40, $40	; tile #47
	.byt $7F, $7F, $7F, $70, $40, $40, $40, $40	; tile #48
	.byt $78, $60, $40, $40, $40, $40, $40, $40	; tile #49
	.byt $43, $43, $41, $40, $40, $40, $40, $40	; tile #50
	.byt $7F, $7F, $78, $40, $40, $40, $40, $40	; tile #51
	.byt $7F, $4F, $47, $43, $41, $41, $40, $40	; tile #52
	.byt $60, $40, $40, $40, $40, $40, $40, $40	; tile #53
	.byt $7F, $7F, $7F, $7F, $7F, $7E, $7C, $7C	; tile #54
	.byt $7C, $70, $70, $60, $40, $40, $40, $40	; tile #55
	.byt $5F, $5F, $5F, $5F, $5F, $5F, $5F, $4F	; tile #56
	.byt $7E, $7E, $7E, $7E, $7E, $7C, $7C, $7C	; tile #57
	.byt $78, $70, $60, $60, $60, $60, $60, $60	; tile #58
	.byt $4F, $4F, $4F, $4F, $4F, $4F, $4F, $4F	; tile #59
	.byt $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C	; tile #60
	.byt $7C, $7C, $7C, $7C, $7C, $7E, $7E, $7E	; tile #61
	.byt $40, $60, $60, $60, $70, $70, $70, $70	; tile #62
	.byt $7E, $7E, $7E, $7E, $7F, $7F, $7F, $7F	; tile #63
	.byt $70, $70, $70, $78, $7C, $7E, $7E, $7F	; tile #64
	.byt $40, $40, $40, $40, $40, $40, $40, $7F	; tile #65
	.byt $40, $40, $40, $40, $40, $40, $40, $70	; tile #66
	.byt $4F, $4F, $5F, $7F, $7F, $7F, $7F, $7F	; tile #67
	.byt $40, $60, $60, $60, $60, $70, $70, $70	; tile #68
	.byt $78, $7E, $7F, $7F, $7F, $7F, $7F, $7F	; tile #69
	.byt $40, $40, $40, $40, $40, $43, $43, $7F	; tile #70
	.byt $70, $78, $78, $78, $7C, $7C, $7C, $7C	; tile #71
	.byt $40, $60, $60, $70, $7C, $7F, $7F, $7F	; tile #72
	.byt $40, $40, $40, $40, $40, $70, $7C, $7F	; tile #73
	.byt $41, $41, $41, $43, $43, $43, $43, $47	; tile #74
	.byt $7E, $7E, $7F, $7F, $7F, $7F, $7F, $7F	; tile #75
	.byt $40, $40, $40, $60, $60, $70, $70, $70	; tile #76
	.byt $70, $7E, $7F, $7F, $7F, $7F, $7F, $7F	; tile #77
	.byt $40, $40, $70, $78, $7C, $7E, $7F, $7F	; tile #78
	.byt $40, $40, $40, $40, $40, $40, $41, $4F	; tile #79
	.byt $47, $4F, $4F, $4F, $4F, $5F, $7F, $7F	; tile #80
	.byt $78, $78, $7C, $7E, $7E, $7E, $7F, $7F	; tile #81
	.byt $40, $40, $40, $40, $47, $47, $5F, $7F	; tile #82
	.byt $40, $40, $40, $40, $40, $40, $60, $70	; tile #83
	.byt $60, $70, $78, $7C, $7E, $7E, $7F, $7F	; tile #84
	.byt $40, $40, $40, $40, $40, $41, $41, $41	; tile #85
	.byt $40, $40, $43, $4F, $4F, $7F, $7F, $7F	; tile #86
	.byt $40, $40, $60, $60, $60, $70, $70, $78	; tile #87
	.byt $40, $41, $41, $43, $43, $47, $5F, $7F	; tile #88
	.byt $78, $78, $78, $78, $7C, $7F, $7F, $7F	; tile #89
	.byt $40, $40, $40, $40, $40, $40, $7C, $7E	; tile #90
	.byt $60, $70, $7F, $7F, $7F, $7F, $7F, $7F	; tile #91
	.byt $40, $40, $7F, $7F, $7F, $7F, $7F, $7F	; tile #92
	.byt $40, $40, $70, $7C, $7C, $7E, $7E, $7F	; tile #93
	.byt $41, $41, $41, $47, $5F, $5F, $5F, $5F	; tile #94
	.byt $79, $79, $7B, $7F, $7F, $7F, $7F, $7F	; tile #95
	.byt $7E, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #96
	.byt $40, $40, $60, $70, $70, $7F, $7F, $7F	; tile #97
	.byt $40, $40, $43, $4F, $5F, $7F, $7F, $7F	; tile #98
	.byt $40, $40, $60, $70, $7C, $7F, $7F, $7F	; tile #99
	.byt $40, $40, $40, $40, $40, $40, $60, $7F	; tile #100
	.byt $40, $40, $40, $40, $40, $40, $40, $63	; tile #101
	.byt $60, $70, $7C, $7E, $7F, $7F, $7F, $7F	; tile #102
	.byt $40, $40, $40, $40, $60, $7F, $7F, $7F	; tile #103
	.byt $40, $40, $40, $40, $40, $7F, $7F, $7F	; tile #104
	.byt $40, $40, $40, $40, $40, $78, $7C, $7F	; tile #105
	.byt $40, $40, $40, $40, $40, $40, $43, $7F	; tile #106
	.byt $40, $40, $40, $40, $40, $40, $7F, $7F	; tile #107
	.byt $40, $40, $40, $40, $40, $40, $7E, $7F	; tile #108
	.byt $40, $40, $40, $40, $40, $40, $40, $4F	; tile #109
	.byt $40, $40, $40, $40, $40, $40, $47, $7F	; tile #110
	.byt $40, $40, $40, $40, $47, $7F, $7F, $7F	; tile #111
	.byt $40, $40, $40, $40, $7F, $7F, $7F, $7F	; tile #112
	.byt $40, $40, $40, $41, $7F, $7F, $7F, $7F	; tile #113
	.byt $40, $40, $40, $7F, $7F, $7F, $7F, $7F	; tile #114
	.byt $40, $40, $40, $7C, $7F, $7F, $7F, $7F	; tile #115
	.byt $40, $41, $43, $47, $7F, $7F, $7F, $7F	; tile #116
	.byt $60, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #117
	.byt $5C, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #118
	.byt $4F, $7F, $7F, $7F, $7F, $7F, $7F, $7F	; tile #119
	
	
; Walkbox Data
wb_data
	.byt 005, 051, 011, 014, $01
	.byt 003, 004, 010, 011, $01
; Walk matrix
wb_matrix
	.byt 0, 1
	.byt 0, 1


res_end
.)



; Object resource 200: Exit cliff
.(
	.byt RESOURCE_OBJECT|$80
	.word (res_end-res_start+4)
	.byt 200
res_start
	.byt 0|OBJ_FLAG_PROP
	.byt 2,16	;Size (cols, rows)
	.byt 255	;Initial room
	.byt 51,16	;Location (col, row)
	.byt ZPLANE_1	;Zplane
	.byt 51,13	;Walk position (col, row)
	.byt FACING_RIGHT
	.byt 0	; Color of text
#ifdef ENGLISH	
	.asc "Exit",0	;Object's name
#endif
#ifdef SPANISH
	.asc "Salida",0	;Object's name
#endif		
res_end
.)

; Object resource 201: Passageway
.(
	.byt RESOURCE_OBJECT|$80
	.word (res_end-res_start+4)
	.byt 201
res_start
	.byt 0|OBJ_FLAG_PROP
	.byt 5,5	;Size (cols, rows)
	.byt 255	;Initial room
	.byt 3,9	;Location (col, row)
	.byt ZPLANE_1	;Zplane
	.byt 4,10	;Walk position (col, row)
	.byt FACING_UP
	.byt 0	; Color of text
#ifdef ENGLISH	
	.asc "Passageway",0	;Object's name
#endif
#ifdef SPANISH
	.asc "Pasaje",0	;Object's name
#endif		
res_end
.)


#include "..\scripts\cacave.s"


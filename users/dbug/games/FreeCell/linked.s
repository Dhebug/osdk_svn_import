//
// This file was generated by Link65 version 0.063 
// Do not edit by hand
//
#file "D:\sources\oric\_games_\FreeCell\game.s"

#define     MAXPOS         16
#define     MAXCOL          8    
#define 	EMPTYCARD	   52


	.zero

sp		.dsb 2		

tmp0	.dsb 2
tmp1	.dsb 2
tmp2	.dsb 2
tmp3	.dsb 2
tmp4	.dsb 2
tmp5	.dsb 2
tmp6	.dsb 2
tmp7	.dsb 2

op1		.dsb 2
op2		.dsb 2

tmp		.dsb 2
	
_z_game_number		.dsb 2
_z_card_left		.dsb 1
_z_i				.dsb 1
_z_j				.dsb 1
_z_result			.dsb 1
_z_undo_index		.dsb 1
_z_redo_index		.dsb 1

_z_start_pos		.dsb 1
_z_end_pos			.dsb 1
_z_randomize		.dsb 1
_z_key				.dsb 1

_z_old_pos			.dsb 1
_z_choice			.dsb 1

	.text
		

#define _hires		$ec33
#define _text		$ec21
	
	


_Main
	jsr _Initialize
	
start_new_game		
	
	
	
	
	jsr _RandomizeStartup
				
start_main_loop			
	
	
	
	
	jsr _ShowGame
	
	jmp _SelectStartPosition
validateStartPosition	
						

	
	
	
	lda #<_Message_SelectDestination
	sta _z_data_ptr+0
	lda #>_Message_SelectDestination
	sta _z_data_ptr+1
	jsr _PrintText
			
	lda _z_start_pos	
	sta _z_end_pos
	sta _z_old_pos

	jsr _SearchBestDefaultTarget
							
	jsr _SelectEndPosition
		
	
	
	
	
	jsr _MoveCard
	jmp start_main_loop





uitoa
	ldy #0
	sty _ItoaConvertBuffer
itoaloop
	jsr udiv10
	pha
	iny
	lda op2
	ora op2+1
	bne itoaloop
	
	ldx #0
	lda _ItoaConvertBuffer
	beq poploop
	inx
poploop
	pla
	clc
	adc #$30
	sta _ItoaConvertBuffer,x
	inx
	dey
	bne poploop
	lda #0
	sta _ItoaConvertBuffer,x
	ldx #<_ItoaConvertBuffer
	lda #>_ItoaConvertBuffer
	rts
			



udiv10
	lda #0
	ldx #16
	clc
udiv10lp
	rol op2
	rol op2+1
	rol 
	cmp #10
	bcc contdiv
	sbc #10
contdiv
	dex
	bne udiv10lp
	rol op2
	rol op2+1
    rts
        



mul16u
	lda #0
	sta tmp
	sta tmp+1
	ldy #16
mult1
	asl tmp
	rol tmp+1
	rol op1
	rol op1+1
	bcc mult2
	clc
	lda op2
	adc tmp
	sta tmp
	lda op2+1
	adc tmp+1
	sta tmp+1
	bcc mult2
	inc op1
mult2
	dey
	bne mult1
	ldx tmp
	lda tmp+1
	rts

mul16i
	lda op1+1
	bpl mul16u
	sec
	lda #0
	sbc op1
	sta op1
	lda #0
	sbc op1+1
	sta op1+1
	jsr mul16u
	sec
	lda #0
	sbc tmp
	tax
	lda #0
	sbc tmp+1
	rts







	


mul32u
.(
	lda #$00
	sta tmp4+4   
	sta tmp4+5   
	sta tmp4+6
	sta tmp4+7
	ldx #32      
SHIFT_R
	lsr tmp0+3   
	ror tmp0+2
	ror tmp0+1
	ror tmp0
	bcc ROTATE_R 
	lda tmp4+4   
	clc          
	adc tmp2    
	sta tmp4+4
	lda tmp4+5
	adc tmp2+1
	sta tmp4+5
	lda tmp4+6
	adc tmp2+2
	sta tmp4+6
	lda tmp4+7
	adc tmp2+3
ROTATE_R
	ror          
	sta tmp4+7   
	ror tmp4+6
	ror tmp4+5
	ror tmp4+4
	ror tmp4+3
	ror tmp4+2
	ror tmp4+1
	ror tmp4+0
	dex          
	bne SHIFT_R  
	
	
	
	
	rts	
.)           









_randseedLow .byt 0,0
_randseedTop .byt 0,0

_rand32
	
.(
	
	lda _randseedLow+0
	sta tmp0+0
	lda _randseedLow+1
	sta tmp0+1
	lda _randseedLow+2
	sta tmp0+2
	lda _randseedLow+3
	sta tmp0+3
	
	
	lda #$FD
	sta tmp2+0
	lda #$43
	sta tmp2+1
	lda #$03
	sta tmp2+2
	lda #$00
	sta tmp2+3
	
	
	
	jsr mul32u
	
	
	clc
	lda tmp4+0	
	adc #$C3
	sta _randseedLow+0
	lda tmp4+1
	adc #$9E
	sta _randseedLow+1
	lda tmp4+2	
	adc #$26
	sta _randseedLow+2
	lda tmp4+3	
	adc #$00
	sta _randseedLow+3
	
	rts
.)
	
	
	
	





_SuitConverTable
 .byt %11
 .byt %01
 .byt %00
 .byt %10
 
_CreateGame
.(
    
	.(
	ldx #MAXCOL*MAXPOS+4+4	
	lda #EMPTYCARD			
loop_clear	
	sta _CardSlots-1,x
	dex 
	bne loop_clear
	.)	
	
	
	lda #0
	sta _z_undo_index
	sta _z_redo_index
    

    
	.(
	ldx #51
loop
	txa
	and #%11
	tay
	txa
	and #%11111100
	ora _SuitConverTable,y
	
	sta _CardDeck,x
	dex
	bpl loop
	.)

    
    
    lda _z_game_number+0
    sta _randseedLow+0
    lda _z_game_number+1
    sta _randseedLow+1
    lda #0
    sta _randseedTop+0
    sta _randseedTop+1  
    
    
	.(
	lda #0
	sta _z_i
	
	
.(	
	ldx #16
loop_slot	
	sta _CardCountsInSlots-1,x
	dex
	bne loop_slot	
.)
	
	
	lda #<_CardSlots
	sta _z_card_ptr+0
	lda #>_CardSlots
	sta _z_card_ptr+1
	
	lda #52
	sta _z_card_left
loop_card
	
	
	
	jsr _rand32

	lda _randseedTop+0 
	sta op1 
	lda _randseedTop+1 
	and #$7f
	sta op1+1 
	
	lda _z_card_left
	sta op2+0
	lda #0
	sta op2+1 
	
	jsr mod16i 	
	
	
	stx _z_j

	
    
    
    ldy _z_j
    lda _CardDeck,y
    ldy #0
    sta (_z_card_ptr),y
    
    
    
    
    ldx _z_card_left
    lda _CardDeck-1,x
	
    ldx _z_j
    sta _CardDeck,x
	
    
    
    
    clc 
    lda _z_card_ptr+0
    adc #<MAXPOS
    sta _z_card_ptr+0
    lda _z_card_ptr+1
    adc #>MAXPOS
    sta _z_card_ptr+1
        
    ldx _z_i
    inc _CardCountsInColumns,x
    
    









    inc _z_i
    lda _z_i
    cmp #8
    bne skip
    lda #0
    sta _z_i

    sec 
    lda _z_card_ptr+0
    sbc #<MAXPOS*MAXCOL-1
    sta _z_card_ptr+0
    lda _z_card_ptr+1
    sbc #>MAXPOS*MAXCOL-1
    sta _z_card_ptr+1
        
skip    
    
	dec _z_card_left
	bne loop_card
	
	rts
	.)

.)






_InsertCard
.(
	lda _z_position
	cmp #8
	bcs cells_or_foundations
cards
	jsr _GetLastFreeSlot
	
	lda _z_card
	sta _CardSlots,y
	inc _CardCountsInColumns,x	
	rts

cells_or_foundations
	tax
	
	lda _z_card
	sta _CardSlotsCells-8,x
	lda #1
	sta _CardCountsInCells-8,x	
	
	rts
.)





_GetLastFreeSlot
.(
	tax
	asl				
	asl				
	asl				
	asl				
	clc
	adc _CardCountsInColumns,x
	tay

	rts
.)













































































_IsValidPosition
.(
	
	lda #0
	sta _z_result
	
	lda _z_position
	cmp #8
	bcs cells_or_foundations
	
	























	
cards
	tax
	lda _CardCountsInColumns,x
	beq is_valid	
	
	
	txa
	jsr _GetLastFreeSlot
	
	lda _CardSlots-1,y
	sta _z_top_card
	
	
	lda _z_card
	eor _z_top_card 
	and #%00000010
	beq is_invalid	
	

	lda _z_top_card
	and #%11111100
	sta _z_top_card

	clc	
	lda _z_card
	and #%11111100
	adc #4
	cmp _z_top_card
	beq is_valid	
	rts				
	
	
	
cells_or_foundations	
	and #%0111		
	cmp #4
	bcs foundations
	
cells
	tax
	lda _CardCountsInCells,x
	beq is_valid
	rts				
		
foundations	
	and #%0011		
	tax
	lda _CardSlotsFoundations,x
	sta _z_top_card
	cmp #EMPTYCARD
	bne some_cards

no_cards
	
	
	
	lda _z_card
	and #%11111100
	beq is_valid
	rts				
	
some_cards	
	
	
	
	
	lda _z_card
	eor _z_top_card 
	and #%00000011
	bne is_invalid	
	
	clc
	lda _z_top_card
	adc #4
	cmp _z_card
	beq is_valid
	rts				
			
is_valid	
	lda #1
	sta _z_result
is_invalid	
	rts
.)

































_FindCard
.(
	lda _z_position
	cmp #8
	bcs cells_or_foundations
cards	
	jsr _GetLastFreeSlot
	
	lda _CardSlots-1,y
	sta _z_card
	rts
	
cells_or_foundations
	and #%0111		
	tax
	lda _CardSlotsCells,x
	sta _z_card
	rts
.)











































_FindAndRemoveCard
.(
	lda _z_position
	cmp #8
	bcs cells_or_foundations
cards	
	jsr _GetLastFreeSlot
	
	lda _CardSlots-1,y
	sta _z_card
	
	lda #EMPTYCARD
	sta _CardSlots-1,y
	dec _CardCountsInColumns,x
	rts
	
cells_or_foundations
	and #%0111		
	cmp #4
	bcs foundations

cells	
	tax
	lda _CardSlotsCells,x
	sta _z_card
	
	lda #EMPTYCARD
	sta _CardSlotsCells,x
	lda #0
	sta _CardCountsInCells,x	
	rts
	
foundations
	and #%0011		
	tax
	lda _CardSlotsFoundations,x
	sta _z_card
	
	
	lsr
	lsr
	beq last_card

decrement_card
	sta tmp1
	dec tmp1
	asl tmp1
	asl tmp1
	lda _z_card		
	and #%00000011
	ora tmp1
	sta _CardSlotsFoundations,x
	rts
	
last_card
	
	lda #EMPTYCARD
	sta _CardSlotsFoundations,x
	lda #0
	sta _CardCountsInFoundations,x	
	rts
	
.)











_TestWinOrLost
.(
	
	lda #0
	sta _z_result
	
	
	ldx #4
loop_test_win	
	lda _CardSlotsFoundations-1,x
	lsr
	lsr
	cmp #12				
	bne test_lost
	dex 
	bne loop_test_win

	
	inc _z_result
	rts
	
		
test_lost	
	
	
	
	rts
.)



_RandomizeStartup
.(
	
	
	
	jsr _RefreshScreen

	jsr _PrintTitle

	
	
	
	
	lda #<_Message_PressEnter
	sta _z_data_ptr+0
	lda #>_Message_PressEnter
	sta _z_data_ptr+1

	jsr _PrintText
	
	lda #1
	sta _z_randomize
	
	

































	

loop
	jsr $23B       		
	
	
	cmp #13
	beq end_loop
	
	
	cmp #27
	bne end_escape
	lda _z_randomize
	eor #1
	sta _z_randomize
	jmp check_random
end_escape

	
	sec
	sbc #"0"
	cmp #10
	bcs end_digits

	sta _z_key
	
	
	lda _z_randomize
	bne reset_game_number
	
	
	lda #<6552
	cmp _z_game_number+0
	lda #>6552
	sbc _z_game_number+1
	bcs insert_digit
	
reset_game_number
	lda #0
	sta _z_randomize	
	sta _z_game_number+0
	sta _z_game_number+1
	
insert_digit
	
	
	
	lda _z_game_number+0
	sta op1+0
	lda _z_game_number+1
	sta op1+1
	
	lda #10
	sta op2+0
	lda #0
	sta op2+1
	
	jsr mul16u

	clc	
	lda tmp+0
	adc _z_key
	sta _z_game_number+0
	lda tmp+1
	adc #0
	sta _z_game_number+1

		
end_digits	

check_random
	lda _z_randomize
	beq print_number
	
	jsr _rand32
	lda _randseedLow+0
	sta _z_game_number+0
	lda _randseedLow+1
	sta _z_game_number+1

print_number
	jsr _PrintGameNumber

	jmp loop
		
end_loop


	
	
	
	jsr _CreateGame
	
	lda #0
	sta _z_start_pos
	sta _z_end_pos
	
	jsr _RefreshScreen
	
	rts
.)



_MoveCard
.(
	
	lda _z_start_pos
	cmp _z_end_pos
	beq skip

	
	sta _z_position
	jsr _FindAndRemoveCard
	lda _z_end_pos
	sta _z_position
	jsr _InsertCard
	
	
	ldx _z_undo_index
	lda _z_start_pos
	sta _UndoBufferFrom,x
	lda _z_end_pos
	sta _UndoBufferTo,x
	inx
	stx _z_undo_index
	stx _z_redo_index
	
skip
	rts
.)





_SearchBestDefaultTarget
.(
	
	lda _z_start_pos
	cmp #12
	bcs done

	
	sta _z_position
	jsr _FindCard

	
	ldx #11
loop_search	
	inx
	cpx #16
	beq done
	stx _z_position
	jsr _IsValidPosition
	ldx _z_position
	lda _z_result
	beq loop_search

	
	stx _z_end_pos
		
done
	rts
.)



_HandleArrowKeysStart
	lda _z_start_pos
	jsr _HandleArrowKeys
	sta _z_start_pos
	rts
	
_HandleArrowKeysEnd
	lda _z_end_pos
	jsr _HandleArrowKeys
	sta _z_end_pos
	rts
	
	
_HandleArrowKeys
.(
	
	ldx _z_choice
testleft	
	cpx #8
	bne testright
	sec
	sbc #1
	jmp end
		
testright	
	cpx #9
	bne testup
	clc
	adc #1
	jmp end

testup	
	cpx #10
	bne testdown
	sec
	sbc #8
	
	ldy #8
	sty _z_choice
	jmp end

testdown	
	cpx #11
	bne end
	clc
	adc #8
	
	ldy #9
	sty _z_choice
	jmp end
		
end
	and #15
	rts
.)



_SelectEndPosition
.(
loop
	jsr _RefreshTwoCursors
	
get
	jsr $23B		
	bpl get         
	sta _z_choice
	
	cmp #13			
	beq end
	cmp #32			
	beq end
	cmp #27
	beq escape

inner_loop
	jsr _HandleArrowKeysEnd

	lda _z_end_pos
	sta _z_position
	jsr _IsValidPosition
	lda _z_result
	bne loop		
			
	
	lda _z_end_pos
	cmp _z_start_pos
	bne inner_loop
	cmp _z_old_pos
	bne inner_loop

	jmp loop
		
escape	
	
	lda #EMPTYCARD
	sta _z_card
end	
	rts
.)




escape	
	
	lda #<_Message_ConfirmQuit
	sta _z_data_ptr+0
	lda #>_Message_ConfirmQuit
	sta _z_data_ptr+1
	jsr _PrintText
	
get
	jsr $23B		
	cmp #13			
	beq quit_game
	cmp #27			
	bne get
		
	jmp outer_loop

quit_game
	jmp start_new_game
	
_SelectStartPosition
.(
	lda _z_start_pos
	sta _z_old_pos

+outer_loop
	
	lda #<_Message_SelectCard
	sta _z_data_ptr+0
	lda #>_Message_SelectCard
	sta _z_data_ptr+1
	jsr _PrintText
	
loop
	jsr _RefreshOneCursor
	
	lda _z_card
	cmp #EMPTYCARD
	bne read_keyboard
	
no_valid_card
	
	lda #9
	sta _z_choice
	jmp search_card
	
read_keyboard
	jsr $23B			
	bpl read_keyboard   
	sta _z_choice
	
	cmp #13			
	beq end
	cmp #32			
	beq end
	cmp #27
	beq escape
	cmp #"u"
	beq undo
	cmp #"U"
	beq undo
	cmp #"R"
	beq redo
	cmp #"R"
	beq redo
	
	
search_card		
	jsr _HandleArrowKeysStart

	lda _z_start_pos
	sta _z_position
	jsr _FindCard
	lda _z_card
	cmp #EMPTYCARD
	bne loop		
			
	
	lda _z_start_pos
	cmp _z_old_pos
	bne search_card

	jmp loop
			
end	
	jmp validateStartPosition

undo
	
	ldx _z_undo_index
	beq loop				
	dex
	stx _z_undo_index
	
	ldx _z_undo_index
	lda _UndoBufferTo,x
	sta _z_position
	jsr _FindAndRemoveCard

	ldx _z_undo_index
	lda _UndoBufferFrom,x
	sta _z_position
	jsr _InsertCard
	
	jmp start_main_loop

redo
	
	ldx _z_undo_index
	cpx _z_redo_index
	bcs loop				

	ldx _z_undo_index
	lda _UndoBufferFrom,x
	sta _z_position
	jsr _FindAndRemoveCard
	
	ldx _z_undo_index
	lda _UndoBufferTo,x
	sta _z_position
	jsr _InsertCard
		
	ldx _z_undo_index
	inx
	stx _z_undo_index
	
	jmp start_main_loop

	
.)

			




_Initialize
.(
	
.(
	lda #0
	sta tmp0+1	
	sta tmp0+2	
	
	lda #32
	sta tmp0+3	

	ldx #0
loop
	lda tmp0+1
	sta _TableDiv6,x

	ldy tmp0+2
	iny
	cpy #6
	bne skip_mod
	ldy #0
	inc tmp0+1
skip_mod
	sty tmp0+2
	
	
	lda tmp0+3
	sta _TableBit6Reverse,x
	
	lsr
	bne skip_mask
	lda #32
skip_mask	
	sta tmp0+3	

	inx
	bne loop
.)

	
.(
	ldx #0
loop
	
	clc
low	
	lda #<_Cards
	sta _CardsAddrLow,x
	adc #<4*37
	sta low+1
high	
	lda #>_Cards
	sta _CardsAddrHigh,x
	adc #>4*37
	sta high+1

	inx
	cpx #53
	bne loop
.)
	
	
	.(
	lda #<_Cards
	sta _z_card_ptr+0
	lda #>_Cards
	sta _z_card_ptr+1

	ldx #0
loop_card
	stx _z_card
		
	ldx #0
loop_color
	stx _z_color
	
	jsr _GenerateCard
	
	clc
	lda _z_card_ptr+0
	adc #<4*37
	sta _z_card_ptr+0
	lda _z_card_ptr+1
	adc #>4*37
	sta _z_card_ptr+1
	
	ldx _z_color
	inx
	cpx #4
	bne loop_color
	
	ldx _z_card
	inx
	cpx #13
	bne loop_card
	.)

	
	jsr _GenerateCellCard


	
	jsr _text

    		
	
	
	
	jsr _hires
	
	
	
	
	
	
	
	
	
	
	
	
	lda #2		
	sta $26a

	jsr _ClearTextArea
	
	lda #1
	sta _z_game_number
.)



_RefreshScreen
.(	
	lda #<$a000
	sta tmp0+0
	lda #>$a000
	sta tmp0+1
	
	ldx #200
loop_y

	ldy #0
	lda #6
	sta (tmp0),y

	txa
	and #1
	beq skip
	lda #64+128
	bne loop_x
skip	
	lda #64+1+2+4+8+16+32
	
loop_x
	iny 
	sta (tmp0),y
	cpy #39
	bne loop_x
	
	clc
	lda tmp0+0
	adc #40
	sta tmp0+0
	lda tmp0+1
	adc #0
	sta tmp0+1
	
	dex
	bne loop_y	
	
	rts
.)



_ClearTextArea
.(
	ldx #40*3
	lda #32
loop	
	sta $bb80+25*40-1,x
	dex
	bne loop
	rts
.)



_PrintGameNumber
.(
	lda _z_game_number+0	
	sta op2
	lda _z_game_number+1
	sta op2+1
	
	jsr uitoa

	ldx #0	
find_last_digit	
	inx
	lda _ItoaConvertBuffer-1,x
	bne find_last_digit
	
	ldy #39
write_from_right
	lda _ItoaConvertBuffer-1,x
	sta $bfe0-39,y
	dey
	dex
	bne write_from_right

	ldx #10
write_game_message
	lda _MessageGame-1,x
	sta $bfe0-39,y
	dey
	dex
	bne write_game_message
			
	rts
.)

_MessageGame
	.byt 32,32,32,1,"Game",3,"#"



_PrintText
.(
	jsr _ClearTextArea
	
	ldy #0
	ldx #0
	stx _z_position
loop
	lda (_z_data_ptr),y	
	bmi end
	iny
	cmp #13
	beq new_line
	
	sta $bb80+25*40,x
	inx
	bne loop
	
end	
	cmp #254
	beq skip_number
	jsr _PrintGameNumber
skip_number	
	rts
	
new_line
	clc
	lda _z_position
	adc #40
	sta _z_position
	tax
	jmp loop	
	
.)




_ShowCursor
.(
	ldx _z_position
	
	lda _SlotAddressLow,x
	sta _z_other_ptr+0
	lda _SlotAddressHigh,x
	sta _z_other_ptr+1
		
	lda _CardCountsInColumns,x
	beq found
	tax
	tay
	dey
	beq found
	
loop_search_card

	clc
	lda _z_other_ptr+0
	adc _CardsSpacingLow,x
	sta _z_other_ptr+0
	
	lda _z_other_ptr+1
	adc _CardsSpacingHigh,x
	sta _z_other_ptr+1
	
	dey	
	bne loop_search_card
	
found	
	
	jmp _DrawCursor
.)



_Message_SelectCard
	
	
	.byt 3,"Arrow keys",7,"to select the card"
_Message_Undo
	.byt 3,"U",7,"to Undo",13
	.byt 3,"Enter",7,"or",3,"Space",7,"to validate   "
_Message_Redo
	.byt 3,"R",7,"to Redo",13
	.byt 3,"Escape",7,"to quit the game"
	.byt 255

_Message_SelectDestination	
	.byt 3,"Arrow keys",7,"to select the destination",13
	.byt 3,"Enter",7,"or",3,"Space",7,"to validate",13
	.byt 3,"Escape",7,"to cancel"
	.byt 255

_Message_ConfirmQuit
	.byt 3,"Enter",7,"to confirm quitting",13
	.byt 3,"Escape",7,"to go back to game"
	.byt 255
		
_Message_PressEnter	
	.byt 12,16+4,2,"FreeCellOric - ",96," Defence-Force 2012",13
	.byt 3,"Numbers",7,"to type a game",3,"ESC",7,"to randomize",13
	.byt 3,"Enter",7,"to validate"
	.byt 255

_Message_Won
	.byt 16,16+4,2,"FreeCellOric - ",96," Defence-Force 2012",13
	.byt 14,16+2,5,"   Congratulations, you've won!",13
	.byt 14,16+2,5,"   Congratulations, you've won!",13
	.byt 254

_Message_Lost
	.byt 13
	.byt 3,"You've lost."
	.byt 255
		
	
	
	













_DrawFoundation
.(
	lda #<$a000+21+40*10    
	sta _z_other_ptr+0
	lda #>$a000+21+40*10    
	sta _z_other_ptr+1
	
	ldx #<_CardSlotsFoundations
	ldy #>_CardSlotsFoundations
	
	jmp _DrawSetOfCards
.)
	
_DrawFreeCells
.(
	lda #<$a000+3+40*10    
	sta _z_other_ptr+0
	lda #>$a000+3+40*10    
	sta _z_other_ptr+1
	
	ldx #<_CardSlotsCells
	ldy #>_CardSlotsCells
	
	
.)
_DrawSetOfCards
.(
	stx _auto_card_sources+1
	sty _auto_card_sources+2	

	ldx #0
loop
	stx _z_counter
_auto_card_sources	
	lda _CardSlotsFoundations,x
	
	tax 
	lda _CardsAddrLow,x
	sta _z_card_ptr+0
	lda _CardsAddrHigh,x
	sta _z_card_ptr+1
		
	jsr _DrawCardToHires
	
no_draw
	clc
	lda _z_other_ptr+0
	adc #4
	sta _z_other_ptr+0
	bcc skip	
	inc _z_other_ptr+1
skip
	
	ldx _z_counter
	inx
	cpx #4
	bne loop
	
	rts
.)




	





















_ClearEndSlots
.(
	
	
	
	lda #64+1+4
	ldx #16
loop_clear

	txa
	and #1
	beq skip
	lda #64+1+2+4+8+16+32
	bne loop_x
skip	
	lda #64+128
loop_x

	ldy #0
	sta (tmp1),y
	iny
	sta (tmp1),y
	iny
	sta (tmp1),y
	iny
	sta (tmp1),y

	clc
	lda tmp1+0
	adc #<40
	sta tmp1+0
	lda tmp1+1
	adc #>40
	sta tmp1+1

	dex
	bne loop_clear	
	rts
.)    
    
_ShowGame
.(
	
	
	
	lda #0
	tax
	ldy _z_undo_index
	beq no_undo
	lda #3
	ldx #7
no_undo	
	sta _Message_Undo+0
	stx _Message_Undo+2
	

	lda #0
	tax
	ldy _z_redo_index
	cpy _z_undo_index
	beq no_redo
	lda #3
	ldx #7
no_redo	
	sta _Message_Redo+0
	stx _Message_Redo+2
		
	

	
	
	
	
	
	
	
	
	ldx #0
	stx _z_counter2
loop_col
	stx _z_col
	
	
	txa
	asl		
	asl		
	clc
	adc #<$a000+4+40*60
	sta _z_other_ptr+0
	lda #0
	adc #>$a000+4+40*60
	sta _z_other_ptr+1

	ldx _z_counter2
	stx _z_counter
	txa
	clc
	adc #MAXPOS
	sta _z_counter2
			
	ldx #0
loop_pos	
	stx _z_pos
	
	
	ldy _z_counter
	inc _z_counter
	lda _CardSlots,y
	cmp #EMPTYCARD
	beq no_more_card
	
	
	tax 
	lda _CardsAddrLow,x
	sta _z_card_ptr+0
	lda _CardsAddrHigh,x
	sta _z_card_ptr+1
	
	jsr _DrawCardToHires
	
+no_draw
	
	.(
	ldx _z_col
	lda _CardCountsInColumns,x
	tax
	
	clc
	lda _z_other_ptr+0
	adc _CardsSpacingLow,x
	sta _z_other_ptr+0
	lda _z_other_ptr+1
	adc _CardsSpacingHigh,x
	sta _z_other_ptr+1
	.)
			
	ldx _z_pos
	inx
	jmp loop_pos
	
no_more_card
	cpx #0
	bne clear_end_card
	
	
	lda #<_CellGraphics
	sta _z_card_ptr+0
	lda #>_CellGraphics
	sta _z_card_ptr+1
	
	jsr _DrawCardToHires
	

clear_end_card
	jsr _ClearEndSlots	

		
	ldx _z_col
	inx
	cpx #MAXCOL
	bne loop_col
	
    jsr _DrawFreeCells
    jsr _DrawFoundation
    
	
	
	
	jsr _TestWinOrLost
	ldx #<_Message_Won
	ldy #>_Message_Won
	lda _z_result
	bne print_message

	ldx #<_Message_SelectCard
	ldy #>_Message_SelectCard
print_message	
	stx _z_data_ptr+0
	sty _z_data_ptr+1
	jsr _PrintText
    
	
	
	
	
	lda #16
	sta _z_offset
	lda _z_start_pos
	sta _z_position
	jsr _ShowCursor
	
	lda #16
	sta _z_offset
	lda _z_end_pos
	sta _z_position
	jsr _ShowCursor
	lda _z_start_pos
	sta _z_position
	jsr _FindCard
	
    rts
.)


	






























_PrintTitle
.(
	lda #<_Cards
	sta _z_card_ptr+0
	lda #>_Cards
	sta _z_card_ptr+1
	
	lda #<$a000+9+2+40*4	
	sta _z_other_ptr+0
	lda #>$a000+9+2+40*4
	sta _z_other_ptr+1
	
	lda #13
	sta _z_card
loop_card

	lda #4
	sta _z_suit
loop_suit
	
	jsr _DrawCardToHires
	
	.(
	clc
	lda _z_card_ptr+0
	adc #4*37
	sta _z_card_ptr+0
	bcc skip
	inc _z_card_ptr+1
skip	
	.)

	.(
	clc
	lda _z_other_ptr+0
	adc #<40*40-3
	sta _z_other_ptr+0
	lda _z_other_ptr+1
	adc #>40*40-3
	sta _z_other_ptr+1
	.)
		
	dec _z_suit
	bne loop_suit

	.(
	clc
	lda _z_other_ptr+0
	adc #<2+3*40-4*(40*40-3)
	sta _z_other_ptr+0
	lda _z_other_ptr+1
	adc #>2+3*40-4*(40*40-3)
	sta _z_other_ptr+1
	.)
		
	dec _z_card
	bne loop_card
		
	rts
.)


_RefreshOneCursor
.(
	
	lda _z_old_pos
	cmp _z_start_pos
	beq skip
	
	
	lda #16
	sta _z_offset
	lda _z_old_pos
	sta _z_position
	jsr _ShowCursor			
		
	lda _z_start_pos
	sta _z_old_pos
skip
					
	
	lda #0
	sta _z_offset	
	lda _z_start_pos
	sta _z_position
	jsr _ShowCursor			

	rts
.)



_RefreshTwoCursors
.(
	
	lda _z_old_pos
	cmp _z_end_pos
	beq skip
	
	
	lda #16
	sta _z_offset
	lda _z_old_pos
	sta _z_position
	jsr _ShowCursor			
		
	lda _z_end_pos
	sta _z_old_pos
skip
					
	
	lda #8
	sta _z_offset	
	lda _z_start_pos
	sta _z_position
	jsr _ShowCursor		

	
	lda #0
	sta _z_offset	
	lda _z_end_pos
	sta _z_position
	jsr _ShowCursor		
			
	rts
.)




	.zero

_z_x		.dsb 1
_z_y		.dsb 1
_z_fb		.dsb 1
_z_pattern	.dsb 1
_z_color	.dsb 1
_z_card		.dsb 1
_z_suit		.dsb 1
_z_top_card	.dsb 1
_z_size		.dsb 1

_z_card_ptr		.dsb 2
_z_other_ptr	.dsb 2
_z_data_ptr		.dsb 2

_z_xx		.dsb 1
_z_yy		.dsb 1

_z_offset	.dsb 1
_z_position	.dsb 1
_z_counter	.dsb 1
_z_counter2	.dsb 1

_z_col		.dsb 1
_z_pos		.dsb 1


	.text
	

_DrawSymbol
.(
	lda _z_other_ptr+0
	sta auto_graphics+1
	lda _z_other_ptr+1
	sta auto_graphics+2
	
	lda #0
	sta auto_offset+1
		
	lda _z_fb
	beq erase
draw	
	lda #0
	sta auto_eor+1
	lda #$11		
	sta auto_and
	
	jmp continue	
	
erase	
	lda #%11111111
	sta auto_eor+1
	lda #$31		
	sta auto_and
	
continue

	lda _z_y
	cmp #19
	bcs draw_bottom
	
draw_top	
	
	lda #$CA	
	sta auto_x
	lda #$E6	
	sta auto_y
	
	clc
	lda _z_x
	adc _z_size
	sec
	sbc #1
	sta auto_x_start+1
		
start_draw	
	lda _z_size
	sta _z_yy
loop_y

	clc
	lda _z_y
	asl
	asl
	
	adc _z_card_ptr+0
	sta tmp0+0
	lda #0
	adc _z_card_ptr+1
	sta tmp0+1

auto_x_start
	ldx #$12

	lda #0
	sta _z_xx
loop_x
	and #7
	bne skip

	
auto_offset		
	ldy #0
auto_graphics	
	lda $1234,y
	sta _z_pattern
	inc auto_offset+1	
skip

	lsr _z_pattern
	bcc no_pixel

	
	ldy _TableDiv6,x
	lda _TableBit6Reverse,x		
auto_eor	
	eor #%11111111
auto_and	
	and (tmp0),y				
	sta (tmp0),y				
no_pixel	

auto_x
	dex
	
	inc _z_xx
	lda _z_xx
	cmp _z_size
	bne loop_x
	
auto_y	
	inc _z_y
	dec _z_yy
	bne loop_y
		
	
quit	
	rts
	
draw_bottom
	
	lda #$E8	
	sta auto_x
	lda #$C6	
	sta auto_y
	
	sec
	lda _z_x
	sbc _z_size
	clc
	adc #1
	sta auto_x_start+1

	jmp start_draw	
.)

  






_DrawCardToHires
.(
	lda _z_card_ptr+0
	sta tmp0+0
	lda _z_card_ptr+1
	sta tmp0+1

	lda _z_other_ptr+0
	sta tmp1+0
	lda _z_other_ptr+1
	sta tmp1+1
	
	ldx #37
loop	
	ldy #0	
	lda (tmp0),y
	sta (tmp1),y
	iny 
	lda (tmp0),y
	sta (tmp1),y
	iny 
	lda (tmp0),y
	sta (tmp1),y
	iny 
	lda (tmp0),y
	sta (tmp1),y

	clc
	lda tmp0+0
	adc #4
	sta tmp0+0
	lda tmp0+1
	adc #0
	sta tmp0+1
		
	clc
	lda tmp1+0
	adc #40
	sta tmp1+0
	lda tmp1+1
	adc #0
	sta tmp1+1

	dex
	bne loop
		
	rts
.)





_GenerateFrame
.(
	stx tmp1
	sty _z_fb
	
	lda #64+32
	eor tmp1
	sta auto_left+1	
	
	lda #64
	eor tmp1
	sta auto_center+1	

	lda #64+1
	eor tmp1
	sta auto_right+1	
		
	
	
	lda _z_card_ptr+0
	sta tmp0+0
	lda _z_card_ptr+1
	sta tmp0+1
	
	
	lda #64+1+2+4+8+16+32
	eor tmp1
	ldy #0
	sta (tmp0),y	
	iny
	sta (tmp0),y	
	iny
	sta (tmp0),y	
	iny
	sta (tmp0),y	

	clc
	lda tmp0+0
	adc #4
	sta tmp0+0
	lda tmp0+1
	adc #0
	sta tmp0+1
		
	
	ldx #35
loop
	ldy #0
auto_left	
	lda #64
	sta (tmp0),y	
	iny
auto_center
	lda #64
	sta (tmp0),y	
	iny
	sta (tmp0),y	
	iny
auto_right
	lda #64
	sta (tmp0),y	
	
	clc
	lda tmp0+0
	adc #4
	sta tmp0+0
	lda tmp0+1
	adc #0
	sta tmp0+1
	
	dex
	bne loop

	
	lda #64+1+2+4+8+16+32
	eor tmp1
	ldy #0
	sta (tmp0),y	
	iny
	sta (tmp0),y	
	iny
	sta (tmp0),y	
	iny
	sta (tmp0),y	

	rts
.)	


_GenerateCellCard
.(
	
	ldx #128	
	ldy #1

	ldx #128	
	ldy #0
	
	
	ldx #1+2+4+8+16+32
	ldy #0
		
	jmp _GenerateFrame
.)	

	




_GenerateCard
.(
	
	ldx #128
	ldy #1
	
	lda _z_color
	and #2
	beq red_cards

	ldx #1+2+4+8+16+32
	ldy #0
		
red_cards	
	jsr _GenerateFrame
	
	
	
	
	
draw_small_numbers	
	lda _z_card
	asl				
	asl				
	clc
	adc _z_card		
	
	clc
	adc #<_SmallNumbers
	sta _z_other_ptr+0
	lda #0
	adc #>_SmallNumbers
	sta _z_other_ptr+1
		
	
	lda #5
	sta _z_size

	
	
	
	lda #2
	sta _z_x
	sta _z_y
	jsr _DrawSymbol

	
	
	
	lda #23-2
	sta _z_x
	lda #36-2
	sta _z_y
	jsr _DrawSymbol
			
		
	
	
	
draw_small_symbols
	lda _z_card
	beq ace
	cmp #10
	bcc not_head
	
ace
	lda _z_color
	asl				
	asl				
	clc
	adc _z_color	
	
	clc
	adc #<_Symbols_5x5
	sta _z_other_ptr+0
	lda #0
	adc #>_Symbols_5x5
	sta _z_other_ptr+1

	lda #2
	sta _z_x
	lda #8
	sta _z_y
	jsr _DrawSymbol
		
	lda #23-2
	sta _z_x
	lda #36-8
	sta _z_y
	jsr _DrawSymbol
	
not_head

	
	
	
	ldx _z_card
	lda _CardDataLow,x
	sta _z_data_ptr+0
	lda _CardDataHigh,x
	sta _z_data_ptr+1
	
	
	
	ldy #0
	
	lda (_z_data_ptr),y
	sta _z_other_ptr+0
	iny
	lda (_z_data_ptr),y
	sta _z_other_ptr+1
	iny

	
	lda (_z_data_ptr),y
	sta _z_size
	iny
		
	
	
	
	
	
	
	ldx _z_card
	cpx #10
	bcs no_color_offset

	ldx _z_color
	beq no_color_offset
	
	lda #0
loop_add
	clc
	adc _z_size
	dex
	bne loop_add
	
	clc
	adc _z_other_ptr+0
	sta _z_other_ptr+0
	lda #0
	adc _z_other_ptr+1
	sta _z_other_ptr+1
	
	
no_color_offset	
	
			
	
	
	
	
	
	
	
	
loop_draw_symbols
	lda (_z_data_ptr),y
	cmp #255
	beq end_loop
	sta _z_x
	iny 
	
	lda (_z_data_ptr),y
	sta _z_y
	iny
	
	tya
	pha
	
	jsr _DrawSymbol
	
	pla
	tay
	
	jmp loop_draw_symbols

end_loop
	
	rts
.)
  
	



_DrawCursor
.(
	lda _z_other_ptr+0
	sta wrt1+1
	sta wrt2+1
	lda _z_other_ptr+1
	sta wrt1+2
	sta wrt2+2
	
	lda #4
	sta _z_yy
	
	ldx _z_offset
	ldy #0	
loop	
	lda _CursorBase,x
wrt1
	sta $1234,y
	inx
	iny 
	
	lda _CursorBase,x
wrt2
	sta $1234,y
	inx
	
	clc
	tya
	adc #39
	tay

	dec _z_yy
	bne loop
	rts
.)







_SmallNumbers
 
 .byt %10000
 .byt %10000
 .byt %10000
 .byt %10000
 .byt %10000
 
 .byt %11100
 .byt %00100
 .byt %11100
 .byt %10000
 .byt %11100
 
 .byt %11100
 .byt %00100
 .byt %01100
 .byt %00100
 .byt %11100
 
 .byt %10100
 .byt %10100
 .byt %11100
 .byt %00100
 .byt %00100
 
 .byt %11100
 .byt %10000
 .byt %11100
 .byt %00100
 .byt %11100
 
 .byt %11100
 .byt %10000
 .byt %11100
 .byt %10100
 .byt %11100
 
 .byt %11100
 .byt %00100
 .byt %00100
 .byt %00100
 .byt %00100
 
 .byt %11100
 .byt %10100
 .byt %11100
 .byt %10100
 .byt %11100
 
 .byt %11100
 .byt %10100
 .byt %11100
 .byt %00100
 .byt %11100
 
 
 .byt %10111
 .byt %10101
 .byt %10101
 .byt %10101
 .byt %10111
 
 
 .byt %00100
 .byt %00100
 .byt %00100
 .byt %10100
 .byt %11100
 
 .byt %01100
 .byt %10010
 .byt %10010
 .byt %10100
 .byt %01010
 
 .byt %10010
 .byt %10100
 .byt %11000
 .byt %10100
 .byt %10010
  
 



_Symbols_3x3
 
 .byt %101
 .byt %111
 .byt %010
 
 
 .byt %010
 .byt %111
 .byt %010

 
 .byt %010
 .byt %111
 .byt %101
 
 
 .byt %010
 .byt %101
 .byt %010





_Symbols_5x5
 
 .byt %01010
 .byt %11111
 .byt %11111
 .byt %01110
 .byt %00100
 
 
 .byt %00100
 .byt %01110
 .byt %11111
 .byt %01110
 .byt %00100

 
 .byt %00100
 .byt %01110
 .byt %11111
 .byt %11111
 .byt %01110
 
 
 .byt %01110
 .byt %10101
 .byt %11111
 .byt %10101
 .byt %01110

 
_Symbols_7x7
 
 .byt %0110110
 .byt %1111111
 .byt %1111111
 .byt %1111111
 .byt %0111110
 .byt %0011100
 .byt %0001000
 
 
 .byt %0001000
 .byt %0011100
 .byt %0111110
 .byt %1111111
 .byt %0111110
 .byt %0011100
 .byt %0001000

 
 .byt %0001000
 .byt %0011100
 .byt %0111110
 .byt %1111111
 .byt %1111111
 .byt %1001001
 .byt %0011100
 
 
 .byt %0011100
 .byt %0011100
 .byt %1101011
 .byt %1111111
 .byt %1101011
 .byt %0001000
 .byt %0011100
 


_Heads
_Heads_Jack
 
 .word %0011111111100
 .word %0111111111110
 .word %1111111111111
 .word %1111111111111
 .word %1100011100011
 .word %1000001000001
 .word %1011100011101
 .word %1000000000001
 .word %1001101011001
 .word %1000101010001
 .word %1000001000001
 .word %1000000000001
 .word %0100011100010
 .word %0010000000100
 .word %0001000001000
 .word %0000111110000
 
_Heads_Queen
 
 .word %0100001000010
 .word %0110011100110
 .word %0111111111110
 .word %1111111111111
 .word %1110111110111
 .word %1100001000011
 .word %1001100011001
 .word %1010000000101
 .word %1001100011001
 .word %1000101010001
 .word %0100001000010
 .word %0100000000010
 .word %0010011100100
 .word %0001001001000
 .word %0000100010000
 .word %0000011100000

_Heads_King
 
 .word %1000100010001
 .word %1101110111011
 .word %1111111111111
 .word %1111111111111
 .word %1000000000001
 .word %1100000000011
 .word %1011100011101
 .word %1000010100001
 .word %1001100011001
 .word %1000101010001
 .word %1100001000011
 .word %1100000000011
 .word %0110011100110
 .word %0010100010100
 .word %0001111111000
 .word %0000111110000
 
 

_CardDataLow
 .byt <_CardData1
 .byt <_CardData2
 .byt <_CardData3
 .byt <_CardData4
 .byt <_CardData5
 .byt <_CardData6
 .byt <_CardData7
 .byt <_CardData8
 .byt <_CardData9
 .byt <_CardData10
 .byt <_CardDataJack
 .byt <_CardDataQueen
 .byt <_CardDataKing
_CardDataHigh   
 .byt >_CardData1
 .byt >_CardData2
 .byt >_CardData3
 .byt >_CardData4
 .byt >_CardData5
 .byt >_CardData6
 .byt >_CardData7
 .byt >_CardData8
 .byt >_CardData9
 .byt >_CardData10
 .byt >_CardDataJack
 .byt >_CardDataQueen
 .byt >_CardDataKing
 
_CardData1
	.word _Symbols_7x7
	.byt 7
	.byt 8,14
	.byt 255

_CardData2
	.word _Symbols_7x7
	.byt 7
	.byt 10,5
	.byt 23-10,31
	.byt 255

_CardData3
	.word _Symbols_7x7
	.byt 7
	.byt 10,5
	.byt 8,15
	.byt 23-11,31
	.byt 255

_CardData4
	.word _Symbols_7x7
	.byt 7
	.byt 7,5
	.byt 15,5
	
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData5
	.word _Symbols_7x7
	.byt 7
	.byt 7,5
	.byt 15,5
	
	.byt 8,15
	
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData6
	.word _Symbols_7x7
	.byt 7
	.byt 7,5
	.byt 15,5
	
	.byt 5,15
	.byt 13,15
			
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData7
	.word _Symbols_5x5
	.byt 5
	.byt 7,4
	.byt 15,4
	
	.byt 10,10
	
	.byt 5,16
	.byt 13,16
			
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData8
	.word _Symbols_5x5
	.byt 5
	.byt 7,4
	.byt 15,4
	
	.byt 10,10
	
	.byt 5,16
	.byt 13,16
	
	.byt 23-10,25
							
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData9
	.word _Symbols_5x5
	.byt 5
	.byt 7,4
	.byt 15,4
	
	.byt 6,10
	.byt 14,10
	
	.byt 10,16
	
	.byt 23-6,25
	.byt 23-14,25
						
	.byt 23-7,31
	.byt 23-15,31
	.byt 255

_CardData10
	.word _Symbols_5x5
	.byt 5
	.byt 8,3
	.byt 16,3
	
	.byt 11,8
	
	.byt 6,12
	.byt 14,12
	
	.byt 23-6,23
	.byt 23-14,23
	
	.byt 23-11,28
									
	.byt 23-8,33
	.byt 23-16,33
	.byt 255

_CardDataJack
	.word _Heads_Jack
	.byt 16
	.byt 6,2
	.byt 23-6,36-2
	.byt 255

_CardDataQueen
	.word _Heads_Queen
	.byt 16
	.byt 6,2
	.byt 23-6,36-2
	.byt 255

_CardDataKing
	.word _Heads_King
	.byt 16
	.byt 6,2
	.byt 23-6,36-2
	.byt 255

	
_CursorBase	
_CursorFilled
	.byt 64|128|%000001,%100000|64|128
	.byt 64|128|%000011,%110000|64|128
	.byt 64|128|%000111,%111000|64|128
	.byt 64|128|%001111,%111100|64|128
	
_CursorHollow
	.byt 64|128|%000001,%100000|64|128
	.byt 64|128|%000010,%010000|64|128
	.byt 64|128|%000100,%001000|64|128
	.byt 64|128|%001111,%111100|64|128

_CursorDelete
	.byt 64|128|%000000,%000000|64|128
	.byt 64|    %111111,%111111|64
	.byt 64|128|%000000,%000000|64|128
	.byt 64|    %111111,%111111|64
		
	



	.text
	


_CardsSpacingLow
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*12
	.byt <40*10
	.byt <40*10
	.byt <40*8
	.byt <40*8
	.byt <40*8
	.byt <40*6
	.byt <40*6
	.byt <40*6
	
_CardsSpacingHigh
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*12
	.byt >40*10
	.byt >40*10
	.byt >40*8
	.byt >40*8
	.byt >40*8
	.byt >40*6
	.byt >40*6
	.byt >40*6
		
	
_SlotAddressLow
	
	.byt <$a000+(97*40)+5+(4*0)
	.byt <$a000+(97*40)+5+(4*1)
	.byt <$a000+(97*40)+5+(4*2)
	.byt <$a000+(97*40)+5+(4*3)
	.byt <$a000+(97*40)+5+(4*4)
	.byt <$a000+(97*40)+5+(4*5)
	.byt <$a000+(97*40)+5+(4*6)
	.byt <$a000+(97*40)+5+(4*7)
	
	.byt <$a000+(47*40)+4+(4*0)
	.byt <$a000+(47*40)+4+(4*1)
	.byt <$a000+(47*40)+4+(4*2)
	.byt <$a000+(47*40)+4+(4*3)
	
	.byt <$a000+(47*40)+22+(4*0)
	.byt <$a000+(47*40)+22+(4*1)
	.byt <$a000+(47*40)+22+(4*2)
	.byt <$a000+(47*40)+22+(4*3)
	
	
_SlotAddressHigh
	
	.byt >$a000+(97*40)+5+(4*0)
	.byt >$a000+(97*40)+5+(4*1)
	.byt >$a000+(97*40)+5+(4*2)
	.byt >$a000+(97*40)+5+(4*3)
	.byt >$a000+(97*40)+5+(4*4)
	.byt >$a000+(97*40)+5+(4*5)
	.byt >$a000+(97*40)+5+(4*6)
	.byt >$a000+(97*40)+5+(4*7)
	
	.byt >$a000+(47*40)+4+(4*0)
	.byt >$a000+(47*40)+4+(4*1)
	.byt >$a000+(47*40)+4+(4*2)
	.byt >$a000+(47*40)+4+(4*3)
	
	.byt >$a000+(47*40)+22+(4*0)
	.byt >$a000+(47*40)+22+(4*1)
	.byt >$a000+(47*40)+22+(4*2)
	.byt >$a000+(47*40)+22+(4*3)
		
	
	

	.bss

	



	.dsb 256-(*&255)

_BssStart_

	.dsb 256-(*&255)









_TableDiv6				.dsb 256

	

_TableBit6Reverse		.dsb 256

	

_CardsAddrLow			.dsb 53
_CardsAddrHigh			.dsb 53
						
	.dsb 256-(*&255)
		
_Cards
	.dsb (13*4)*4*37	
_CellGraphics	
	.dsb 4*37			

_CardDeck
	.dsb 52				

_CardSlots
	.dsb MAXCOL*MAXPOS
_CardSlotsCells
	.dsb 4	
_CardSlotsFoundations
	.dsb 4	
	.dsb MAXPOS-4-4		

_CardCountsInSlots
_CardCountsInColumns
	.dsb 8
_CardCountsInCells
	.dsb 4	
_CardCountsInFoundations
	.dsb 4	
		
_UndoBufferFrom
	.dsb 256
_UndoBufferTo	
	.dsb 256

_ItoaConvertBuffer		.dsb 16
	
_BssEnd_

	.text
	
	




#file "D:\sources\oric\_games_\FreeCell\div.s"



div16i
	lda op1+1	
	eor op2+1
	pha		
	jsr unsign
	jsr div16u	
	pla		
	bmi resign
	lda op1+1
	rts




mod16i
	lda op1+1	
	pha		
	jsr unsign
	jsr mod16u	
	pla		
	bmi resignmod
	lda tmp+1
	rts

resignmod
	stx op1
	lda tmp+1
	sta op1+1
resign
	sec
	lda #0
	sbc op1
	tax
	lda #0
	sbc op1+1
	rts

unsign
	lda op1+1
	bpl unsign1
	sec
	lda #0
	sbc op1
	sta op1
	lda #0
	sbc op1+1
	sta op1+1
unsign1
	lda op2+1
	bpl unsign2
	sec
	lda #0
	sbc op2
	sta op2
	lda #0
	sbc op2+1
	sta op2+1
unsign2
	rts



div16u
	lda op2
	ora op2+1
	beq zerodiv

	lda #0
	sta tmp
	sta tmp+1
	
	ldx #16
	asl op1
	rol op1+1
udiv2
	rol tmp
	rol tmp+1
	sec
	lda tmp
	sbc op2
	tay
	lda tmp+1
	sbc op2+1
	bcc udiv3
	sty tmp
	sta tmp+1
udiv3
	rol op1
	rol op1+1
	dex
	bne udiv2
	ldx op1
	lda op1+1
	rts



mod16u
	jsr div16u
	ldx tmp
	lda tmp+1
	rts

zerodiv
	ldx #$85
	jmp $C47E




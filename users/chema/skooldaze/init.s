

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -----------------------------------
;;            Skool Daze
;;         The Oric Version
;; -----------------------------------
;;			(c) Chema 2011
;;         enguita@gmail.com
;; -----------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Init code
;; ---------------------


#include "params.h"
#include "text.h"
#include "script.h"

; Ticks to change the lesson (originally $1500=5376)
; Why is this particular define not included from params.h?
#define LESCLK_VAL		5376 



#define _hires		$ec33
#define _text		$ec21
#define _ping		$fa9f

.zero

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
;reg0	.dsb 2
;reg1	.dsb 2
;reg2	.dsb 2
;reg3	.dsb 2
;reg4	.dsb 2
;reg5	.dsb 2
;reg6	.dsb 2
;reg7	.dsb 2




.text

; Main procedure.

_main
.(
	jsr set_hires
	jsr _GenerateTables 
	jsr _init_irq_routine 
	jsr wait
	jsr wait
	jsr clr_hires

+restart_game
	; Set demo mode
	jsr set_demo_mode
	jsr _init
	jmp _test_loop
.)


set_hires
.(
	lda #30
	;lda $f934
	sta $bfdf
	
	lda #A_BGBLACK 
	sta $bf68
	sta $bf68+40
	sta $bf68+40*2
	rts
.)

clr_hires
.(
	ldy #<($a000)
	sty tmp
	ldy #>($a000)
	sty tmp+1
	ldx #176
loop2
	ldy #39
	lda #$40
loop
	sta (tmp),y
	dey
	;cpy #1
	;bne loop
	bpl loop
/*
	lda #A_FWBLACK 
	sta (tmp),y
	dey
	lda #A_BGCYAN
	sta (tmp),y
*/
	jsr add40tmp
	dex
	bne loop2
end
	rts	
.)


set_ink2
.(
	ldy #<($a000)
	sty tmp
	ldy #>($a000)
	sty tmp+1

	ldx #(176/2)
loop
	ldy #0
+smc_paper_1
	lda #A_BGCYAN
	sta (tmp),y
	iny
+smc_ink_1
	lda #A_FWBLACK 
	sta (tmp),y
	
	ldy #40
+smc_paper_2
	lda #A_BGYELLOW
	sta (tmp),y
	iny
+smc_ink_2
	lda #A_FWBLACK
	sta (tmp),y
	
	lda tmp
	clc
	adc #80
	sta tmp
	bcc nocarry
	inc tmp+1
nocarry

	dex
	bne loop
end
	rts	
.)


flash_border
.(
	stx savx+1
	sty savy+1
	jsr set_border
	jsr set_border
savx
	ldx #0
savy
	ldy #0
	rts
.)
set_border
.(
	; First 4 lines
.(
	ldx #40*4
loop
	lda $a000-1,x
	eor #$80
	sta $a000-1,x
	dex
	bne loop
.)
	; Middle 160 lines

.(
	lda #<($a000+(4*40))
	sta tmp0
	lda #>($a000+(4*40))
	sta tmp0+1


	ldx #168
loopa
	ldy #0
	lda (tmp0),y
	eor #$80
	sta (tmp0),y
	iny
	lda (tmp0),y
	eor #$80
	sta (tmp0),y
	ldy #38
	lda (tmp0),y
	eor #$80
	sta (tmp0),y
	iny
	lda (tmp0),y
	eor #$80
	sta (tmp0),y


	lda tmp0
	clc
	adc #40
	sta tmp0
	bcc nocarry
	inc tmp0+1
nocarry

	dex
	bne loopa
.)


	; Last 4 lines
.(
	ldx #40*4
loop
	lda $a000+(4+168)*40-1,x
	eor #$80
	sta $a000+(4+168)*40-1,x
	dex
	bne loop
.)
	rts
.)

;; Resets the game flags
reset_flags
.(
	; Reset all the game flags
	; after lesson change
	ldy #5
	lda #0
loopf
	sta lesson_status,y
	dey
	bpl loopf
	rts

.)

_init
.(
	; Reset game flags
	;jsr reset_flags

	; Initialize other game flags
	lda #$fe
	sta first_col

	lda #0
	sta vis_col
	sta vis_row 
	sta tile_col
	;sta first_col
	sta current_lesson_index
	sta Eric_flags
	sta Eric_knockout
	sta lines_delay
	sta score
	sta score+1
	sta lines
	sta lines+1

.(
	ldx #20
loop
	; Set initial positions
	lda ini_pos_col,x
	sta pos_col,x
	lda #17
	sta pos_row,x

	; And animatory state, direction and flags

	lda #0
	jsr update_animstate

	lda ini_flags,x
	eor flags,x
	and #IS_FACING_RIGHT
	beq noright
	jsr change_direction
noright

	lda ini_flags,x
	sta flags,x

	; Now the commands
	lda #0
	sta uni_subcom_high,x
	sta cont_subcom_high,x
	sta i_subcom_high,x
	sta command_list_high,x
	sta cur_command_high,x

	dex
	bpl loop
.)
	; Initialize game variables
	lda #0
	sta last_char_moved

	; Generate new safe combination and Creak's birth year
.(
  	ldx #3
loop
	jsr randgen
	and #15	; 0<=A<=15
	clc
	adc #65
	sta tab_safecodes,x
	dex
	bpl loop
.)

	; Now for the year...
generatey
	jsr randgen
	cmp #21
	bcs generatey

	;Store the identifier
	sta birthyear_id

	; Get the digits
	sta tmp
	asl
	asl
	adc tmp

	tax
.(
	ldy #0
loop
	lda st_years,x
	sta creak_year,y
	inx
	iny
	cpy #4
	bne loop
.)
	; Reset Eric's main action timer
	lda #INITIAL_ERIC_TIMER
	sta Eric_timer
	lda #0
	sta Eric_mid_timer

	; Clear blackboards
.(
	ldx #2
loopbb
	lda tab_bboards_high,x
	sta tmp+1
	lda tab_bboards_low,x
	sta tmp

	ldy #0
	lda (tmp),y
	sta loop+1
	iny
	lda (tmp),y
	sta loop+2
	iny
	lda #1
	sta (tmp),y
	iny
	lda #0
	sta (tmp),y
	ldy #4
	lda #$ff
	sta (tmp),y
	
	ldy #11
	lda #0
	sta (tmp),y

	dec loop+1

	ldy #11*2*8
	lda #$7f
loop
	sta board_white,y
	dey 
	bne loop
		
	dex
	bpl loopbb
.)
	; Initialize SRB

	ldx #(21*5-1)
loopsrb
	;lda #$fc
	lda #0
	sta SRB,x
	dex
	;lda #$ff
	lda #0
	ldy #2
loopsrb2
	sta SRB,x
	dex
	dey
	bpl loopsrb2
	;lda #$3f
	lda #0
	sta SRB,x
	dex
	bpl loopsrb

	; First screen render
	/*
	lda #A_BGBLACK
	sta smc_paper_1+1
	sta smc_paper_2+1
	*/
	jsr clr_hires
	jsr set_ink2 

	/*
	lda #A_BGCYAN
	sta smc_paper_1+1
	lda #A_BGYELLOW
	sta smc_paper_2+1
	jsr set_ink2
	*/

	; Clear scorepanel
	jsr clear_scorepanel

	lda #$da
	sta first_col

	; Scroll the screen
	lda #42
	sta tmp4
loops
	jsr scroll1_left
	dec tmp4
	bne loops

	; Initialize the lesson
	lda #$ff
	sta current_lesson_index

	lda #<(LESCLK_VAL)
	sta lesson_clock
	lda #>(LESCLK_VAL)
	sta lesson_clock+1

	jmp change_lesson
 .)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set and unset demo mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_demo_mode
.(
	lda #0
	sta game_mode

	lda #$ff
	sta demo_ff_00+1
	sta demo_ff_002+1

	lda #$10	; $d0 for normal mode
	sta demo_bpl_bne

	rts
.)


unset_demo_mode
.(
	lda #1
	sta game_mode

	lda #$00
	sta demo_ff_00+1
	sta demo_ff_002+1

	lda #$d0	; $10 for demo mode
	sta demo_bpl_bne

	rts
.)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Test for the main loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


_test_loop
.(
	; Time the frame...
	lda #0
	sta counter


	; Scroll if necessary...
	lda pos_col
	sec
	sbc first_col
	cmp #10;-4
	bne noscrollr
	jsr _scroll_right
	jmp noscroll
noscrollr
	cmp #28;+4
	bne noscroll
	jsr _scroll_left
noscroll

	; Deal with the lesson timer
	; Decrement it by one
	lda lesson_clock
	sec
	sbc #1
	sta lesson_clock
	bcs nocarry
	dec lesson_clock+1
nocarry
	; Is it time to change the lesson?
	ora lesson_clock+1
	bne notzero
	; It is, doit
	jsr change_lesson	
notzero

	; Now move the characters
	jsr move_chars

	; If in demo mode we are finished
	lda game_mode
	bne play_mode

	jsr ReadKey
	beq avoidEric
	
	; A key was pressed, exit demo mode.
	jsr unset_demo_mode
	jsr change_names
	jsr _init
	jmp _test_loop

play_mode

	; Now move Eric, if it needs be
	jsr deal_with_Eric
	bcs avoidEric

	; See if it is time to move Eric
	dec Eric_timer
	bne avoidEric

	; Reload Eric's main action timer
	lda #NORMAL_ERIC_TIMER
	sta Eric_timer


	; Is Eric writting on a blackboard?
	lda anim_state
	cmp #9
	bne nowritting
	; Move his hand
	lda #10
	jsr setEric_state
	jmp nomidstride

nowritting
	; Do we have to move Eric to the midstride position?
	; Is Eric not midstride?
	;lda anim_state
	cmp #4
	bcs nomidstride
	lsr
	bcc nomidstride
	ldx #0
	jsr step_character

midtimer	
	; Here the original version does something strange..
	lda Eric_mid_timer
	sta Eric_timer
	lda #0
	sta Eric_mid_timer

	; Don't check the keyboard this time
	jmp avoidEric	
nomidstride

	; Time to check the keyboard input
	; If Eric is writting, simply write 
	; the character pressed.
	lda Eric_flags
	and #ERIC_WRITTING
	beq notwritting
	; He is...
	jsr Eric_writting
	jmp avoidEric
notwritting
	jsr process_user_input
avoidEric

	; Protect the speech bubble, if any
	lda bubble_on
	beq nobubble

	ldy srb_offset
	lda SRB,y
	and srb_bitmask
	sta SRB,y

	lda SRB+5,y
	and srb_bitmask
	sta SRB+5,y

	lda SRB+1,y
	and srb_bitmask2
	sta SRB+1,y

	lda SRB+6,y
	and srb_bitmask2
	sta SRB+6,y

	ldy srb_offset_lip
	lda SRB,y
	and srb_bitmask_lip
	sta SRB,y

nobubble
	; Render the screen
	jsr render_screen

	; Any defered punishment?
+need_to_punish_Eric
	lda #0
	beq nopunish
	dec need_to_punish_Eric+1
	
	; Re-initialize the delay counter
	ldy #150/2
	sty lines_delay
	; Get the reason code back
+smc_sav_msg
	lda #0
	jsr punish_Eric
nopunish

	; Time before next move...
loop
	lda counter
	beq loop
	jmp _test_loop
.)

#define NUM_KEYS 9
; Keymap table
user_keys 
	.byt	 1, 2, 3, 4
	.byt	"S", "H", "F", "W", "J"
key_routh
    .byt >(up_Eric), >(left_Eric), >(down_Eric), >(right_Eric)
	.byt >(sit_Eric), >(hit_Eric), >(fire_Eric), >(write_Eric)
	.byt >(jump_Eric)
key_routl
	.byt <(up_Eric), <(left_Eric), <(down_Eric), <(right_Eric)
    .byt <(sit_Eric), <(hit_Eric), <(fire_Eric), <(write_Eric)
	.byt <(jump_Eric)

process_user_input
.(
	jsr ReadKeyNoBounce
	beq end       	
		
	; Ok a key was pressed, let's check
    ldx #NUM_KEYS-1
loop    
    cmp user_keys,x
    beq found
    dex
    bpl loop
end
	rts

found

    lda key_routl,x
    sta _smc_routine+1
    lda key_routh,x
    sta _smc_routine+2   

	; Some keys shall be read with repetitions
	cpx #4
	bcs call
	ldx #0
	stx oldKey

call
	ldx #0
_smc_routine
	; Call the routine
    jmp $1234   ; SMC     

.)

tab_patchcomm
	.byt SC_TELLANGELFACE, SC_TELLEINSTEIN, SC_TELLBOYWANDER

;; Change the current lesson
change_lesson
.(
	; Reset the lesson clock
	lda #>LESCLK_VAL
	sta lesson_clock+1
	lda #<LESCLK_VAL
	sta lesson_clock

	; Increment current lesson
	inc current_lesson_index

	; Get lesson code from table
	ldx current_lesson_index
	lda main_timetable,x

	; Is it playtime?
	cmp #243
	bcc cont
	; Are we in demo mode?
	ldx game_mode
	beq cont
	; Select a 'special' playtime occasionally
	tax

	jsr randgen
	and #7
	clc
	adc #238
	cmp #243
	bcs cont2
	txa	; Get the old identifier
	bne cont	; jump always
cont2
	cmp #246
	bcs cont
	; This is a special playtime, patch the
	; command list so the delivered message is correct
	tay
	lda tab_patchcomm-243,y
	sta command_list210+1
	tya
cont
	sta current_lesson

	; Get the lesson descriptor
	sec
	sbc #224
	tax
	lda lesson_descriptors,x
	sta lesson_descriptor

	cmp #254	; Second playtime in a row
	bcs nobell
	; Ring the bell
	;jsr _ping
nobell

	; Clear all game flags & other matters
	jsr reset_flags

	; Now update all characters
	ldx #MAX_CHARACTERS-3
loop
	; Trigger the command list reset
	lda flags,x
	ora #RESET_COMMAND_LIST
	sta flags,x

	; Put the name of teacher and place it in the lesson box

	; Pick up the command list number for this lesson 
	; from the character's personal timetable. As they lie in the
	; Last 32 bytes of each page, starting in skool_r00 and the indexes
	; are 224-255, no need for more than the following:

	ldy current_lesson
	txa
	clc
	adc #>skool_r00
	sta smc_ptimetable+2
smc_ptimetable
	lda $1200,y	; Get the personal timetable code for this lesson

	; Now get the pointer to the command list
	tay
	lda command_list_table-128,y
	sta command_list_low,x
	lda command_list_table-127,y
	sta command_list_high,x

	dex
+demo_bpl_bne
	bne loop	; Avoid dealing with Eric
	

	; Print the teacher's name and the room

	jsr uncolor_box

	lda game_mode
	bne notdemo

	; We are in demo mode... print that.
	lda #<demo_msg2
	sta tmp0
	lda #>demo_msg2
	sta tmp0+1

	jsr write_text_down

	lda #<demo_msg
	sta tmp0
	lda #>demo_msg
	sta tmp0+1

	jmp printit2 

notdemo
	; Get the room's name
	lda #<class_names
	sta tmp0
	lda #>class_names
	sta tmp0+1
	lda lesson_descriptor
	and #%1111
	sec
	sbc #1
	jsr search_string

	jsr write_text_down

	; Now the teacher's name
	lda lesson_descriptor
	lsr
	lsr
	lsr
	lsr
	cmp #%0100
	bne notnone
	; Is it the library?
	lda lesson_descriptor
	and #%1111
	cmp #DES_LIBRARY
	bne isplaytime
	; Point to REVISION
	lda #EN_REVISION
	bne printit	; This always jumps
	
isplaytime
	lda #<empty_st
	sta tmp0
	lda #>empty_st
	sta tmp0+1
	bne printit2	; This always jumps

notnone	
	and #%11
	clc
	adc #5
printit
	ldx #<names_extras
	stx tmp0
	ldx #>names_extras
	stx tmp0+1
	jsr search_string

printit2
	jsr write_text_up

	; Now dump the buffer into the screen

	lda #<22*8*40+15+$a000
	sta tmp1
	lda #>22*8*40+15+$a000
	sta tmp1+1

	jmp dump_text_buffer
.)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Routines to change the character names
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
change_names
.(
	jsr clr_hires
	jsr uncolor_box

	lda #A_BGCYAN
	sta smc_paper_2+1
	jsr set_ink2 

	lda #<$a000+40*4+3
	sta tmp0
	lda #>$a000+40*4+3
	sta tmp0+1
	lda #<st_putnames
	ldy #>st_putnames
	jsr print_string
looprk
	jsr ReadKey
	cmp #"Y"
	beq start_catwalk
	cmp #"N"
	beq end
	bne looprk
end
	lda #A_BGYELLOW
	sta smc_paper_2+1
	rts
.)

start_catwalk
.(
	jsr clr_hires
	jsr set_ink2 
	lda #A_BGYELLOW
	sta smc_paper_2+1

	; Print "CAST OF CHARACTERS"
	lda #<$a000+40*4+13
	sta tmp0
	lda #>$a000+40*4+13
	sta tmp0+1
	lda #<st_castof
	ldy #>st_castof
	jsr print_string


	; Patch the instruction at draw_skool_tile, so no
	; background is drawn
	; It was lda #>skool_r00,clc
	; and we want jmp blank_tile
	lda #$4C ;jmp
	sta draw_skool_tile
	lda #<blank_tile
	sta draw_skool_tile+1
	lda #>blank_tile
	sta draw_skool_tile+2

	; Draw the catwalk
	lda #%11000000
	ldy #35
.(
loop
	sta $a000+(40*76)+2,y
	dey
	bne loop
.)
	; Put all the characters offscreen
	ldx #MAX_CHARACTERS-1
	lda #150
.(
loop
	sta pos_col,x
	dex
	bpl loop
.)
	; Set the lefmost column of the skool to 5
	lda #5
	sta first_col

	; Iterate through the main characters
	lda #0
	sta tmp7
loopchars
	; Prepare the character position
	ldx tmp7
	lda #5
	sta pos_row,x
	lda #0
	sta pos_col,x

	; and animatory state
	jsr update_animstate

	; Is he looking right?
	lda flags,x
	and #IS_FACING_RIGHT
	bne isok
	jsr change_direction
isok
	; Start the catwalk
	jsr walk_char_in
	jsr print_title
	jsr print_name

	; Ask the user to change the name
	jsr change_name
	jsr clear_name

	; Walk the character out
	ldx tmp7
	jsr walk_char_out

	; Proceed to the next character
	; Beware to jump over the little kids
	ldx tmp7
	inx
	cpx #4
	bne notyet
	ldx #15
notyet
	stx tmp7
	cpx #CHAR_WITHIT+1
	bne loopchars

	; Put back the original code at draw_skool_tile
	; to lda #>skool_r00,clc
	lda #$A9 ;lda immediate
	sta draw_skool_tile
	lda #>skool_r00
	sta draw_skool_tile+1
	lda #$18	; clc
	sta draw_skool_tile+2

	; We are done
	rts
.)

walk_char_out
walk_char_in
.(
	lda #(3+19)*2
	sta tmp7+1
	stx loop+1
loop
	ldx #0	; SMC
	jsr step_character
	jsr render_screen

	; Wait a bit, else they run too fast
	ldy #30
wlo
	ldx #$ff
wl	dex
	bne wl
	dey
	bne wlo

	dec tmp7+1
	bne loop
	rts
.)

table_teacher_order
	.byt 3,0,1,2

print_title
.(
	ldx tmp7
	cpx #CHAR_FIRST_TEACHER
	bcc noteacher
	lda table_teacher_order-CHAR_FIRST_TEACHER,x
	ldy #<st_casttitles2
	sty tmp0
	ldy #>st_casttitles2
	sty tmp0+1
	jsr search_string
	jmp bottomline
noteacher
	lda #<st_space
	sta tmp0
	lda #>st_space
	sta tmp0+1
bottomline
	jsr write_text_up
	ldy #<st_casttitles
	sty tmp0
	ldy #>st_casttitles
	sty tmp0+1
	lda tmp7
	cmp #CHAR_FIRST_TEACHER
	bcc noteacher2
	tax
	lda table_teacher_order-CHAR_FIRST_TEACHER,x
	clc
	adc #4
noteacher2
	jsr search_string
	jsr write_text_down

+dump_title
	lda #<$a000+40*20+14
	sta tmp1
	lda #>$a000+40*20+14
	sta tmp1+1
	jmp dump_text_buffer
.)


print_name
.(
	ldx tmp7
	cpx #CHAR_FIRST_TEACHER
	bcc noteacher
	lda table_teacher_order-CHAR_FIRST_TEACHER,x
	ldy #<st_teacher_names
	ldx #>st_teacher_names
	jmp bottomline
noteacher
	txa
	ldy #<st_char_names
	ldx #>st_char_names
bottomline
	sty tmp0
	stx tmp0+1
	jsr search_string
	; Save pointer with SMC in case we want to edit it
	lda tmp0
	sta pchar_name+1
	lda tmp0+1
	sta pchar_name+3

	jsr write_text_up

	lda #<st_space
	sta tmp0
	lda #>st_space
	sta tmp0+1
	jsr write_text_down

+dump_title2
	lda #<$a000+40*78+14
	sta tmp1
	lda #>$a000+40*78+14
	sta tmp1+1
	jmp dump_text_buffer
.)


clear_name
.(
	lda #<st_space
	sta tmp0
	lda #>st_space
	sta tmp0+1
	jsr write_text_up
	jsr write_text_down
	jsr dump_title
	jmp dump_title2
.)


#define ADDR_LINE $a000+40*110

change_name
.(
	; Print Print 'C' to change name
	lda #<ADDR_LINE+11
	sta tmp0
	lda #>ADDR_LINE+11
	sta tmp0+1
	lda #<st_pressc
	ldy #>st_pressc
	jsr print_string

	jsr read_key_block
	cmp #"C"
	bne end

	jsr clear_msg_line
	; Print ENTER NEW NAME
	lda #<ADDR_LINE+14
	sta tmp0
	lda #>ADDR_LINE+14
	sta tmp0+1
	lda #<st_entername 
	ldy #>st_entername 
	jsr print_string

	jsr read_new_name
end
	jmp clear_msg_line
.)

read_key_block
.(
loop
	jsr ReadKeyNoBounce
	beq loop
	rts
.)

read_new_name
.(
	jsr clear_name

+pchar_name
	ldy #$34
	ldx #$12
	sty tmp0
	stx tmp0+1

	; Empty name
	lda #0
	ldy #13
loop
	sta (tmp0),y
	dey
	bpl loop
	iny
	sty tmp6
loop_read
	jsr read_key_block
	ldy tmp6
	cmp #13	
	beq end
	cmp #$08	; delete?
	bne nodel
	cmp #32		; not an alphanumeric character?
	bcc end
	cpy #0
	beq loop_read
	dey
	sty tmp6
	lda #0
	sta (tmp0),y
	beq skip	
nodel
	sta (tmp0),y
	cpy #12
	beq skip
	inc tmp6
skip
	lda tmp0
	pha
	lda tmp0+1
	pha
	jsr write_text_up
	jsr dump_title2
	pla
	sta tmp0+1
	pla
	sta tmp0
	jmp loop_read
end
	rts
	
.)

clear_msg_line
.(
	lda #$40
	ldy #35
loop
	sta ADDR_LINE+2,y
	sta ADDR_LINE+2+40,y
	sta ADDR_LINE+2+40*2,y
	sta ADDR_LINE+2+40*3,y
	sta ADDR_LINE+2+40*4,y
	sta ADDR_LINE+2+40*5,y
	sta ADDR_LINE+2+40*6,y
	sta ADDR_LINE+2+40*7,y
	dey
	bpl loop
	rts
.)

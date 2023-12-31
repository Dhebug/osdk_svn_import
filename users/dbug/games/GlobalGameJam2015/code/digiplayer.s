
	.zero

#define VIA_1     $30f
#define VIA_2     $30c

//#define VIA_TIMER_DELAY 250          // 4Khz
#define VIA_TIMER_DELAY 125          // 8Khz
//#define VIA_TIMER_DELAY 100          // 8Khz

; 20 kb = 10 seconds
; 30 kb = 30 seconds

IRQ_SAVE_A                  .dsb 1
IRQ_SAVE_X                  .dsb 1
IRQ_SAVE_Y                  .dsb 1
                              
IRQ_SAVE_A2                 .dsb 1
IRQ_SAVE_X2                 .dsb 1
IRQ_SAVE_Y2                 .dsb 1

	
digiplayer_start_sample
digiplayer_start_sample_low		.dsb 1
digiplayer_start_sample_high	.dsb 1

digiplayer_nextsample		.dsb 1

	.text

#define START_SAMPLE $400

_DigiPlayer_InstallIrq
.(
	//jmp _InterruptInstall
	sei
	
	// Prepare replay
	jsr _MakeSound

	lda #<START_SAMPLE
	sta digiplayer_start_sample_low
	lda #>START_SAMPLE
	sta digiplayer_start_sample_high


	// Set the VIA parameters
	lda #<VIA_TIMER_DELAY
	sta $306
	lda #>VIA_TIMER_DELAY
	sta $307

	// Install interrupt
	lda #<_InterruptCode_Low
	sta $FFFE
	lda #>_InterruptCode_Low
	sta $FFFF
	cli	

	rts
.)


_MakeSound
	// Canal settings
	ldy #7
	ldx #%11111111
	jsr _PsgSetRegister

	// Volume
	ldy #10
	ldx #0
	jsr _PsgSetRegister

	// Volume
	ldy #9
	ldx #0
	jsr _PsgSetRegister

	// Volume
	ldy #8
	ldx #0
	jsr _PsgSetRegister
	rts


// y=control register
// x=data register
_PsgSetRegister
	sty	VIA_1

	lda	VIA_2
	ora	#$EE		; $EE	238	11101110
	sta	VIA_2
	lda #$CC		; $CC	204	11001100
	sta	VIA_2

	stx	VIA_1
	lda	#$EC		; $EC	236	11101100
	sta	VIA_2
	lda #$CC		; $CC	204	11001100
	sta	VIA_2
	rts




Counter .dsb 1


//
// Interrupt code that replay a sample using volume
//

	.dsb 256-(*&255)

_InterruptCode_Low
	;jmp _InterruptCode_Low
.(
	inc $FFFF	; Switch to the second interrupt handler 
	bit $304

	sta IRQ_SAVE_A	; 3
	sty IRQ_SAVE_Y	; 3

	//
	// Get sample low part
	//
	ldy #0
	lda (digiplayer_start_sample),y
	;beq end_of_sample
	inc digiplayer_start_sample
	bne skip
	inc digiplayer_start_sample+1
skip	
	sta digiplayer_nextsample
	and #$0F

	sta	VIA_1
	lda	#$EC		; $EC	236	11101100
	sta	VIA_2
	lda #$CC		; $CC	204	11001100
	sta	VIA_2
	
	ldy IRQ_SAVE_Y	; 3
	lda IRQ_SAVE_A	; 3

	rti
.)

	.dsb 256-(*&255)

_InterruptCode_High
.(
	dec $FFFF	; Switch to the first interrupt handler 
	bit $304	// VIA_T1CL ; Turn off interrupt early.  (More on that below
	
	sta IRQ_SAVE_A2
	;sty IRQ_SAVE_Y2

	;
	; Get sample high part 
	;	
	lda digiplayer_nextsample
	lsr
	lsr
	lsr
	lsr
	
	sta	VIA_1
	lda	#$EC		; $EC	236	11101100
	sta	VIA_2
	lda #$CC		; $CC	204	11001100
	sta	VIA_2

	lda IRQ_SAVE_A2
	;ldy IRQ_SAVE_Y2

	rti
.)






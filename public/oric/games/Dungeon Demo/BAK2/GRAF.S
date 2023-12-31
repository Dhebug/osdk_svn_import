;
;
; Fastgraf 6502 assembly library
; (c) 1996 Micka�l POINTIER  (Dbug from NeXT)
;
;


_DisplayBuffer
	RESERVE 3900



_ClearDisplayBuffer
	lda #64
	ldx #0
clear_display_loop
	sta _DisplayBuffer+256*0,x			 ; 0-255
	sta _DisplayBuffer+256*1,x			 ; 256-511
	sta _DisplayBuffer+256*2,x			 ; 512
	sta _DisplayBuffer+256*3,x			 ; 768
	sta _DisplayBuffer+256*4,x			 ; 1024
	sta _DisplayBuffer+256*5,x			 ; 1280
	sta _DisplayBuffer+256*6,x			 ; 1536
	sta _DisplayBuffer+256*7,x			 ; 1792
	sta _DisplayBuffer+256*8,x			 ; 2048
	sta _DisplayBuffer+256*9,x			 ; 2304
	sta _DisplayBuffer+256*10,x			 ; 2560
	sta _DisplayBuffer+256*11,x			 ; 2816
	sta _DisplayBuffer+256*12,x			 ; 3072
	sta _DisplayBuffer+256*13,x			 ; 3328
	sta _DisplayBuffer+256*14,x			 ; 3584-3839
	sta _DisplayBuffer+3644,x			 ; 3644-3899
	dex
	bne clear_display_loop
	rts



;
; void SetScreenSize(unsigned int largeur);
;
_SetScreenSize
	ldy #0
	lda (sp),y				; largeur �cran
	sta auto_dst+1			; DrawSprite
	sta text_dst+1			; AffText
	sta column_dst+1		; FillColumn
	sta box_dst+1			; FillBox
	rts




;
; void AffText(ptr_screen,ptr_chaine)
;
; Nb: L'adresse de base de la fonte en Hires est $9800 (std) ou $9c00 (alt)
;     Chaque jeu de caracteres fait 1Ko.
;     Le jeu alternate est effac� sur 256 octets (32 premiers caracteres) et
;     contient une table de saut sur chaque caractere de la fonte standard
;
_AffText
	ldy #0
	lda (sp),y
	sta text_screen_adr+1

	iny
	lda (sp),y
	sta text_screen_adr+2


	iny
	lda (sp),y
	sta text_string+1

	iny
	lda (sp),y
	sta text_string+2


	ldy #0
text_string
	lda $2211,y			;	a=[127-0]
	beq text_exit

	asl a				; a*2	a=[255-0]   (Nb: 'Carry' forcement nulle !)
	tax				; x=offset sur adresse de base
	lda $9c00,x
	sta text_loop_car+1
	lda $9c01,x
	sta text_loop_car+2

	ldx #0
text_loop_car
	lda $2211,x
	ora #64
text_screen_adr
	sta $a000

	clc				; Screen+=40
	lda text_screen_adr+1
text_dst
	adc #40
	sta text_screen_adr+1
	lda text_screen_adr+2
	adc #0
	sta text_screen_adr+2

	inx
	cpx #8
	bne text_loop_car

	sec				; Screen-=(40*8-1)
	lda text_screen_adr+1
	sbc #$3f
	sta text_screen_adr+1
	lda text_screen_adr+2
	sbc #$01
	sta text_screen_adr+2

	iny
	jmp text_string
text_exit
	rts




;
; void FillColumn(ptr_screen,height,value)
;
_FillColumn
	ldy #0
	lda (sp),y
	sta loop_y+1		    ; dest

	iny
	lda (sp),y
	sta loop_y+2		    ; dest

	iny
	lda (sp),y
	sta auto_hh+1		    ; hauteur
	iny

	iny
	lda (sp),y		    ; value
	tax

auto_hh
	ldy #5
loop_y
	stx $2211				; destination
	clc
	lda loop_y+1
column_dst
	adc #40
	sta loop_y+1
	bcc next_loop
	lda loop_y+2
	adc #0
	sta loop_y+2

next_loop
	dey
	bne loop_y
	rts





;
; void FillBox(ptr_screen-1,(largeur|hauteur),value)
;
_FillBox
	ldy #0
	lda (sp),y
	sta loop_x_fillbox+1		; dest

	iny
	lda (sp),y
	sta loop_x_fillbox+2		; dest

	iny
	lda (sp),y
	sta auto_l_fillbox+1		; largeur
	iny
	lda (sp),y
	sta auto_h_fillbox+1		; hauteur

	iny
	lda (sp),y			; value
	sta auto_v_fillbox+1

auto_h_fillbox
	ldy #22
loop_y_fillbox
auto_l_fillbox
	ldx #5
auto_v_fillbox
	lda #3
loop_x_fillbox
	sta $2211,x			; destination
	dex
	bne loop_x_fillbox

	clc
	lda loop_x_fillbox+1
box_dst
	adc #40
	sta loop_x_fillbox+1
	bcc next_loop_fill
	lda loop_x_fillbox+2
	adc #0
	sta loop_x_fillbox+2

next_loop_fill
	dey
	bne loop_y_fillbox
	rts





;
; void SetSpriteSize(unsigned int (offset_src|largeur),unsigned int hauteur);
;
_SetSpriteSize
	ldy #0
	lda (sp),y				; l
	sta auto_l+1
	sta auto_src+1

	iny
	lda (sp),y				; offset (si 0, on touche pas !)
	beq end_offset
	clc
	adc auto_src+1
	sta auto_src+1
end_offset

	iny
	lda (sp),y				; h
	sta auto_h+1
	rts




;
;	void DrawSprite(ptr_dst-1,ptr_src-1)
;
_DrawSprite
	ldy #0
	lda (sp),y
	sta draw_sprite_loop_x+4		; dest

	iny
	lda (sp),y
	sta draw_sprite_loop_x+5		; dest

	iny
	lda (sp),y
	sta draw_sprite_loop_x+1		; source

	iny
	lda (sp),y
	sta draw_sprite_loop_x+2		; source

auto_h
	ldy #22

draw_sprite_loop_y

auto_l
	ldx #5

draw_sprite_loop_x
	lda $2211,x				; source
	sta $5544,x				; destination
	dex
	bne draw_sprite_loop_x

	clc
	lda draw_sprite_loop_x+1
auto_src
	adc #5
	sta draw_sprite_loop_x+1
	bcc go_dest
	lda draw_sprite_loop_x+2
	adc #0
	sta draw_sprite_loop_x+2

go_dest
	clc
	lda draw_sprite_loop_x+4
auto_dst
	adc #40
	sta draw_sprite_loop_x+4
	bcc go_end
	lda draw_sprite_loop_x+5
	adc #0
	sta draw_sprite_loop_x+5
go_end
	dey
	bne draw_sprite_loop_y
	rts




;
; The first text line in hires is at adress $bf68
;
;	void AddMessage(char *message,char color)
;
_AddMessage
	;
	; Commence par faire scroller d'une ligne
	; vers le haut de l'�cran
	;
	ldx #0
scroll_loop
	lda $bf90,x		; line 1
	sta $bf68,x		; line 0
	inx
	cpx #80
	bne scroll_loop

	;
	; Effacement de la troisieme ligne
	; sauf le premier caractere qui est un Attribut
	;
	ldx #40
erase_loop
	sta $bfb8,x		; line 2
	dex
	bne erase_loop

	;
	; Inscription de l'attribut couleur
	; Puis affichage en colonne 2 du texte
	;
	ldy #0
	lda (sp),y
	sta print_loop+1

	iny
	lda (sp),y
	sta print_loop+2

	iny
	lda (sp),y
	sta $bfb8		; Met l'attribut couleur

	ldx #0
print_loop
	lda $2211,x				; source
	beq exit
	sta $bfb9,x				; destination
	inx
	bne print_loop
exit
	rts




;	void AddMessage(char *message,char color)
;	{
;	    printf("\n%s",message);
;	    LastTimeMessage=GetTime();
;	    /*
;	    memcpy(LINES+0 ,LINES+40,80);
;	    memset(LINES+80,' '     ,40);
;	    LINES[80]=color;
;	    memcpy(LINES+81,message,strlen(message));
;	    */
;	}



;	void DrawSprite(ptr_dst,ptr_src)
;	{
;	    int 	    x,y;
;	    unsigned char   *ptr_src;
;
;	    ptr_src=sprites+num*22*5;
;	    for (y=0;y<22;y++)
;	    {
;		memcpy(adresse,ptr_src,5);
;		adresse+=40;
;		ptr_src+=5;
;	    }
;	}


;why not use DMA for all of this? because the game is fucking allergic to it,
;thank the devs, enjoy dial-up speeds instead lol.


warp_menu:
	LDA !menu_dma_done
	BNE .dont_upload
	JSR upload_extra_char_tiles
.dont_upload:
	STZ !cursor_pos
	LDA !global_frame_counter
	STA !temp
	STZ !temp2

;upload warp text
	LDA #$78CD
	STA $2116
	LDY #$0000
	LDX #$0008
	PHB
	PHK
	PLB
.loop:
	LDA warp_text,y
	STA $2118
	INY
	INY
	DEX
	BNE .loop

;upload cursor
	LDA #$792B
	STA $2116
	STA !cursor_offset
	LDA #$25FF
	STA $2118

;upload stages text
	LDA #stage_text
	STA $48
	LDA #$00A0
	STA $4A
	LDA #$0007
	STA !temp3
	LDA #$792D
	STA !temp4
.next_line:
	LDA !temp4
	STA $2116
	LDY #$0000
	LDX #$0009
.loop2:
	LDA [$48],y
	STA $2118
	INY
	INY
	DEX
	BNE .loop2
	DEC !temp3
	BEQ .done
	LDA !temp4
	CLC
	ADC #$0040
	STA !temp4
	LDA $48
	ADC #$0012
	STA $48
	BRA .next_line

.done:
	INC !menu_dma_done
	PLB
	RTL


handle_cursor:
	LDA #$0000 			;hijacked instruction
	TCD 				;hijacked instruction
	PHB
	PHK
	PLB
	JSR display_mice_counter 	;chainloading it here cuz nmi	
	LDA !menu_dma_done
	BEQ .done
	LDA !cursor_moved_flag
	BNE .done
	LDA $1FF4
	AND #$00FF
	BIT #$0080
	BEQ .check_down 
	BRL .warp

.check_down:
	BIT #$0004
	BEQ .check_up
	LDA !global_frame_counter
	SEC
	SBC !temp
	CMP #$0001
	BCC .done
	LDA #$0001
	STA !cursor_moved_flag
	LDA !cursor_pos
	INC
	CMP #$0007
	BCS .done
	STA !cursor_pos
	LDA !cursor_offset
	TAX
	CLC
	ADC #$0040
	STA !cursor_offset
	JSR update_cursor_pos
.done
	LDA $1FF4
	AND #$00FF
	BNE ++
	STZ !cursor_moved_flag
++:
	REP #$20
	PLB
	RTL

.check_up:
	BIT #$0008
	BEQ .check_right
	LDA #$0001
	STA !cursor_moved_flag
	LDA !cursor_pos
	DEC
	BMI .done
	STA !cursor_pos
	LDA !cursor_offset
	TAX
	SEC
	SBC #$0040
	STA !cursor_offset
	JSR update_cursor_pos
	BRA .done


.check_right:
	LDA !global_frame_counter
	SEC
	SBC !temp
	CMP #$0001
	BCC .done
	LDA !cursor_moved_flag
	BNE .done
	LDA #$7935
	STA !vram_destination
	LDA $1FF4
	AND #$00FF
	BIT #$0001
	BEQ .check_left
	LDA !cursor_pos  		
	BEQ ..no_offset
	TAX				;use cursor pos as how many times to offset vram address
..loop_vram_addr:
	LDA !vram_destination
	CLC
	ADC #$0040
	STA !vram_destination
	DEX
	BNE ..loop_vram_addr
..no_offset:
	LDA !cursor_pos
	ASL
	TAX
	PHK
	PLB
	LDA act_cap,x
	STA !selected_act_cap
	LDA !selected_act
	INC
	CMP !selected_act_cap
	BCS ++
-:
	STA !selected_act
	ASL
	TAY
	LDA !vram_destination
	STA $2116
	LDA act_number_text,y
	STA $2118
	REP #$20
	INC !cursor_moved_flag
++:
	BRL .done
	

.check_left:
	BIT #$0002
	BNE ..pressed_left
	BRL .done

..pressed_left:
	LDA #act_number_text
	STA !data_address
	LDA !cursor_pos  		
	BEQ ..no_offset
	TAX				;use cursor pos as how many times to offset vram address
..loop_vram_addr:
	LDA !vram_destination
	CLC
	ADC #$0040
	STA !vram_destination
	DEX
	BNE ..loop_vram_addr
..no_offset:
	LDA !selected_act
	DEC
	BPL -
	BRL .done


.warp:
	PHK
	PLB
	LDA !cursor_pos
	STA !current_stage
	TAY
	BEQ ..no_offset
	LDA #$0000
	CLC
..loop:
	ADC #$000A
	DEY
	BNE ..loop
..no_offset:
	TAX
	LDA level_id_table,x  		;load first word (level id)
	STA $96 			;store the level id
	LDA !selected_act
	STA !current_act
	TAY
	BEQ ..first_act
	TXA 				;transfer our index back to A
	CLC
..loop_2:
	ADC #$0002
	DEY
	BPL ..loop_2
..store_act:
	TAX
	LDA level_id_table,x
	STA $98 			;store the act id
	LDA #$0001
	STA !level_transition_flag
	STZ !max_checkpoints
	STZ !current_checkpoint
	LDA #$0064
	STA !lives 			;refill lives
	JSL route_setup
	BRL .done

..first_act
	TXA
	CLC
	ADC #$0002
	BRA ..store_act

	
update_cursor_pos:
;clear previous cursor position vram
	TXA				;get previous cursor pos
	STA !vram_destination
	STA $2116
	LDA #$2180
	STA $2118

;reset act number to 1
	LDA !vram_destination
	CLC
	ADC #$000A
	STA $2116
	LDA #$25C4			;put a 1 back into act number
	STA $2118

;upload cursor to new position
	LDA !cursor_offset 		;get new cursor pos
	STA $2116
	LDA #$25FF
	STA $2118
	STZ !selected_act
	RTS


warp_text:
	dw $25FE, $2180, $25F5, $25F6, $25F7, $25F8, $2180, $25FE 


stage_text:
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C4, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C5, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C6, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C7, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C8, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25C9, $25FE, $25C4 
	dw $25F9, $25FA, $25FB, $25FC, $25FD, $2180, $25CA, $25FE, $25C4 

act_number_text:
	dw $25C4
	dw $25C5
	dw $25C6
	dw $25C7
	

act_cap:
	dw $0002 		;Sleepy Rock
	dw $0004 		;Surely Wood
	dw $0002  		;Fiesta City
	dw $0002		;Ancient Keep
	dw $0002		;Snowy Cabins
	dw $0003		;Galactical Galaxies
	dw $0004		;Ye Olde Bounty


;not all levels have only 2 acts so $FFFF is just to fill up the missing space
level_id_table:
	;  level   act1   act2   act3  act 4
	dw $0000, $0000, $001A, $FFFF, $FFFF		;Sleepy Rock
	dw $0004, $0008, $0018, $001C, $001E 		;Surely Wood
	dw $0006, $000C, $0010, $FFFF, $FFFF		;Fiesta City
	dw $0001, $0002, $0012, $FFFF, $FFFF 		;Ancient Keep
	dw $0002, $0004, $000A, $FFFF, $FFFF 		;Snowy Cabins
	dw $0003, $0006, $0024, $0022, $FFFF 		;Galactical Galaxies
	dw $0007, $000E, $0014, $0016, $0020 		;Ye Olde Bounty



upload_extra_char_tiles:
	PHB 
	PHK
	PLB
	LDA #$7FA8
	STA $2116
	LDX #$0058
	LDY #$0000
.loop:
	LDA extra_chars,y
	STA $2118
	INY
	INY
	DEX
	BNE .loop
.done:
	PLB
	RTS


clear_menu_text:
	STZ !menu_dma_done
	STZ !selected_act
;hijacked instructions (modified to change vram address and clear more bytes)
	LDA #$78CD
	STA $2116
	LDX #$01F0
	RTL

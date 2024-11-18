include 


upload_ego_text:
	LDA #ego_text1                  ;data address
	LDX #$0010                      ;x pos
	LDY #$0070                      ;y pos
	JSL display_oam_text
	LDA #ego_text2                  ;data address
	LDX #$0010                      ;x pos
	LDY #$0085                      ;y pos
	JSL display_oam_text
	SEP #$20                        ;hijacked instruction
	LDA #$AA                        ;hijacked instruction
	RTL


set_route:
;prob dont need to clear all these but just to be safe
	STZ !current_checkpoint
	STZ !max_checkpoints
	STZ !current_stage
	STZ !current_act
	STZ !selected_stage
	STZ !selected_act
	LDA $09FD
	CMP #$00A4
	BNE .100_percent
	STZ !selected_route
	BRA .done

.100_percent:
	LDA #$0001
	STA !selected_route
.done:
	STZ $09FD 			;hijacked instruction
	PLA
	PLB                             ;skip map and boot into level
	JML $81A624


skip_cage_cutscene:
	LDA #$01
	STA $BF
	REP #$20
	RTL


display_mice_counter:
	REP #$20
	LDA !selected_route
	BEQ .return
	LDY #$0000
	LDA #$7AE2
	STA !vram_destination
.loop:
	LDA !vram_destination
	STA $2116
	LDX #$0005
.loop2:
	LDA mice_text,y
	STA $2118
	INY
	INY
	DEX
	BNE .loop2
	LDA !vram_destination
	CMP #$7B02
	BEQ .done
	CLC
	ADC #$0020
	STA !vram_destination
	LDY #$000A
	BRA .loop

.done:
	JSR .print_number
.return:
	RTS


.print_number:
	LDA #numbers
	STA !temp5
	LDA #$00A0
	STA !temp5+$2
	LDY #$0000
	LDA #$7AE8
	STA !vram_destination
	LDA !vram_destination
	STA $2116
	LDX #$0002
	LDA !mice_count
	ASL
	ASL
	CLC
	ADC !temp5
	STA !temp5
	PHD
	LDA #$1F00
	TCD
..loop:
	LDA [$28],y
	STA $2118
	LDA !vram_destination
	CLC
	ADC #$0020
	STA $2116
	INY
	INY
	DEX
	BNE ..loop
	PLD
	RTS





mice_text:
	dw $25E4, $25E5, $25E6, $25E7, $25D3            ;top half
	dw $25F0, $25F1, $25F2, $25F3, $25D4            ;bottom half


numbers:
	;  top    bottom
	dw $25AF, $25B0                 ;0
	dw $25B1, $25B2                 ;1
	dw $25B3, $25B4                 ;2
	dw $25B5, $25B6                 ;3
	dw $25B7, $25B8                 ;4
	dw $25B9, $25BA                 ;5
	dw $25BB, $25BC                 ;6
	dw $25BD, $25BE                 ;7
	dw $25BF, $25C0                 ;8
	dw $25C1, $25C2                 ;9



;also stop deducting lives
set_st6_act5_mice_respawn:
	REP #$20
	PHD
	LDA #$0000
	TCD
	LDA !selected_route
	BNE .done
	LDA !current_stage
	CMP #$0005
	BNE .done
	LDA !player_x_pos
	CMP #$04CA
	BNE .done
	LDA #$03D0
	STA !respawn_x_pos
	LDA #$077F
	STA !respawn_y_pos
.done:
	PLD
	SEP #$20
	LDA #$01
	RTL
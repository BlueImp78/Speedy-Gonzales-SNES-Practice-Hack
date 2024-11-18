include

room_change:
	REP #$20
	LDA !player_held
	BIT #$0030
	BNE .done 				;return if L or R held, avoids conflicts with flashcard savestate button combos
        LDA !player_held
        BIT #$0040
        BNE .holding_X
	BRA .done

.start_transition:
	SEP #$20
	LDA #$64
	STA !lives 				;refill lives
	JSL $818289 				;respawn level objects
	JSL $81FD9D  
	REP #$20
	JSL route_setup
        INC !transition_flag
.done:
	SEP #$20
	INC $0934 				;hijacked instruction
	LDA $0934 				;hijacked instruction
        RTL


.holding_X:
	BIT #$2000
	BNE .start_transition
        BIT #$0040
        BEQ .done
        BIT #$0100
	BEQ .check_pressed_left
	JSR get_checkpoint_cap
	LDA !current_checkpoint
	INC
	CMP !max_checkpoints
	BCC ..no_overflow
	STZ !current_checkpoint
	BRA .start_transition
	
..no_overflow:
	STA !current_checkpoint
	BRA .start_transition


.check_pressed_left:
	BIT #$0200
	BEQ .done
	JSR get_checkpoint_cap
	LDA !current_checkpoint
	DEC
	BMI ..underflow
	STA !current_checkpoint
	BRA .start_transition

..underflow:
	LDA !max_checkpoints
	DEC
	STA !current_checkpoint
	BRA .start_transition


reset_current_act:
	REP #$30
	STZ !current_checkpoint
	JSL route_setup
	SEP #$30
	STZ $0980 				;hijacked instruction
	INC !level_transition_flag		;hijacked instruction
	RTL


route_setup:
        LDA !current_stage
        ASL
        TAX 
	LDA !selected_route
	BNE .hundo
        JMP (any_route_stage_table,x)

.hundo:
	JMP (hundo_route_stage_table,x)


get_checkpoint_cap:
	LDA #$0000
	LDY !current_act
	BEQ .no_offset
	CLC
.loop:
	ADC #$0002
	DEY 
	BNE .loop
.no_offset:
	LDY !current_stage
	BEQ .no_offset2
	CLC
.loop2:
	ADC #$0008
	DEY
	BNE .loop2
.no_offset2:
	TAX
	PHB
	PHK
	PLB
	LDA !selected_route
	BNE .hundo
	LDA any_route_checkpoint_cap_table,x
	BRA +

.hundo:
	LDA hundo_route_checkpoint_cap_table,x
+:
	STA !max_checkpoints
	PLB
	RTS


prevent_death_on_warp:
	LDA !level_transition_flag
	BNE .no_death
	LDA #$FF 				;hijacked instruction
	STA $0990 				;hijacked instruction
.no_death:
	RTL



incsrc "any%_route.asm"
incsrc "hundo_route.asm"
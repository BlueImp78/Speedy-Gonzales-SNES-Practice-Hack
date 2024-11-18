include


;skip long ass logos
org hijack_game_boot
 	WDM
	WDM
	WDM
	WDM
	WDM
	WDM
	WDM
	WDM


org hijack_game_start
	JSL set_route
	WDM

org hijack_lives_init
	LDA #$64

org hijack_options_menu
	WDM
	WDM
	WDM
	WDM

org hijack_timer_ms
	JSL room_change
	WDM


org hijack_lives_decrease
	NOP
	WDM


org hijack_lives_decrease2
	NOP
	WDM


; org hijack_nmi
; 	JSL upload_extra_char_tiles



org hijack_pause_text_upload
	JSL warp_menu
	SEP #$30
	RTS


org hijack_pause_exit
	JSL clear_menu_text
	WDM
	WDM
	NOP


org hijack_nmi2
	JSL handle_cursor


;set right amount of hearts on death
org hijack_hearts_reset
	JSL route_setup
	WDM
	WDM
	NOP

org hijack_act_transition	
	JSL reset_current_act
	WDM
	NOP


org hijack_water_death
	JSL prevent_death_on_warp
	NOP


org hijack_laser_death
	JSL set_st6_act5_mice_respawn
	NOP



;not doing 4 separate hijacks for this lmao
org hijack_pause_exit_check
	BIT #$9000
	SEP #$20
	BNE $EC
	JSR $C441
	LDX #$C8
	DEX
	BNE $FD
	REP #$20
	LDA $4218
	BIT #$9000
	SEP #$20
	BEQ $EC
	JSR $C441
	LDX #$C8
	DEX
	BNE $FD
	REP #$20
	LDA $4218
	BIT #$9000


;skip pre-stage cage cutscene but this game loads so slow it barely makes a difference LMAO
org hijack_cage_cutscene
	JSL skip_cage_cutscene


;an * is the closest thing to a % they have in the tiles lmao
org hijack_title_text_rom
	db "Any* ", $00
	db "100*  ", $00


org hijack_title_text_upload
	JSL upload_ego_text



org $819107
ego_text1:
        db "Prac Hack v1.0", $00

ego_text2:
        db "By BlueImp, 2024", $00
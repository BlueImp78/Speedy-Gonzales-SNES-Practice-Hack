include

freerom = $A08000  ;start of expanded rom

;hijacks
hijack_game_boot = $00804D
hijack_lives_decrease = $80921A
hijack_lives_decrease2 = $80A2E3
hijack_timer_ms = $80C220
hijack_game_start = $81A2F1
hijack_lives_init = $8080A7
hijack_options_menu = $819968
hijack_title_text_rom = $8190EC
hijack_title_text_upload = $819D77
;hijack_nmi = $80ECC6                   ;doesn't run when paused
hijack_nmi2 = $80C45B                  ;every frame
hijack_pause_text_upload = $809E5D
hijack_pause_exit = $809EBF
hijack_pause_exit_check = $8085CE
hijack_hearts_reset = $80CC0B
hijack_cage_cutscene = $87C479
hijack_act_transition = $8083E5
hijack_water_death = $80A2F1
hijack_laser_death = $809237




;routines
clear_mice_table = $8180E5
display_oam_text = $819005



;vanilla ram
!player_x_pos = $2A
!player_y_pos = $2C
!global_frame_counter = $87
!screen_brightness = $93
!pause_flag = $F2

!player_held = $0306

!current_hearts = $08CC
!max_hearts = $08CE
!mice_count = $08E0
!respawn_x_pos = $08E2
!respawn_y_pos = $08E4

!timer = $0931                  	;4 bytes
!lives = $0935
!transition_flag = $0998        	;unclear
!level_transition_flag = $099A 		;unclear

mice_table = $195F




;custom ram
!selected_route = $1F00
!current_stage = $1F02
!current_act = $1F04
!current_checkpoint = $1F06
!max_checkpoints = $1F08
!selected_stage = $1F0A
!selected_act = $1F0C
!selected_act_cap = $1F0E
!vram_destination = $1F10
!data_address = $1F12
!bytes_to_transfer = $1F14
!char_dma_done = $1F16
!menu_dma_done = $1F18
!cursor_pos = $1F1A
!cursor_offset = $1F1C
!cursor_moved_flag = $1F1E
!temp = $1F20
!temp2 = $1F22
!temp3 = $1F24
!temp4 = $1F26
!temp5 = $1F28

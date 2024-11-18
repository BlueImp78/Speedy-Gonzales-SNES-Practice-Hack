hundo_route_stage_table:
        dw hundo_route_stage1
        dw hundo_route_stage2
        dw hundo_route_stage3
        dw hundo_route_stage4
        dw hundo_route_stage5
        dw hundo_route_stage6
        dw hundo_route_stage7


hundo_route_stage1:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage1_acts,x)

.stage1_acts:
	dw .act1
	dw .act2

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4
	dw ..checkpoint5
	dw ..checkpoint6


..level_start:

	LDA #$0020
	STA !respawn_x_pos
	LDA #$02DF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	


..checkpoint1:
	LDA #$0870
	STA !respawn_x_pos
	LDA #$019F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	STZ !mice_count
	BRL setup_done


..checkpoint2:
	LDA #$0030
	STA !respawn_x_pos
	LDA #$039F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$0D41
	STA !respawn_x_pos
	LDA #$02AF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	STA !mice_count
	BRL setup_done

..checkpoint4:
	LDA #$1681
	STA !respawn_x_pos
	LDA #$02EF
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	BRL setup_done

..checkpoint5:
	LDA #$140C
	STA !respawn_x_pos
	LDA #$008F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0005
	STA !mice_count
	BRL setup_done

..checkpoint6:
	LDA #$1B53
	STA !respawn_x_pos
	LDA #$01CF
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0006
	STA !mice_count
	BRL setup_done


.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4
	dw ..checkpoint5
	dw ..checkpoint6


..level_start:
	LDA #$0005
	STA !respawn_x_pos
	LDA #$029F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint1:
	LDA #$02A3
	STA !respawn_x_pos
	LDA #$036F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRL setup_done	

..checkpoint2:
	LDA #$0D90
	STA !respawn_x_pos
	LDA #$037F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done	

..checkpoint3:
	LDA #$0754
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	STA !mice_count
	BRL setup_done	

..checkpoint4:
	LDA #$0D75
	STA !respawn_x_pos
	LDA #$020F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	BRL setup_done	

..checkpoint5:
	LDA #$12D0
	STA !respawn_x_pos
	LDA #$02FF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0006
	STA !mice_count
	BRL setup_done	

..checkpoint6:
	LDA #$1A50
	STA !respawn_x_pos
	LDA #$007F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0007
	STA !mice_count
	BRL setup_done	


hundo_route_stage2:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage2_acts,x)

.stage2_acts:
	dw .act1
	dw .act2
	dw .act3
	dw .boss_act

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$003A
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint1:
	LDA #$06BF
	STA !respawn_x_pos
	LDA #$012F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint2:
	LDA #$251B
	STA !respawn_x_pos
	LDA #$007F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done	

..checkpoint3:
	LDA #$35F0
	STA !respawn_x_pos
	LDA #$006F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	BRL setup_done	



.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$0023
	STA !respawn_x_pos
	LDA #$018F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint1:
	LDA #$1260
	STA !respawn_x_pos
	LDA #$004F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint2:
	LDA #$1DB0
	STA !respawn_x_pos
	LDA #$00AF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRL setup_done	

..checkpoint3:
	LDA #$2C60
	STA !respawn_x_pos
	LDA #$014F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	BRL setup_done	


.act3:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act3_checkpoints,x)

.act3_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2


..level_start:
	LDA #$0052
	STA !respawn_x_pos
	LDA #$032F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	BRL setup_done	

..checkpoint1:
	LDA #$0C50
	STA !respawn_x_pos
	LDA #$00E7
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRL setup_done	

..checkpoint2:
	LDA #$1E90
	STA !respawn_x_pos
	LDA #$02FF
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done

.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0008
	STA $0322 			;restore boss HP
	STZ !mice_count
	BRL setup_done


hundo_route_stage3:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage3_acts,x)

.stage3_acts:
	dw .act1
	dw .act2

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$00F6
	STA !respawn_x_pos
	LDA #$036F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint1:
	LDA #$03E0
	STA !respawn_x_pos
	LDA #$003F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint2:
	LDA #$1263
	STA !respawn_x_pos
	LDA #$003F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$1FD0
	STA !respawn_x_pos
	LDA #$035F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	BRL setup_done


.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$001D
	STA !respawn_x_pos
	LDA #$091F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint1:
	LDA #$04D5
	STA !respawn_x_pos
	LDA #$083F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint2:
	LDA #$0630
	STA !respawn_x_pos
	LDA #$036F
	STA !respawn_y_pos
	LDA #$0004
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$0BA0
	STA !respawn_x_pos
	LDA #$01DF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STA !mice_count
	BRL setup_done



hundo_route_stage4:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage4_acts,x)

.stage4_acts:
	dw .act1
	dw .act2

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4


..level_start:
	LDA #$0039
	STA !respawn_x_pos
	LDA #$009F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	STZ $1D6E 		;reset cauldron
	BRL setup_done

..checkpoint1:
	LDA #$0357
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0004
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STZ $1D6E 		;reset cauldron
	BRL setup_done

..checkpoint2:
	LDA #$0877
	STA !respawn_x_pos
	LDA #$009F
	STA !respawn_y_pos
	LDA #$0004
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	LDA #$0001
	STA $1D6E 		;activate cauldron
	BRL setup_done

..checkpoint3:
	LDA #$19C7
	STA !respawn_x_pos
	LDA #$006F
	STA !respawn_y_pos
	LDA #$0004
	STA !current_hearts
	STA !mice_count
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA $1D6E 		;activate cauldron
	BRL setup_done

..checkpoint4:
	LDA #$20C7
	STA !respawn_x_pos
	LDA #$026F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0006
	STA !mice_count
	LDA #$0001
	STA $1D6E 		;activate cauldron
	BRL setup_done


.act2:
	LDA #$0009
	STA $96 		;fix doors not working
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3

..level_start:
	LDA #$0044
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	STZ $1D6E 		;reset cauldron
	BRL setup_done

..checkpoint1:
	LDA #$06D8
	STA !respawn_x_pos
	LDA #$028F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRL setup_done

..checkpoint2:
	LDA #$1708
	STA !respawn_x_pos
	LDA #$026F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$2498
	STA !respawn_x_pos
	LDA #$007F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0006
	STA !mice_count
	BRL setup_done


hundo_route_stage5:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage5_acts,x)

.stage5_acts:
	dw .act1
	dw .act2

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$003D
	STA !respawn_x_pos
	LDA #$022F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	STZ !mice_count
	STZ $1931 			;reset signpost
	BRL setup_done

..checkpoint1:
	LDA #$05C0
	STA !respawn_x_pos
	LDA #$01AF
	STA !respawn_y_pos
	LDA #$0004
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STA $1931 			;active signpost
	BRL setup_done

..checkpoint2:
	LDA #$0F70
	STA !respawn_x_pos
	LDA #$00BF
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	STA $1931 			;active signpost
	LDA #$0005
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$1E7A
	STA !respawn_x_pos
	LDA #$009F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STA !mice_count
	BRL setup_done


.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4


..level_start:
	LDA #$0044
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	STZ $1931 			;reset signpost
	BRL setup_done

..checkpoint1:
	LDA #$1050
	STA !respawn_x_pos
	LDA #$02FF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STZ $1931 			;reset signpost
	BRL setup_done

..checkpoint2:
	LDA #$123B
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	STZ $1931 			;reset signpost
	BRL setup_done

..checkpoint3:
	LDA #$1A40
	STA !respawn_x_pos
	LDA #$01FF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	LDA #$0001
	STA $1931 				;active signpost 1
	BRL setup_done

..checkpoint4:
	LDA #$1D6D
	STA !respawn_x_pos
	LDA #$01CF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STA !mice_count
	LDA #$0001
	STA $1931 				;active signpost 1
	BRL setup_done


hundo_route_stage6:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage6_acts,x)

.stage6_acts:
	dw .act1
	dw .act2
	dw .boss_act

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4
	dw ..checkpoint5
	dw ..checkpoint6
	dw ..checkpoint7


..level_start:
	LDA #$0038
	STA !respawn_x_pos
	LDA #$0A7F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	STZ $192D
	STZ $1931 			;turn off buttons
	SEP #$20
	LDA #$00
	STA $7EB5F9 			;reset back dumb box
	REP #$20
	BRL setup_done

..checkpoint1:
	LDA #$00B0
	STA !respawn_x_pos
	LDA #$00DF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	LDA #$0001
	STA $1931 			;activate button 
	STZ $0310			;bring back STUPID FUCKING GREEN BUTTON 
	SEP #$20
	LDA #$00
	STA $7EB5F9 			;reset back dumb box
	REP #$20
	BRL setup_done

..checkpoint2:
	LDA #$0640
	STA !respawn_x_pos
	LDA #$008F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STA $1931 			;activate button
	SEP #$20
	LDA #$00
	STA $7EB5F9 			;reset back dumb box
	REP #$20
	BRL setup_done

..checkpoint3:
	LDA #$08F9
	STA !respawn_x_pos
	LDA #$061F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	LDA #$0001
	STA $1931 			;activate button
	SEP #$20
	LDA #$00
	STA $7EB5F9 			;reset back dumb box
	REP #$20
	BRL setup_done

..checkpoint4:
	LDA #$0130
	STA !respawn_x_pos
	LDA #$07AF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	LDA #$0085
	STA $7E9E8A
	STA $7E9FF2  			;turn on laser
	STA $7EA15A	
	LDA #$0001
	STA $1931 			;activate button
	STZ $0312 			;reset STUPID FUCKING GREEN BUTTON 2
	SEP #$20
	LDA #$00
	STA $7EB5F9 			;reset back dumb box
	REP #$20
	BRL setup_done

..checkpoint5:
	LDA #$00FC
	STA !respawn_x_pos
	LDA #$094F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STA !mice_count
	LDA #$0001
	STA $1931 			;activate button 1
	LDA #$0001
	STA $0312 			;activate STUPID FUCKING GREEN BUTTON 2
	SEP #$20
	LDA #$0C
	STA $7EB5F9 			;bring back dumb box
	REP #$20
	BRL setup_done

..checkpoint6:
	LDA #$0130
	STA !respawn_x_pos
	LDA #$07AF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0006
	STA !mice_count
	LDA #$0003
	STA $1931 			;activate button 1 and 2
	LDA #$0000
	STA $7E9E8A
	STA $7E9FF2 			;turn off lasers
	STA $7EA15A
	LDA #$0001
	STA $0312 			;activate STUPID FUCKING GREEN BUTTON 2
	SEP #$20
	LDA #$0C
	STA $7EB5F9 			;bring back dumb box
	REP #$20
	BRL setup_done

..checkpoint7:
	LDA #$0563
	STA !respawn_x_pos
	LDA #$03BF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0007
	STA !mice_count
	LDA #$0003
	STA $1931 			;activate button 1 and 2
	LDA #$0001
	STA $0312 			;activate STUPID FUCKING GREEN BUTTON 2
	SEP #$20
	LDA #$0C
	STA $7EB5F9 			;bring back dumb box
	REP #$20
	BRL setup_done


.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3
	dw ..checkpoint4
	dw ..checkpoint5
	dw ..checkpoint6


..level_start:
	LDA #$0031
	STA !respawn_x_pos
	LDA #$004F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ !mice_count
	STZ $1931 			;turn off button
	BRL setup_done

..checkpoint1:
	LDA #$00B0
	STA !respawn_x_pos
	LDA #$094F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STA $1931 			;activate button 1
	LDA #$0000
	STA $7EBE20
	STA $7EBF88
	STA $7EC0F0
	STA $7EC258 			;turn off lasers
	STA $7EBE28
	STA $7EBF90
	STA $7EC0F8
	STA $7EC260
	BRL setup_done

..checkpoint2:
	LDA #$00C0
	STA !respawn_x_pos
	LDA #$0A8F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	STA $1931 			;activate button 1
	LDA #$0000
	STA $7EBE20
	STA $7EBF88
	STA $7EC0F0
	STA $7EC258 			;turn off lasers
	STA $7EBE28
	STA $7EBF90
	STA $7EC0F8
	STA $7EC260
	BRL setup_done

..checkpoint3:
	LDA #$0AA1
	STA !respawn_x_pos
	LDA #$08BF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	LDA #$0001
	STA $1931 			;activate button 1
	BRL setup_done

..checkpoint4:
	LDA #$07F1
	STA !respawn_x_pos
	LDA #$05AF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	LDA #$0003
	STA $1931 			;activate buttons 1 and 2
	LDA #$0000
	STA $7E9AAF
	STA $7E9AB1
	STA $7E9AB3
	STA $7E9AB5
	STA $7E9AB7
	STA $7E9AB9 			;turn off lasers 
	STA $7E9ABB
	STA $7E9ABD
	STA $7E9ABF
	STA $7E9AC1
	STA $7E9AC3
	STA $7E9AC5
	STA $7E9AC7
	STA $7E9AC9
	STA $7E9ACB
	STA $7E9ACD
	BRL setup_done

..checkpoint5:
	LDA #$08C0
	STA !respawn_x_pos
	LDA #$01BF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0003
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	LDA #$0006 			;turn on all 3 buttons
	STA $1931
	LDA #$0000
	STA $7E5456 			;turn off lasers
	STA $7E55BE
	BRL setup_done

..checkpoint6:
	LDA #$0690
	STA !respawn_x_pos
	LDA #$028F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0004
	STA !mice_count
	LDA #$0006 			;turn on all 3 buttons
	STA $1931
	LDA #$0000
	STA $7E4EB6
	STA $7E501E
	STA $7E5456 			;turn off lasers
	STA $7E55BE
	BRL setup_done


.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	STZ !mice_count
	LDA #$0006
	STA $0322 			;restore boss HP
	BRL setup_done


hundo_route_stage7:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage7_acts,x)

.stage7_acts:
	dw .act1
	dw .act2
	dw .act3
	dw .boss_act

.act1:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act1_checkpoints,x)

.act1_checkpoints:
	dw ..level_start
	dw ..checkpoint1


..level_start:
	LDA #$0050
	STA !respawn_x_pos
	LDA #$035F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint1:
	LDA #$1129
	STA !respawn_x_pos
	LDA #$030F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0002
	STA !mice_count
	BRL setup_done


.act2:
	SEP #$20
	LDA #$06 				;fix water hdma
	STA $96
	REP #$20
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2
	dw ..checkpoint3


..level_start:
	LDA #$000B
	STA !respawn_x_pos
	LDA #$00FF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRL setup_done

..checkpoint1:
	LDA #$1BA4
	STA !respawn_x_pos
	LDA #$00C4
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0003
	STA !mice_count
	BRL setup_done

..checkpoint2:
	LDA #$2485
	STA !respawn_x_pos
	LDA #$016F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0005
	STA !mice_count
	BRL setup_done

..checkpoint3:
	LDA #$3220
	STA !respawn_x_pos
	LDA #$011F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	LDA #$0007
	STA !mice_count
	BRL setup_done


.act3:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act3_checkpoints,x)

.act3_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2


..level_start:
	LDA #$0038
	STA !respawn_x_pos
	LDA #$038F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRA setup_done

..checkpoint1:
	LDA #$0050
	STA !respawn_x_pos
	LDA #$00BF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count
	BRA setup_done

..checkpoint2:
	LDA #$0FB0
	STA !respawn_x_pos
	LDA #$039F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0001
	STA !mice_count
	BRA setup_done

.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ !mice_count	
	LDA #$000C
	STA $0322 				;restore boss HP
setup_done:
	SEP #$20
	JSL clear_mice_table
	REP #$30
	STZ $19A7 				;fix bg scroll nonsense
	RTL


hundo_route_checkpoint_cap_table:
	;  act 1  act 2  act 3  act 4
	dw $0007, $0007, $FFFF, $0000		;Sleepy Rock
	dw $0004, $0004, $0003, $0000		;Surely Wood
	dw $0004, $0004, $FFFF, $0000		;Fiesta City
	dw $0005, $0004, $FFFF, $0000		;Ancient Keep
	dw $0004, $0005, $FFFF, $0000		;Snowy Cabins
	dw $0008, $0007, $FFFF, $0000		;Galactical Galaxies
	dw $0002, $0004, $0003, $0000		;Ye Olde Bounty
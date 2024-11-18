any_route_stage_table:
        dw any_route_stage1
        dw any_route_stage2
        dw any_route_stage3
        dw any_route_stage4
        dw any_route_stage5
        dw any_route_stage6
        dw any_route_stage7

any_route_stage1:
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


..level_start:
	LDA #$0020
	STA !respawn_x_pos
	LDA #$02DF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	RTL	


..checkpoint1:
	LDA #$0845
	STA !respawn_x_pos
	LDA #$023F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	RTL


..checkpoint2:
	LDA #$1430
	STA !respawn_x_pos
	LDA #$008F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0003
	STA !max_hearts	
	RTL


.act2:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)


.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2


..level_start:
	LDA #$0005
	STA !respawn_x_pos
	LDA #$029F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	; LDA #$0008
	; STA $7E7544 			;respawn shoe
	RTL	


..checkpoint1:
	LDA #$0770
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0003
	STA !max_hearts	
	; LDA #$0008
	; STA $7E7544 			;respawn shoe
	RTL

..checkpoint2:
	LDA #$1C33
	STA !respawn_x_pos
	LDA #$018F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0003
	STA !max_hearts	
	RTL


any_route_stage2:
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


..level_start:
	LDA #$003A
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts
	; LDA #$0008
	; STA $7E9ED1 			;respawn shoes
	; STA $7E984E
	; STA $7E815F
	RTL


..checkpoint1:
	LDA #$06BF
	STA !respawn_x_pos
	LDA #$012F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts	
	; LDA #$0008		
	; STA $7E984E 			;respawn shoes
	; STA $7E815F
	RTL	

..checkpoint2:
	LDA #$251B
	STA !respawn_x_pos
	LDA #$007F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	STA !max_hearts	
	; LDA #$0008
	; STA $7E815F 			;respawn shoe
	RTL


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
	STA !max_hearts
	; LDA #$0002
	; STA $7EA031 			;respawn big heart
	; LDA #$0008
	; STA $7EB2E5
	RTL

..checkpoint1:
	LDA #$1280
	STA !respawn_x_pos
	LDA #$004F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0003
	STA !max_hearts	
	; LDA #$0002
	; STA $7EA031 			;respawn big heart
	RTL

..checkpoint2:
	LDA #$1DC0
	STA !respawn_x_pos
	LDA #$0127
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	RTL	

..checkpoint3:
	LDA #$3577
	STA !respawn_x_pos
	LDA #$003F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	RTL

.act3:
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act3_checkpoints,x)

.act3_checkpoints:
	dw ..level_start
	dw ..checkpoint1


..level_start:
	LDA #$0052
	STA !respawn_x_pos
	LDA #$032F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	RTL


..checkpoint1:
	LDA #$0C50
	STA !respawn_x_pos
	LDA #$00E7
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	RTL


.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	; LDA #$0082
	; STA $7E4B53 			;respawn big heart
	; LDA #$0092	
	; STA $7E4C0A 			;respawn left small heart
	; LDA #$0012 			
	; STA $7E4C2B 			;respawn right small heart
	LDA #$0008
	STA $0322 			;restore boss HP
	RTL


any_route_stage3:
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


..level_start:
	LDA #$00F6
	STA !respawn_x_pos
	LDA #$036F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	RTL

..checkpoint1:
	LDA #$0400
	STA !respawn_x_pos
	LDA #$003F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	RTL

..checkpoint2:
	LDA #$1263
	STA !respawn_x_pos
	LDA #$003F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	RTL

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
	LDA #$0005
	STA !max_hearts
	; LDA #$0008
	; STA $7EB5DB 			;respawn shoes
	; STA $7E9E4D
	RTL

..checkpoint1:
	LDA #$04D5
	STA !respawn_x_pos
	LDA #$083F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	; LDA #$0008
	; STA $7EB5DB 			;respawn shoes
	; STA $7E9E4D			
	RTL

..checkpoint2:
	LDA #$0630
	STA !respawn_x_pos
	LDA #$036F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	; LDA #$0008
	; STA $7EB5DB 			;respawn shoes
	; STA $7E9E4D
	RTL

..checkpoint3:
	LDA #$0B3A
	STA !respawn_x_pos
	LDA #$042F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	; LDA #$0008
	; STA $7E9E4D  			;respawn shoe
	RTL


any_route_stage4:
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
	LDA #$0005
	STA !max_hearts
	STZ $1D6E 		;reset cauldron
	RTL

..checkpoint1:
	LDA #$0357
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	STZ $1D6E 		;reset cauldron
	RTL

..checkpoint2:
	LDA #$0A0D
	STA !respawn_x_pos
	LDA #$009F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1D6E 		;activate cauldron
	RTL

..checkpoint3:
	LDA #$1BD7
	STA !respawn_x_pos
	LDA #$026F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1D6E 		;activate cauldron
	RTL

..checkpoint4:
	LDA #$20C7
	STA !respawn_x_pos
	LDA #$026F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1D6E 		;activate cauldron
	RTL

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
	LDA #$044
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	; LDA #$0008			;respawn shoe
	; STA $7E71E7
	RTL

..checkpoint1:
	LDA #$0B94
	STA !respawn_x_pos
	LDA #$004F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	; LDA #$0008			;respawn shoe
	; STA $7E71E7
	RTL

..checkpoint2:
	LDA #$1887
	STA !respawn_x_pos
	LDA #$0257
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	; LDA #$0008			;respawn shoe
	; STA $7E71E7
	RTL

..checkpoint3:
	LDA #$2498
	STA !respawn_x_pos
	LDA #$007F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	RTL


any_route_stage5:
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


..level_start:
	LDA #$003D
	STA !respawn_x_pos
	LDA #$022F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ $1931 			;reset signpost
	RTL

..checkpoint1:
	LDA #$0F90
	STA !respawn_x_pos
	LDA #$00BF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	STZ $1931 			;reset signpost
	RTL

..checkpoint2:
	LDA #$1E7A
	STA !respawn_x_pos
	LDA #$009F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;active signpost
	RTL


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
	LDA #$0044
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	STZ $1931 				;reset signposts
	RTL

..checkpoint1:
	LDA #$123B
	STA !respawn_x_pos
	LDA #$013F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	STZ $1931 				;reset signposts
	RTL

..checkpoint2:
	LDA #$16DD
	STA !respawn_x_pos
	LDA #$024F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 				;active signpost 1
	RTL

..checkpoint3:
	LDA #$1D6D
	STA !respawn_x_pos
	LDA #$01CF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 				;active signpost 1
	RTL


any_route_stage6:
        LDA !current_act
        ASL 
        TAX
        JMP (.stage6_acts,x)

.stage6_acts:
	dw .act1
	dw .act2
	dw .boss_act

.act1:
	SEP #$20
	JSL clear_mice_table
	REP #$30
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
	STZ $192D
	STZ $1931			;reset buttons
	RTL

..checkpoint1:
	LDA #$00B0
	STA !respawn_x_pos
	LDA #$00DF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;activate button
	STZ $0310			;reset STUPID FUCKING GREEN BUTTON
	RTL

..checkpoint2:
	LDA #$0660
	STA !respawn_x_pos
	LDA #$008F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;activate button
	RTL

..checkpoint3:
	LDA #$08F9
	STA !respawn_x_pos
	LDA #$061F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;activate button
	RTL

..checkpoint4:
	LDA #$0130
	STA !respawn_x_pos
	LDA #$07AF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0085
	STA $7E9E8A
	STA $7E9FF2  			;turn on laser
	STA $7EA15A	
	LDA #$0001
	STA $1931 			;activate button
	RTL

..checkpoint5:
	LDA #$00FC
	STA !respawn_x_pos
	LDA #$094F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;activate button
	RTL

..checkpoint6:
	LDA #$0130
	STA !respawn_x_pos
	LDA #$07AF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0005
	STA !max_hearts
	LDA #$0000
	STA $7E9E8A
	STA $7E9FF2  			;turn off laser	
	STA $7EA15A		
	LDA #$0002
	STA $1931 			;activate buttons
	RTL

..checkpoint7:
	LDA #$0563
	STA !respawn_x_pos
	LDA #$03BF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0002
	STA $1931 			;activate buttons
	RTL


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


..level_start:
	LDA #$0031
	STA !respawn_x_pos
	LDA #$004F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	STZ $1931 			;reset buttons
	RTL

..checkpoint1:
	LDA #$00B0
	STA !respawn_x_pos
	LDA #$094F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;turn on button 1
	LDA #$0000
	STA $7EBE20
	STA $7EBF88
	STA $7EC0F0
	STA $7EC258 			;turn off lasers
	STA $7EBE28
	STA $7EBF90
	STA $7EC0F8
	STA $7EC260
	RTL

..checkpoint2:
	LDA #$00C0
	STA !respawn_x_pos
	LDA #$0A8F
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0000
	STA $7EBE20
	STA $7EBF88
	STA $7EC0F0
	STA $7EC258 			;turn off lasers
	STA $7EBE28
	STA $7EBF90
	STA $7EC0F8
	STA $7EC260
	LDA #$0001
	STA $1931 			;turn on button 1
	RTL

..checkpoint3:
	LDA #$0AA1
	STA !respawn_x_pos
	LDA #$08BF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0001
	STA $1931 			;turn on button 1
	RTL

..checkpoint4:
	LDA #$07F1
	STA !respawn_x_pos
	LDA #$05AF
	STA !respawn_y_pos
	LDA #$0002
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0003
	STA $1931 			;turn on button 1 and 2
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
	RTL

..checkpoint5:
	LDA #$08C0
	STA !respawn_x_pos
	LDA #$01BF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0003
	STA !max_hearts	
	LDA #$00FF
	STA $1931 			;turn on all buttons
	LDA #$0000
	STA $7E5456 			;turn off lasers
	STA $7E55BE
	RTL


.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	LDA #$0006
	STA $0322 			;restore boss HP
	RTL


any_route_stage7:
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
	; LDA #$0008
	; STA $7EB8F7 				;respawn shoe
	RTL

..checkpoint1:
	LDA #$1129
	STA !respawn_x_pos
	LDA #$030F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	; LDA #$0008
	; STA $7EADDE 				;respawn shoe
	RTL


.act2:
	SEP #$20
	LDA #$06 				;fix water hdma
	STA $96
	STZ $0990
	REP #$20
	LDA !current_checkpoint
	ASL
	TAX
	JMP (.act2_checkpoints,x)

.act2_checkpoints:
	dw ..level_start
	dw ..checkpoint1
	dw ..checkpoint2


..level_start:
	LDA #$000B
	STA !respawn_x_pos
	LDA #$00FF
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts
	; LDA #$0008
	; STA $7E9F2F				;respawn shoes
	; STA $7E99EE				
	RTL

..checkpoint1:
	LDA #$2485
	STA !respawn_x_pos
	LDA #$016F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	; LDA #$0008
	; STA $7E9F2F				;respawn shoes
	; STA $7E99EE	
	RTL

..checkpoint2:
	LDA #$3220
	STA !respawn_x_pos
	LDA #$011F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	; LDA #$0008
	; STA $7E9F2F				;respawn shoes
	; STA $7E99EE	
	RTL


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
	RTL

..checkpoint1:
	LDA #$0197
	STA !respawn_x_pos
	LDA #$008F
	STA !respawn_y_pos
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	RTL

..checkpoint2:
	LDA #$0EDA
	STA !respawn_x_pos
	LDA #$035F
	STA !respawn_y_pos
	LDA #$0001
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	RTL


.boss_act:
	LDA #$0003
	STA !current_hearts
	LDA #$0004
	STA !max_hearts	
	; LDA #$0002
	; STA $7E4AF1 			;respawn big heart
	; LDA #$0012
	; STA $7E4AF4 			;respawn small hearts
	; STA $7E4AF6 
	LDA #$000C
	STA $0322 			;restore boss HP
	RTL


any_route_checkpoint_cap_table:
	;  act 1  act 2  act 3  act 4
	dw $0003, $0003, $FFFF, $0000		;Sleepy Rock
	dw $0003, $0004, $0002, $0000		;Surely Wood
	dw $0003, $0004, $FFFF, $0000		;Fiesta City
	dw $0005, $0004, $FFFF, $0000		;Ancient Keep
	dw $0003, $0004, $FFFF, $0000		;Snowy Cabins
	dw $0008, $0006, $FFFF, $0000		;Galactical Galaxies
	dw $0002, $0003, $0003, $0000		;Ye Olde Bounty
	
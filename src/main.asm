lorom

optimize dp always
optimize address mirrors


org $008000    
	incsrc defines.asm
	incsrc hijacks.asm


org freerom
	incsrc room_change.asm
	incsrc warp_menu.asm
	incsrc misc.asm


extra_chars:
	incbin "data/extra_chars.bin"

warnpc freerom|$FFFF

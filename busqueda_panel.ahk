;Arranca la libreria de busqueda de imagenes




buscar_batalla_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_01
	}
return

buscar_batalla_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_02
	}
return

buscar_batalla_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_03
	}
return

buscar_batalla_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_04
	}
return

buscar_batalla_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_05
	}
return

buscar_batalla_05:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.05.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_06
	}
return

buscar_batalla_06:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.06.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_batalla_07
	}
return

buscar_batalla_07:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.batalla.07.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_batalla = 1
	c_move_panel_batallax := FoundX
	c_move_panel_batallay := FoundY
	c_move_panel_batallaf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_boss_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_01
	}
return

buscar_boss_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_02
	}
return

buscar_boss_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_03
	}
return

buscar_boss_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_04
	}
return

buscar_boss_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_05
	}
return

buscar_boss_05:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.05.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_06
	}
return

buscar_boss_06:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.06.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_07
	}
return

buscar_boss_07:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.07.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_08
	}
return

buscar_boss_08:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.08.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_boss_09
	}
return

buscar_boss_09:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.boss.09.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_boss = 1
	c_move_panel_bossx := FoundX
	c_move_panel_bossy := FoundY
	c_move_panel_bossf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_card_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.card.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_card = 1
	c_move_panel_cardx := FoundX
	c_move_panel_cardy := FoundY
	c_move_panel_cardf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_card_01
	}
return

buscar_card_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.card.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_card = 1
	c_move_panel_cardx := FoundX
	c_move_panel_cardy := FoundY
	c_move_panel_cardf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_card_02
	}
return

buscar_card_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.card.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_card = 1
	c_move_panel_cardx := FoundX
	c_move_panel_cardy := FoundY
	c_move_panel_cardf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_drop_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_01
	}
return

buscar_drop_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_02
	}
return

buscar_drop_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_03
	}
return

buscar_drop_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_04
	}
return

buscar_drop_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_05
	}
return

buscar_drop_05:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.05.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_06
	}
return

buscar_drop_06:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.06.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_07
	}
return

buscar_drop_07:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.07.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_08
	}
return

buscar_drop_08:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.08.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_drop_09
	}
return

buscar_drop_09:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.drop.09.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_drop = 1
	c_move_panel_dropx := FoundX
	c_move_panel_dropy := FoundY
	c_move_panel_dropf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_heal_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.heal.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_heal = 1
	c_move_panel_healx := FoundX
	c_move_panel_healy := FoundY
	c_move_panel_healf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_heal_01
	}
return

buscar_heal_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.heal.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_heal = 1
	c_move_panel_healx := FoundX
	c_move_panel_healy := FoundY
	c_move_panel_healf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_home_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_01
	}
return

buscar_home_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_02
	}
return

buscar_home_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_03
	}
return

buscar_home_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_04
	}
return

buscar_home_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_05
	}
return

buscar_home_05:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.05.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_06
	}
return

buscar_home_06:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.06.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_home_07
	}
return

buscar_home_07:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.home.07.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_home = 1
	c_move_panel_homex := FoundX
	c_move_panel_homey := FoundY
	c_move_panel_homef := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_stars_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_01
	}
return

buscar_stars_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_02
	}
return

buscar_stars_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_03
	}
return

buscar_stars_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_04
	}
return

buscar_stars_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_05
	}
return

buscar_stars_05:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.05.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_06
	}
return

buscar_stars_06:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.06.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_07
	}
return

buscar_stars_07:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.07.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_08
	}
return

buscar_stars_08:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.08.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_09
	}
return

buscar_stars_09:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.09.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_10
	}
return

buscar_stars_10:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.10.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_11
	}
return

buscar_stars_11:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.11.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_stars_12
	}
return

buscar_stars_12:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.stars.12.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_stars = 1
	c_move_panel_starsx := FoundX
	c_move_panel_starsy := FoundY
	c_move_panel_starsf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return



buscar_tp_00:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.tp.00.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_tp = 1
	c_move_panel_tpx := FoundX
	c_move_panel_tpy := FoundY
	c_move_panel_tpf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_tp_01
	}
return

buscar_tp_01:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.tp.01.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_tp = 1
	c_move_panel_tpx := FoundX
	c_move_panel_tpy := FoundY
	c_move_panel_tpf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_tp_02
	}
return

buscar_tp_02:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.tp.02.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_tp = 1
	c_move_panel_tpx := FoundX
	c_move_panel_tpy := FoundY
	c_move_panel_tpf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_tp_03
	}
return

buscar_tp_03:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.tp.03.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_tp = 1
	c_move_panel_tpx := FoundX
	c_move_panel_tpy := FoundY
	c_move_panel_tpf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	gosub, buscar_tp_04
	}
return

buscar_tp_04:
;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.tp.04.png"

;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, %imagen_threshold% paneles\%move_panel_panel_objetivo%
if ErrorLevel = 0
	{
	c_move_panel_tp = 1
	c_move_panel_tpx := FoundX
	c_move_panel_tpy := FoundY
	c_move_panel_tpf := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return
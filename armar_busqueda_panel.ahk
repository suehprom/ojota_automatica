nombre_archivo := "busqueda_panel.ahk"
lista_nombres := []
nombrecorto := []

FileDelete, %nombre_archivo%

FileAppend,
(
`;Arranca la libreria de busqueda de imagenes

), %nombre_archivo%

;parseo archivos
FileList := ""
Loop, paneles\*.*
    FileList .= A_LoopFileName "`n"
Sort, FileList ; The R option sorts in reverse order. See Sort for other options.

;tengo nombres cargados en memoria
;parseo nombres
Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, calcular_ultimo
}

;escribo rutinas de a una

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_batalla
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_boss
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_card
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_drop
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_heal
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_home
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_stars
}

Loop, parse, FileList, `n
{
    if (A_LoopField = "")  ; Ignore the blank item at the end of the list.
        continue
    gosub, escribir_tp
}

msgbox, altoque perro

exitapp

calcular_ultimo:

IfInString, A_LoopField, batalla
{
	StringTrimRight, batalla_final, A_LoopField, 4
	StringTrimleft, batalla_final, batalla_final, 11
}
IfInString, A_LoopField, boss
{
	StringTrimRight, boss_final, A_LoopField, 4
	StringTrimleft, boss_final, boss_final, 11
}
IfInString, A_LoopField, card
{
	StringTrimRight, card_final, A_LoopField, 4
	StringTrimleft, card_final, card_final, 11
}
IfInString, A_LoopField, drop
{
	StringTrimRight, drop_final, A_LoopField, 4
	StringTrimleft, drop_final, drop_final, 11
}
IfInString, A_LoopField, heal
{
	StringTrimRight, heal_final, A_LoopField, 4
	StringTrimleft, heal_final, heal_final, 11
}
IfInString, A_LoopField, home
{
	StringTrimRight, home_final, A_LoopField, 4
	StringTrimleft, home_final, home_final, 11
}
IfInString, A_LoopField, stars
{
	StringTrimRight, stars_final, A_LoopField, 4
	StringTrimleft, stars_final, stars_final, 11
}
IfInString, A_LoopField, tp
{
	StringTrimRight, tp_final, A_LoopField, 4
	StringTrimleft, tp_final, tp_final, 11
}
return

escribir_batalla:
buscar := "batalla"
gosub, procesar
return

escribir_boss:
buscar := "boss"
gosub, procesar
return

escribir_card:
buscar := "card"
gosub, procesar
return

escribir_drop:
buscar := "drop"
gosub, procesar
return

escribir_heal:
buscar := "heal"
gosub, procesar
return

escribir_home:
buscar := "home"
gosub, procesar
return

escribir_stars:
buscar := "stars"
gosub, procesar
return

escribir_tp:
buscar := "tp"
gosub, procesar
return







procesar:

IfInString, A_LoopField, %buscar%
{
	nombrecorto := StrSplit(A_LoopField, ".")
	if (nombrecorto[4] = "00")
	{
		punto := nombrecorto[3] "." nombrecorto[4]
		guion := nombrecorto[3] "_" nombrecorto[4]
		nombre := nombrecorto[3]
		gosub, inicio
	}else IfInString, A_LoopField, % %buscar%_final
	{
		punto := nombrecorto[3] "." nombrecorto[4]
		guion := nombrecorto[3] "_" nombrecorto[4]
		nombre := nombrecorto[3]
		;msgbox, voy final`n%punto%`n%A_LoopField%
		;msgbox, % %buscar%_final
		gosub, final
	}
	else
	{
		punto := nombrecorto[3] "." nombrecorto[4]
		guion := nombrecorto[3] "_" nombrecorto[4]
		nombre := nombrecorto[3]
		gosub, media
	}
}

;FileAppend,
;(
;%A_LoopField%
;
;), %nombre_archivo%

return

inicio:
FileAppend,
(




buscar_%guion%:
`;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.%punto%.png"

`;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, `%imagen_threshold`% paneles\`%move_panel_panel_objetivo`%
if ErrorLevel = 0
	{
	c_move_panel_%nombre% = 1
	c_move_panel_%nombre%x := FoundX
	c_move_panel_%nombre%y := FoundY
	c_move_panel_%nombre%f := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
), %nombre_archivo%


return






media:
FileAppend,
(

	gosub, buscar_%guion%
	}
return

buscar_%guion%:
`;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.%punto%.png"

`;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, `%imagen_threshold`% paneles\`%move_panel_panel_objetivo`%
if ErrorLevel = 0
	{
	c_move_panel_%nombre% = 1
	c_move_panel_%nombre%x := FoundX
	c_move_panel_%nombre%y := FoundY
	c_move_panel_%nombre%f := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
), %nombre_archivo%


return

final:

FileAppend,
(

	gosub, buscar_%guion%
	}
return

buscar_%guion%:
`;defino nombre imagen a buscar
move_panel_panel_objetivo := "move.panel.%punto%.png"

`;busco imagen
ImageSearch, FoundX, FoundY, move_panel_decision_x1, move_panel_decision_y1, move_panel_decision_x2, move_panel_decision_y2, `%imagen_threshold`% paneles\`%move_panel_panel_objetivo`%
if ErrorLevel = 0
	{
	c_move_panel_%nombre% = 1
	c_move_panel_%nombre%x := FoundX
	c_move_panel_%nombre%y := FoundY
	c_move_panel_%nombre%f := move_panel_panel_objetivo
	gosub, check_escribir_panel_log
	return
	}
	else
	{
	return
	}
return
), %nombre_archivo%
return






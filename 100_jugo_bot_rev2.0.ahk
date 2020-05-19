;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         morpheus
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

;con boss big the jhonatan (o cualquier boss) sirve para farmear coins y naranjas
;800 600
;q arranca como cliente, alguien mas que sea server
;w arranca como server, inicia la partida spammea ready hasta que encuentra buscar mazo
;e arranca como singleplayer, seleccionar cualquier mision, se encarga de seleccionar la correcta

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Mouse, Client
CoordMode, Pixel, Client
#SingleInstance force

;seteo contadores en cero
gosub, limpiar_contadores
;cargar personaje a elegir en memoria
FileReadLine, personaje, personaje.txt, 2
;cargo la mision
FileReadLine, mision, personaje.txt, 4
;cargo modo
FileReadLine, modo, personaje.txt, 6
;subrutina para cargar y limpiar el chap
gosub, definir_chap
;cargo auto o simple
FileReadLine, automatico, personaje.txt, 10
;cargo uso de cartas
FileReadLine, usocartas, personaje.txt, 12
;cargo variable de debug
FileReadLine, debug, personaje.txt, 14
;cargo maximo valor de confirmacion
FileReadLine, valor_confirmacion, personaje.txt, 16
;cargo click entre busquedas de imagnes
FileReadLine, click_entre_busquedas, personaje.txt, 18
;cargo revision de reconocimiento
FileReadLine, reconocimiento, personaje.txt, 20
;cargo opcion captura debug
FileReadLine, enable_captura_debug, personaje.txt, 22
;cargo opcion ecsribe log panel
FileReadLine, enable_panel_log, personaje.txt, 24
;cargo opcion de atacar siempre o no
FileReadLine, atacar_siempre, personaje.txt, 26

;seteo sector donde buscar paneles a mover
move_panel_decision_x1 := 107
move_panel_decision_y1 := 97
move_panel_decision_x2 := 716
move_panel_decision_y2 := 518
;seteo threshold maximo de imagenes
imagen_threshold := "*TransWhite *37"

;include la libreria de busqueda de paneles
#Include busqueda_panel.ahk

q::
single := "no"
sufijo := "coop"
;cliente
Loop {
	gosub, correr_mouse
	gosub, clico
	Click up
	gosub, buscar_espectador
	gosub, buscar_lobby_cliente
	gosub, buscar_load
	gosub, buscar_player
	;por busqueda de player, no inicia si no encuentra palabra player, descomentar lo que sigue de lo contrario
	;gosub, main_bot
}
return

w::
single := "no"
sufijo := "coop"
;servidor
Loop {
	gosub, correr_mouse
	gosub, clico
	Click up
	gosub, buscar_espectador
	gosub, buscar_lobby_host
	gosub, buscar_load
	gosub, buscar_player
	;por busqueda de player, no inicia si no encuentra palabra player, descomentar lo que sigue de lo contrario
	;gosub, main_bot
}
return

e::
;singleplayer
single := "si"
sufijo := "solo"
;uso control y shift para que vaya a los pedos
send {LControl down}
send {LShift down}
Loop {
	gosub, correr_mouse_singleplayer
	gosub, clico
	Click up
	gosub, buscar_selectstage
	gosub, buscar_campaign
	;testeo si estoy para elegir char
	gosub, buscar_load
	;posicionar mouse para busqueda de imagenes
	gosub, posicionar_nueva_busqueda
	;voy a rutina principal
	gosub, proceder_main_bot
	;control y shift nuevamente para apurarlo, encontrado inconsistencia de teclas en equipos lentos
	send {LControl down}
	sleep 30
	send {LShift down}
}

return


proceder_main_bot:
;si reconocimiento si busco pasos por imagenes
;si no uso tradicional click por todos lados
if (reconocimiento = "si"){
	;ir a rutina de busqueda de posibles clicks repetida cantidad de veces que re chequeo imagenes
	Loop %valor_confirmacion%{
	gosub, buscar_posibles
	sleep 100
	}
}
else{
	;busco player a ver si estoy en partida
	gosub, buscar_player
}
return



;rutinas internas------------------------

arriba_izq:
;800
MouseMove, 315, 229
gosub, clico
return

arriba_der:
;800
MouseMove, 502, 229
gosub, clico
return

abajo_izq:
;800
MouseMove, 293, 322
gosub, clico
return

abajo_der:
;800
MouseMove, 493, 322
gosub, clico
return

cancel2:
;800
;ej cancel seleccion carta
MouseMove, 401, 531
sleep 70
click up
sleep 70
gosub, clico
sleep 70
click up
return

moverse:
;move sin habilidades
;800
MouseMove, 375, 364
gosub, clico
return

moverse12:
;move con skill de atk
;800
MouseMove, 300, 378
gosub, clico
return

moverse13:
;move con skill de dealer
;800
MouseMove, 216, 387
gosub, clico
return

moverse14:
;move sin skill y sin cartas
;800
MouseMove, 376, 383
gosub, clico
return

atq_defender:
;defender cuando yo ataco
;800
MouseMove, 122, 215
gosub, clico
return

seleccionar_target_arriba_derecha:
MouseMove, 644, 195
gosub, clico
return

seleccionar_target_arriba_izquierda:
MouseMove, 151, 193
gosub, clico
return

seleccionar_target_abajo_derecha:
MouseMove, 644, 403
gosub, clico
return

seleccionar_target_abajo_izquierda:
MouseMove, 146, 403
gosub, clico
return

back_2.9.1:
;click en back en cierto menu de la 2.9.1
MouseMove, 295, 438
gosub, clico
return

defender:
;defender cuando me atacan
;800
MouseMove, 584, 208
gosub, clico
return

yes:
;yes atacar a alguien o parar en casa
;800
MouseMove, 303, 366
gosub, clico
return

elejir_estrella:
;800
MouseMove, 353, 224
gosub, clico
return

elejir_wins:
;800
MouseMove, 353, 301
gosub, clico
return

clico:
Click up
sleep 50
Click down
sleep 50
Click up
sleep 50
return

clico_lento:
Click up
sleep 70
Click down
sleep 70
Click up
sleep 70
return

clico_derecho:
sleep 50
Click down r
sleep 50
Click up r
sleep 50
return

clico_move_panel:
;muevo y hago click
MouseMove, %FoundX%, %FoundY%
sleep 50
gosub, check_debug_mov
gosub, clico_lento
return

seleccionar_target:
;seleccionar target de habilidad especial
;800
MouseMove, 292, 256
sleep 100
gosub, clico
return

ready:
;boton ready antes de entrar a elejir cartas
;800
MouseMove, 763, 565
sleep 100
gosub, clico
return

foco:
send {MButton down}
sleep 30
send {MButton up}
sleep 15
send {WheelUp}
send {WheelUp}
send {WheelUp}
send {WheelUp}
return

bolita_mouse:
send {MButton up}
sleep 15
send {WheelUp}
send {WheelUp}
send {WheelUp}
send {WheelUp}
return

boton_central:
sleep 30
send {MButton down}
sleep 30
send {MButton up}
sleep 30
;consume mucho tiempo alejarme
;loop 10 {
;send {WheelDown}
;sleep 30
;}
return

boton_central_alejar_foco:
sleep 30
send {MButton down}
sleep 30
send {MButton up}
sleep 30
;consume mucho tiempo alejarme
loop 10 {
send {WheelDown}
sleep 15
}
return

buscar_lobby:
;busca letras lobby para presionar ready
;800
	ImageSearch, FoundX, FoundY, 118, 444, 160, 483, *32 lobby800.png
	if ErrorLevel = 0
		{
		;esto si es cliente
		;encontro lobby, poner ready y esperar digamos 7 segundos
		gosub, ready
		sleep 7000
		}
	else
return

buscar_lobby_cliente:
;busca letras lobby para presionar ready
;800
	ImageSearch, FoundX, FoundY, 118, 444, 160, 483, *32 lobby800.png
	if ErrorLevel = 0
		{
		;esto si es cliente
		;encontro lobby, poner ready y esperar digamos 7 segundos
		gosub, chequeo_si_lobby
		return
		}
	else
return

buscar_lobby_host:
;busca letras lobby para presionar ready
;800
	ImageSearch, FoundX, FoundY, 118, 444, 160, 483, *32 lobby800.png
	if ErrorLevel = 0
		{
		;esto si es host
		gosub, soy_host
		return
		}
	else
return



buscar_load:
;busca letras load para saber si estoy listo para elejir cartas y char
;800
	ImageSearch, FoundX, FoundY, 265, 100, 292, 142, *32 load800.png
	if ErrorLevel = 0
		{
		;cargo char y carta y espero 7 segundos
		gosub, elegir_char
		sleep 7000
		return
		}
	else
return

buscar_player:
;busco division de colores de panel de player 1 al lado de la estrella
;800
	ImageSearch, FoundX, FoundY, 157, 7, 198, 24, *32 playermainbot.png
	if ErrorLevel = 0
		{
		;encontre main bot, listo para arrancar el bot principal
		gosub, main_bot
		return
		}
	else
return

buscar_espectador:
;busca letras espectador para dejarlo entrar
;800
	ImageSearch, FoundX, FoundY, 339, 255, 389, 294, *32 spectado800.png
	if ErrorLevel = 0
		{
		;se encuentra espectador en pantalla, click ok para dejarlo entrar
		MouseMove, 334, 433
		gosub, clico
		return
		}
	else
return

buscar_selectstage:
;busca letra G de select stage para iniciar seleccion de mision
;800
	ImageSearch, FoundX, FoundY, 331, 13, 394, 63, *32 singleply800.png
	if ErrorLevel = 0
		{
		;click derecho para salir de ese menu
		gosub, clico_derecho
		if (automatico = "auto"){
					gosub, seleccionar_automatico
					}
		else {
		      gosub, seleccionar_single
		     }
		return
		}
	else
return

buscar_campaign:
;busca letra C de capmaign para iniciar seleccion de mision
;800
	ImageSearch, FoundX, FoundY, 8, 9, 57, 38, *32 campaign800.png
	if ErrorLevel = 0
		{
		if (automatico = "auto"){
					gosub, seleccionar_automatico
					}
		else {
		      gosub, seleccionar_single
		     }
		return
		}
	else
return

seleccionar_single:
;selecciono single en modo no automatico
;seleccionar mision
gosub, seleccionar_mision
;seleccionar dificultad
gosub, seleccionar_dificultad
;voy a calcular el chap
gosub, actualizar_chap
;elijo el chap en base a la variable chap
if (chap = "1"){
gosub, mover_a_chap1
}
else if (chap = "2"){
gosub, mover_a_chap2
}
else if (chap = "3"){
gosub, mover_a_chap3
}
else if (chap = "4"){
gosub, mover_a_chap4
}
else if (chap = "5"){
gosub, mover_a_chap5
}
else if (chap = "6"){
gosub, mover_a_chap6
}
else if (chap = "7"){
gosub, mover_a_chap7
}
else if (chap = "8"){
gosub, mover_a_chap8
}
else if (chap = "9"){
gosub, mover_a_chap9
}
else if (chap = "10"){
gosub, mover_a_chap10
}
else if (chap = "11"){
gosub, mover_a_chap11
}
else if (chap = "12"){
gosub, mover_a_chap12
}
;selecciono el chap y salteo cinematica
gosub, seleccionar_chap_final
;aca deberia elegir char y mazo y esas cosas
;vuelvo y hago un chequeo de imagen para elegir char
return

seleccionar_chap_final:
;click en el chap donde estoy parado
gosub, clico
sleep 1700
;vuelvo a elegir mision por las dudas de que ya haya terminado la mision asi no me salgo de este menu
gosub, seleccionar_mision
sleep 50
;salteo la cinematica con click derecho
gosub, clico_derecho
return

seleccionar_mision:
;selecciono mision en base a archivo
if (mision = "qp"){
MouseMove, 311, 435
}
else if (mision = "suguri"){
MouseMove, 304, 304
}
else if (mision = "extra"){
MouseMove, 337, 483
}
else if (mision = "kai"){
MouseMove, 484, 458
}
else if (mision = "girlpower"){
MouseMove, 415, 285
}
else if (mision = "marc"){
MouseMove, 504, 331
}
else if (mision = "starbo"){
MouseMove, 584, 409
}
else if (mision = "sweetbo"){
MouseMove, 688, 390
}
else if (mision = "algochristmases"){
MouseMove, 557, 252
}
else if (mision = "oldguardian"){
MouseMove, 675, 291
}
else if (mision = "wanderer"){
MouseMove, 396, 405
}
sleep 30
gosub, clico
sleep 30
return

seleccionar_dificultad:
;selecciono dificultad en base a archivo
if (modo = "casual"){
MouseMove, 205, 109
}
else if (modo = "normal"){
MouseMove, 346, 109
}
else if (modo = "original"){
MouseMove, 486, 109
}
else if (modo = "extreme"){
MouseMove, 620, 109
}
gosub, clico
sleep 30
return

seleccionar_automatico:
;seleccion automatica de chaps no ganados en base a la dificultad
;selecciono single en modo no automatico
;seleccionar mision
gosub, seleccionar_mision
;seleccionar dificultad
gosub, seleccionar_dificultad
;defino nombre de archivo a buscar corona verde o roja
if (modo = "extreme"){
			nombrearchivocorona = coronaextreme.png
		     }
else
		     {
			nombrearchivocorona = coronaoriginal.png
		     }

gosub, chequear_chap1

return

correr_mouse:
;corro mouse para que no me tape la vista
;800
MouseMove, 22, 238
return

final_loop:
;seteo formato de fecha hora
FormatTime, CurrentDateTime,, yy-MM-dd HH:mm
;lo escribo en el log
;si es solo escribo toda la linea, si no solo el sufijo con el pj
if (single = "no"){
FileAppend, %CurrentDateTime% - %sufijo% - char:%personaje%`n, log.txt
}
else if (single = "si"){
FileAppend, %CurrentDateTime% - %sufijo% - chap:%chap% - %modo% - campaña:%mision% - char:%personaje%`n, log.txt
}



return

correr_mouse_singleplayer:
;corro mouse para que no me tape la vista
;800
MouseMove, 531, 554
return

elegir_char:
;elegir char y luego cartas
;800
;click en char traer menu para elejir chars
MouseMove, 658, 422
gosub, clico
;-----
;eligo char en base a variable personaje
;primero posiciono a qp por si no detecta el char
MouseMove, 212, 155
;despues pregunto y vuelvo a mover si corresponde
if (personaje = "qp"){
MouseMove, 203, 167
}
else if (personaje = "manager"){
MouseMove, 300, 164
}
else if (personaje = "chifu"){
MouseMove, 103, 256
}
else if (personaje = "yuki"){
MouseMove, 588, 158
}
else if (personaje = "starbo"){
MouseMove, 637, 206
}
else if (personaje = "sugus"){
MouseMove, 158, 219
}
else if (personaje = "default"){
gosub, clico_derecho
}
;-----
gosub, clico
;elegir mazo 2
MouseMove, 120, 129
gosub, clico
;elegir estetico numero 1
MouseMove, 577, 549
gosub, clico
;click en ready de listo char
;si es multi click en una coord
;si no es multi click en otra coord
if (single = "no"){
MouseMove, 577, 110
}
else if (single = "si"){
MouseMove, 470, 106
}
sleep 200
gosub, clico_lento
;guardo en log cuando arranca la partida
gosub, final_loop
return

soy_host:
;guardo en log cuando arranca partida
gosub, final_loop
;encontro lobby, click en begin 1/s 6 veces y espero 2 segundos
Loop 6{
	sleep 1000
	gosub, ready
}
sleep, 2000
return

definir_chap:
FileReadLine, chaps, personaje.txt, 8
Loop, parse, chaps, `,
{
	chap%A_Index% = %A_LoopField%
}
indicechap = 0
loop 5{
	tempindice := A_Index + 1
	tempchap := chap%tempindice%
	if (tempchap = ""){
				chap%tempindice% = %chap1%
			}
}
return

actualizar_chap:
indicechap += 1
if (indicechap > 6){
	indicechap = 1
}
chap := chap%indicechap%
return

chequear_chap1:
;muevo mouse a chap 1
gosub, mover_a_chap1
sleep 500
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 150, 375, 170, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap2
		}
	else
		{
		;no existe la corona en chap 1
		;seteo chap para escribir en log
		chap = 1
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap2:
;muevo mouse a chap 2
gosub, mover_a_chap2
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 210, 375, 230, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap3
		}
	else
		{
		;no existe la corona en chap 2
		;seteo chap para escribir en log
		chap = 2
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap3:
;muevo mouse a chap 3
gosub, mover_a_chap3
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 270, 375, 290, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap4
		}
	else
		{
		;no existe la corona en chap 3
		;seteo chap para escribir en log
		chap = 3
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap4:
;muevo mouse a chap 4
gosub, mover_a_chap4
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 330, 375, 350, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap5
		}
	else
		{
		;no existe la corona en chap 4
		;seteo chap para escribir en log
		chap = 4
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap5:
;muevo mouse a chap 5
gosub, mover_a_chap5
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 390, 375, 410, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap6
		}
	else
		{
		;no existe la corona en chap 5
		;seteo chap para escribir en log
		chap = 5
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap6:
;muevo mouse a chap 6
gosub, mover_a_chap6
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 350, 450, 375, 470, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap7
		}
	else
		{
		;no existe la corona en chap 6
		;seteo chap para escribir en log
		chap = 6
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap7:
;muevo mouse a chap 7
gosub, mover_a_chap7
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 742, 138, 789, 188, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap8
		}
	else
		{
		;no existe la corona en chap 6
		;seteo chap para escribir en log
		chap = 7
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap8:
;muevo mouse a chap 8
gosub, mover_a_chap8
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 746, 196, 785, 248, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap9
		}
	else
		{
		;no existe la corona en chap 8
		;seteo chap para escribir en log
		chap = 8
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap9:
;muevo mouse a chap 9
gosub, mover_a_chap9
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 746, 258, 791, 309, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap10
		}
	else
		{
		;no existe la corona en chap 9
		;seteo chap para escribir en log
		chap = 9
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap10:
;muevo mouse a chap 10
gosub, mover_a_chap10
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 746, 315, 788, 365, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap11
		}
	else
		{
		;no existe la corona en chap 10
		;seteo chap para escribir en log
		chap = 10
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap11:
;muevo mouse a chap 11
gosub, mover_a_chap11
;chequeo si existe la corona
	ImageSearch, FoundX, FoundY, 741, 379, 787, 428, *32 %nombrearchivocorona%
	if ErrorLevel = 0
		{
		;si existe la corona paso al siguiente chap
		gosub, chequear_chap12
		}
	else
		{
		;no existe la corona en chap 96
		;seteo chap para escribir en log
		chap = 10
		;selecciono el chap y salteo cinematica
		gosub, seleccionar_chap_final
		}
return

chequear_chap12:
;muevo mouse a chap 12
gosub, mover_a_chap12
gosub, clico
return

mover_a_chap1:
sleep 30
MouseMove, 220, 160
sleep 30
return

mover_a_chap2:
sleep 30
MouseMove, 220, 220
sleep 30
return

mover_a_chap3:
sleep 30
MouseMove, 220, 280
sleep 30
return

mover_a_chap4:
sleep 30
MouseMove, 220, 340
sleep 30
return

mover_a_chap5:
sleep 30
MouseMove, 220, 400
sleep 30
return

mover_a_chap6:
sleep 30
MouseMove, 220, 460
sleep 30
return

mover_a_chap7:
sleep 30
MouseMove, 518, 162
sleep 30
return

mover_a_chap8:
sleep 30
MouseMove, 518, 230
sleep 30
return

mover_a_chap9:
sleep 30
MouseMove, 518, 282
sleep 30
return

mover_a_chap10:
sleep 30
MouseMove, 518, 335
sleep 30
return

mover_a_chap11:
sleep 30
MouseMove, 518, 404
sleep 30
return

mover_a_chap12:
sleep 30
MouseMove, 518, 457
sleep 30
return


;------------------------------------------
;------rutina principal busqueda-----------
;------------------------------------------
buscar_posibles:
;inconsistencias:
;def trigereado en evento move.nocard
;def trigereado en evento move.card
;move.nocard trigereado en evento move.flecha
;move.nocard trigereado en evento move.card
;card.discard trigereado en evento move.nocard

;move.card parece solucionado


;se puede mover mouse a 320-383 y detectar boton activado para detecar unequivocamente move.card
;move.nocard activa move en coord 398 375

;solucionar evento decisivo de move.flecha, que no seleccione todas las flechas, randomizar o algo, no se

;card.cancel: c
;atq: ok
;move.nocard:
;battle: ok
;move.flecha: ok
;norma: ok (raro click despues)
;home: ok
;card.discard: ok
;def: ok
;move.card:

;usar carta despues de aceptar atacar
;buscar el tema de los target en las esquinas

;------------------------------------------------------------------------------------
;				card.cancel.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: card.cancel.png, 345, 0
	}

	;busco NC de cancel reconocimiento\card.cancel.png
	ImageSearch, FoundX, FoundY, 384, 535, 434, 571, *32 reconocimiento\card.cancel.png
	if ErrorLevel = 0
		{
		c_card_cancel := c_card_cancel + 1
		if (c_card_cancel = valor_confirmacion){
			gosub, hacer_card_cancel
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				atq.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: atq.png, 345, 0
	}

	;busco F de defende cuando ataco reconocimiento\atq.png
	ImageSearch, FoundX, FoundY, 33, 173, 77, 216, *32 reconocimiento\atq.png
	if ErrorLevel = 0
		{
		c_atq := c_atq + 1
		if (c_atq = valor_confirmacion){
			gosub, hacer_atq
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				def.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: def.png, 345, 0
	}

	;busco EN de defend cuando me atacan reconocimiento\def.png
	ImageSearch, FoundX, FoundY, 560, 173, 594, 214, *32 reconocimiento\def.png
	if ErrorLevel = 0
		{
		c_def := c_def + 1
		if (c_def = valor_confirmacion){
			gosub, hacer_def
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				battle.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: battle.png, 345, 0
	}

	;busco si tt de batalla reconocimiento\battle.png
	ImageSearch, FoundX, FoundY, 440, 129, 468, 163, *32 reconocimiento\battle.png
	if ErrorLevel = 0
		{
		c_battle := c_battle + 1
		if (c_battle = valor_confirmacion){
			gosub, hacer_battle
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				move.flecha.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: move.flecha.png, 345, 0
	}

	;busco m de move to reconocimiento\move.flecha.png
	ImageSearch, FoundX, FoundY, 421, 108, 466, 150, *32 reconocimiento\move.flecha.png
	if ErrorLevel = 0
		{
		c_move_flecha := c_move_flecha +1
		if (c_move_flecha = valor_confirmacion){
			gosub, hacer_move_flecha
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				move.flecha2.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: move.flecha2.png, 345, 0
	}

	;busco m de move to reconocimiento\move.flecha2.png
	ImageSearch, FoundX, FoundY, 421, 133, 462, 154, *32 reconocimiento\move.flecha2.png
	if ErrorLevel = 0
		{
		c_move_flecha := c_move_flecha +1
		if (c_move_flecha = valor_confirmacion){
			gosub, hacer_move_flecha
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				norma.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: norma.png, 345, 0
	}

	;busco si n de norma reconocimiento\norma.png
	ImageSearch, FoundX, FoundY, 430, 132, 463, 165, *32 reconocimiento\norma.png
	if ErrorLevel = 0
		{
		c_norma := c_norma + 1
		if (c_norma = valor_confirmacion){
			gosub, hacer_norma
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				home.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: home.png, 345, 0
	}

	;busco si h de home reconocimiento\home.png
	ImageSearch, FoundX, FoundY, 465, 119, 491, 150, *32 reconocimiento\home.png
	if ErrorLevel = 0
		{
		c_home := c_home + 1
		if (c_home = valor_confirmacion){
			gosub, hacer_home
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				card.discard.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: card.discard.png, 345, 0
	}

	;busco si di de discard card reconocimiento\card.discard.png
	ImageSearch, FoundX, FoundY, 437, 134, 472, 162, *32 reconocimiento\card.discard.png
	if ErrorLevel = 0
		{
		c_card_discard := c_card_discard + 1
		if (c_card_discard = valor_confirmacion){
			gosub, hacer_card_discard
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				move.card.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: move.card.png, 345, 0
	}

	;busco O de move reconocimiento\move.card.png
	ImageSearch, FoundX, FoundY, 305, 355, 337, 393, *32 reconocimiento\move.card.png
	if ErrorLevel = 0
		{
		c_move_card := c_move_card + 1
		if (c_move_card = valor_confirmacion){
			gosub, hacer_move_card
			return
		}
		else
		{
			;muevo el mouse para ver mejor
			gosub, correr_mouse_singleplayer
			return
		}
		}
	else
	;muevo el mouse para ver mejor
	gosub, correr_mouse_singleplayer
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

;------------------------------------------------------------------------------------
;				move.nocard.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: move.nocard.png, 345, 0
	}

	;busco OV de move reconocimiento\move.nocard.png
	ImageSearch, FoundX, FoundY, 389, 358, 417, 389, *32 reconocimiento\move.nocard.png
	if ErrorLevel = 0
		{
		c_move_nocard := c_move_nocard + 1
		if (c_move_nocard = valor_confirmacion){
			gosub, hacer_move_nocard
			return
		}
		else
		{
			return
		}
		}
	else
	gosub, chequeo_envio_click
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

return



elegir_carta:
;primeracarta 174, 316
;MouseMove, 174, 316
;gosub, clico_lento
;segundacarta 374, 326
;MouseMove, 374, 326
;gosub, clico_lento
;terceracarta 591, 335
;MouseMove, 591, 335
;gosub, clico_lento
;elijo solo carta del medio
MouseMove, 395, 311
gosub, clico_lento
;cancelacarta
gosub, correr_mouse_singleplayer
sleep 50
Click up
sleep 50
gosub, clico
sleep 50
Click up
sleep 50
gosub, clico
return

check_debug:
if (debug = "si"){
	;muestro el msgbox si esta habilitado el debug
	sleep 100
	;MouseMove, %FoundX%, %FoundY%
	sleep 100
	msgbox, Imagen = %eltooltip%`natq = %c_atq%`ncard.cancel = %c_card_cancel%`ndef = %c_def%`nbattle = %c_battle%`nmove.flecha = %c_move_flecha%`nnorma = %c_norma%`nhome = %c_home%`ncard.discard = %c_card_discard%`nmove.card = %c_move_card%`nmove.nocard = %c_move_nocard%`natq.vid.1 = %c_atq_vid_1%`ndef.vid.1 = %c_def_vid_1%`natq.atq.1 = %c_atq_atq_1%`ndef.atq.1 = %c_def_atq_1%`n
}
return

check_debug_mov:


if (debug = "mov"){
mostrar_debug := "Encontrado:`n"
mostrar_debug = %mostrar_debug%%eltooltip%`n
mostrar_debug = %mostrar_debug%_home = %c_move_panel_home%`n
mostrar_debug = %mostrar_debug%_batalla = %c_move_panel_batalla%`n
mostrar_debug = %mostrar_debug%_stars = %c_move_panel_stars%`n
mostrar_debug = %mostrar_debug%_heal = %c_move_panel_heal%`n
mostrar_debug = %mostrar_debug%_tp = %c_move_panel_tp%`n
mostrar_debug = %mostrar_debug%_card = %c_move_panel_card%`n
mostrar_debug = %mostrar_debug%_boss = %c_move_panel_boss%`n
mostrar_debug = %mostrar_debug%_drop = %c_move_panel_drop%`n
mostrar_debug = %mostrar_debug%_homef = %c_move_panel_homef%`n
mostrar_debug = %mostrar_debug%_homex = %c_move_panel_homex% - %c_move_panel_homey%`n
mostrar_debug = %mostrar_debug%_batallaf = %c_move_panel_batallaf%`n
mostrar_debug = %mostrar_debug%_batallay = %c_move_panel_batallay% - %c_move_panel_batallay%`n
mostrar_debug = %mostrar_debug%_starsf = %c_move_panel_starsf%`n
mostrar_debug = %mostrar_debug%_starsx = %c_move_panel_starsx% - %c_move_panel_starsy%`n
mostrar_debug = %mostrar_debug%_healf = %c_move_panel_healf%`n
mostrar_debug = %mostrar_debug%_healx = %c_move_panel_healx% - %c_move_panel_healy%`n
mostrar_debug = %mostrar_debug%_tpf = %c_move_panel_tpf%`n
mostrar_debug = %mostrar_debug%_tpx = %c_move_panel_tpx% - %c_move_panel_tpy%`n
mostrar_debug = %mostrar_debug%_cardf = %c_move_panel_cardf%`n
mostrar_debug = %mostrar_debug%_cardx-y = %c_move_panel_cardx% - %c_move_panel_cardy%`n
mostrar_debug = %mostrar_debug%_bossf = %c_move_panel_bossf%`n
mostrar_debug = %mostrar_debug%_bossx-y = %c_move_panel_bossx% - %c_move_panel_bossy%`n
mostrar_debug = %mostrar_debug%_dropf = %c_move_panel_dropf%`n
mostrar_debug = %mostrar_debug%_dropx-y = %c_move_panel_dropx% - %c_move_panel_dropy%`n
mostrar_debug = %mostrar_debug%Posicion act: %FoundX% - %FoundY%`n

	;muestro el msgbox si esta habilitado el debug
	sleep 100
	;MouseMove, %FoundX%, %FoundY%
	sleep 100
	msgbox, %mostrar_debug%
}
return










limpiar_contadores:
c_card_cancel := 0
c_atq := 0
c_def := 0
c_battle := 0
c_move_flecha := 0
c_norma := 0
c_home := 0
c_card_discard := 0
c_move_card := 0
c_move_nocard := 0
c_atq_vid_1 := 0
c_def_vid_1 := 0
c_atq_atq_1 := 0
c_def_atq_1 := 0
return

limpiar_contadores_move:
c_move_panel_home := 0
c_move_panel_homex := 0
c_move_panel_homey := 0
c_move_panel_homef := 0
c_move_panel_batalla := 0
c_move_panel_batallax := 0
c_move_panel_batallay := 0
c_move_panel_batallaf := 0
c_move_panel_stars := 0
c_move_panel_starsx := 0
c_move_panel_starsy := 0
c_move_panel_starsf := 0
c_move_panel_heal := 0
c_move_panel_healx := 0
c_move_panel_healy := 0
c_move_panel_healf := 0
c_move_panel_tp := 0
c_move_panel_tpx := 0
c_move_panel_tpy := 0
c_move_panel_tpf := 0
c_move_panel_card := 0
c_move_panel_cardx := 0
c_move_panel_cardy := 0
c_move_panel_cardf := 0
c_move_panel_boss := 0
c_move_panel_bossx := 0
c_move_panel_bossy := 0
c_move_panel_bossf := 0
c_move_panel_drop := 0
c_move_panel_dropx := 0
c_move_panel_dropy := 0
c_move_panel_dropf := 0
FoundX := 0
FoundY := 0
return

move_por_imagen:
;cuando no encuentro panel a encontrara elijo random
;arriba derecha   484, 229
MouseMove, 484, 229
gosub, clico_lento
;abajo derecha    484, 329
MouseMove, 484, 329
gosub, clico_lento
;arriba izquierda 315, 240
MouseMove, 315, 240
gosub, clico_lento
;abajo izquierda  329, 358
MouseMove, 329, 358
gosub, clico_lento
return

















hacer_move_panel_decision:
;limpio contadores de move
gosub, limpiar_contadores_move
;corro mouse para que no joda
gosub, correr_mouse_singleplayer
;click del medio para centrar y alejo el foco
gosub, boton_central_alejar_foco
sleep 600
;busco paneles
gosub, buscar_home_00
gosub, buscar_batalla_00
gosub, buscar_stars_00
gosub, buscar_heal_00
gosub, buscar_tp_00
gosub, buscar_card_00
gosub, buscar_boss_00
gosub, buscar_drop_00



;saco foto para debug
if (enable_captura_debug = "si"){
	gosub, captura_debug
}

/* 
total_move_encontrado := 0
;busco 5 veces las imagenes, no me gusta
loop 5 {
	if (total_move_encontrado != 0)
	{
	break
	}
	else
	{
	gosub, buscar_home_00
	gosub, buscar_batalla_00
	gosub, buscar_stars_00
	gosub, buscar_heal_00
	gosub, buscar_tp_00
	gosub, buscar_card_00
	gosub, buscar_boss_00
	gosub, buscar_drop_00
	total_move_encontrado := c_move_panel_home + c_move_panel_batalla + c_move_panel_stars + c_move_panel_heal + c_move_panel_tp + c_move_panel_card + c_move_panel_boss + c_move_panel_drop
	}
}
*/

;testeo si encontro mas de 1 move
;total_move_encontrado := 0
;total_move_encontrado := c_move_panel_home + c_move_panel_batalla + c_move_panel_stars + c_move_panel_heal + c_move_panel_tp + c_move_panel_card + c_move_panel_boss + c_move_panel_drop


if (c_move_panel_home = 1)
	{
	eltooltip := "c_move_panel_home"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_homex
	FoundY := c_move_panel_homey
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else if (c_move_panel_batalla = 1)
	{
	eltooltip := "c_move_panel_batalla"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_batallax
	FoundY := c_move_panel_batallay
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else if (c_move_panel_stars = 1)
	{
	eltooltip := "c_move_panel_stars"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_starsx
	FoundY := c_move_panel_starsy
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else if (c_move_panel_heal = 1)
	{
	eltooltip := "c_move_panel_heal"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_healx
	FoundY := c_move_panel_healy
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else if (c_move_panel_tp = 1)
	{
	eltooltip := "c_move_panel_tp"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_tpx
	FoundY := c_move_panel_tpy
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else if (c_move_panel_card = 1)
	{
	eltooltip := "c_move_panel_card"
	;piso el %FoundX%, %FoundY% con el actual
	FoundX := c_move_panel_cardx
	FoundY := c_move_panel_cardy
	;si encuentra click donde defino
	gosub, clico_move_panel
	}
	else
	{
	eltooltip := "no lo encuentro, arreglalo"
	gosub, check_debug_mov
	gosub, move_por_imagen
	FoundX := 0
	FoundY := 0
	}
return



return





;aca estaba la parte que buscaba todos los paneles, cambiado por include al principio



















;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------
;acciones en busqueda de imagenes confirmadas
;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

hacer_card_cancel:
		eltooltip := "card.cancel.png"
		gosub, check_debug
		;existe card.cancel usar carta y salir
		MouseMove, 394, 274
		sleep 50
		gosub, clico_lento
		sleep 300
		;clico cancel carta por las dudas
		MouseMove, 464, 562
		sleep 50
		gosub, clico_lento
		sleep 50
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_atq:
		eltooltip := "atq.png"
		;chequeo si existe vida1
		gosub, buscar_atq_vid_1
return

hacer_def:
		eltooltip := "def.png"
		;chequeo si existe vida1
		gosub, buscar_def_vid_1
return

hacer_move_nocard:
		eltooltip := "move.nocard.png"
		gosub, check_debug
		;existe solo move, hago click move
		;414, 415
		MouseMove, 414, 415
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_battle:
		eltooltip := "battle.png"
		gosub, check_debug
		;existe doble t
		if (atacar_siempre = "si"){
			sleep 70
			;pongo si en atacar
			;si ataco 260, 380
			MouseMove, 260, 380
		}
		else
		{
			sleep 70
			;pongo no en atacar
			;no ataco 544, 394
			MouseMove, 544, 394
		}
		sleep 100
		gosub, clico_lento
		sleep 500
		;clico carta de ataque si tengo
		MouseMove, 394, 274
		sleep 30
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_move_flecha:
		;confirmar
		eltooltip := "move.flecha.png"
		;existe m de move
		gosub, hacer_move_panel_decision
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_norma:
		eltooltip := "norma.png"
		gosub, check_debug
		;existe n
		;stars 270, 221
		;wins 254, 303
		sleep 30
		MouseMove, 270, 221
		sleep 50
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_home:
		eltooltip := "home.png"
		gosub, check_debug
		;existe home
		;si 307, 389
		;no 502, 383
		MouseMove, 307, 389
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_card_discard:
		eltooltip := "card.discard.png"
		gosub, check_debug
		;existe discard card
		;descarto del medio 410, 330
		MouseMove, 410, 330
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
return

hacer_move_card:
		eltooltip := "move.card.png"
		gosub, check_debug
		if (usocartas = "si"){
			;pasa si esta en usar cartas
			;click en card 493, 383
			MouseMove, 493, 383
			sleep 30
			gosub, clico_lento
			sleep 30
			;seleccion carta derecha 507, 337
			MouseMove, 507, 337
			sleep 50
			gosub, clico_lento
			sleep 50
			;seleccion carta izq 296, 330
			MouseMove, 296, 330
			sleep 50
			gosub, clico_lento
			sleep 50
			;cancelo si no la puede usar
			MouseMove, 464, 562
			sleep 50
			gosub, clico_lento
			sleep 50
			sleep 70
			gosub, clico_lento
			sleep 70
			;espero a que termine animacion de usar carta
			sleep 1500
			;cliqueo en move para seguir 346, 361
			MouseMove, 346, 361
			sleep 120
			gosub, clico_lento
			sleep 70
			;confirmada accion, limpio contadores
			gosub, limpiar_contadores
			return
		}
		else {
			;pasa si esta en no usar cartas
			;click en move 330, 368
			MouseMove, 330, 368
			gosub, clico_lento
			sleep 100
			;envio otro click para el lanzado de dados
			MouseMove, 330, 368
			gosub, clico_lento
			;confirmada accion, limpio contadores
			gosub, limpiar_contadores
			return
		}
return





buscar_atq_vid_1:

;------------------------------------------------------------------------------------
;				atq.vid.1.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: atq.vid.1.png, 345, 0
	}

	;busco 1 de vida en atq reconocimiento\atq.vid.1.png
	ImageSearch, FoundX, FoundY, 9, 432, 66, 504, *32 reconocimiento\atq.vid.1.png
	if ErrorLevel = 0
		{
		c_atq_vid_1 := c_atq_vid_1 + 1
		;encontre atq.vid.1
		gosub, atq_eva
		return
		}
		else
		{
		;no hay 1 de vid, chequeo si ataca por 1
		gosub, buscar_atq_atq_1
		return
		}
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

return


buscar_def_vid_1:

;------------------------------------------------------------------------------------
;				def.vid.1.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: def.vid.1.png, 345, 0
	}

	;busco 1 de vida en def reconocimiento\def.vid.1.png
	ImageSearch, FoundX, FoundY, 738, 432, 795, 504, *32 reconocimiento\def.vid.1.png
	if ErrorLevel = 0
		{
		c_def_vid_1 := c_def_vid_1 + 1
		;encontre def.vid.1
		;clico evade
		gosub, def_eva
		return
		}
		else
		{
		;no hay 1 de vid, defiendo
		gosub, def_def
		return
		}
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

return

buscar_atq_atq_1:

;------------------------------------------------------------------------------------
;				atq.atq.1.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: atq.atq.1.png, 345, 0
	}

	;busco 1 de atq en atq reconocimiento\atq.atq.1.png
	ImageSearch, FoundX, FoundY, 496, 272, 564, 353, *32 reconocimiento\atq.atq.1.png
	if ErrorLevel = 0
		{
		c_atq_atq_1 := c_atq_atq_1 + 1
		;encontre atq.atq.1
		gosub, atq_eva
		return
		}
		else
		{
		;no hay 1 de atq, defiendo
		gosub, atq_def
		return
		}
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

return

buscar_def_atq_1:

;------------------------------------------------------------------------------------
;				def.atq.1.png
;------------------------------------------------------------------------------------
	if (debug = "si"){
		ToolTip, busquedas: def.atq.1.png, 345, 0
	}

	;busco 1 de vida en atq reconocimiento\atq.atq.1.png
	ImageSearch, FoundX, FoundY, 9, 432, 66, 504, *32 reconocimiento\def.atq.1.png
	if ErrorLevel = 0
		{
		c_def_atq_1 := c_def_atq_1 + 1
		;encontre def.atq.1
		gosub, atq_eva
		return
		}
		else
		{
		;no hay 1 de vid, defiendo
		gosub, atq_def
		return
		}
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////

return























atq_eva:
		;clico evade
		;eva 222, 189
		MouseMove, 230, 195
		sleep 100
		gosub, check_debug
		gosub, clico_lento
		sleep 100
		;envio otro click en defend para el lanzado de dados
		MouseMove, 64, 195
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
		gosub, chequeo_envio_click
return

atq_def:
		;click en def: 68, 203
		MouseMove, 68, 203
		sleep 100
		gosub, check_debug
		gosub, clico_lento
		sleep 100
		;envio otro click para el lanzado de dados
		MouseMove, 68, 203
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
		gosub, chequeo_envio_click
return

def_eva:
		;evadir 720, 201
		MouseMove, 720, 201
		sleep 100
		gosub, check_debug
		gosub, clico_lento
		sleep 100
		;envio otro click para el lanzado de dados
		MouseMove, 564, 204
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
		gosub, chequeo_envio_click
return

def_def:
		;defender 564, 204
		MouseMove, 564, 204
		sleep 100
		gosub, check_debug
		gosub, clico_lento
		sleep 100
		;envio otro click para el lanzado de dados
		MouseMove, 564, 204
		gosub, clico_lento
		;confirmada accion, limpio contadores
		gosub, limpiar_contadores
		gosub, chequeo_envio_click
return





captura_debug:
indice_encontrado := "coso_"

if (c_move_panel_home > 0){
	indice_encontrado = %indice_encontrado%home_
	}
if (c_move_panel_batalla > 0){
	indice_encontrado = %indice_encontrado%pelea_
	}
if (c_move_panel_stars > 0){
	indice_encontrado = %indice_encontrado%stars_
	}
if (c_move_panel_heal > 0){
	indice_encontrado = %indice_encontrado%heal_
	}
if (c_move_panel_tp > 0){
	indice_encontrado = %indice_encontrado%tp_
	}
if (c_move_panel_card > 0){
	indice_encontrado = %indice_encontrado%card_
	}
if (c_move_panel_boss > 0){
	indice_encontrado = %indice_encontrado%boss_
	}
if (c_move_panel_drop > 0){
	indice_encontrado = %indice_encontrado%drop_
	}

;captura debug
screenshot1=C:\Program Files\IrfanView\i_view64.exe
screenshots=C:\Users\Morpheus\Desktop\tunel\bot\800x600\reconocimiento\debug_screen
runwait, "%screenshot1%" "/capture=0 /convert=%screenshots%\%indice_encontrado%%A_now%.png"
return

check_escribir_panel_log:
;escribo nombre de imagen encontrada si esta habilitado log
if (enable_panel_log = "si"){
	FileAppend, %move_panel_panel_objetivo%`n, panel_encontrado.txt
}
return








;-------------------------
;rutinas varias

chequeo_envio_click:
	if (click_entre_busquedas = "si"){
		gosub, clico
	}
return

posicionar_nueva_busqueda:
;hago foco y me alejo
gosub, boton_central
;posiciono mouse para que no moleste con deteccion
gosub, correr_mouse_singleplayer
sleep 30
gosub, clico_lento
return























;main bot play
;-------------------------------------------
main_bot:
	gosub, chequeo_no_lobby
	sleep 30
	gosub, bolita_mouse
	sleep 30
	Click up
	sleep 50
	gosub, cancel2
	sleep 50
	Click up
	gosub, moverse12
	Click up
	sleep 50
	gosub, cancel2
	sleep 50
	Click up
	Click up
	gosub, moverse13
	Click up
	Click up
	sleep 50
	gosub, cancel2
	sleep 50
	Click up
	Click up
	gosub, moverse14
	Click up
	gosub, bolita_mouse
	gosub, foco
	gosub, moverse12
	Click up
	gosub, bolita_mouse
	gosub, clico
	Click up
	gosub, bolita_mouse
	gosub, foco
	gosub, arriba_izq
	Click up
	gosub, bolita_mouse
	gosub, foco
	gosub, arriba_der
	Click up
	gosub, bolita_mouse
	gosub, foco
	gosub, abajo_izq
	Click up
	gosub, bolita_mouse
	gosub, foco
	gosub, abajo_der
	Click up
	gosub, bolita_mouse
	sleep 30
	gosub, yes
	Click up
	gosub, bolita_mouse
	gosub, clico
	Click up
	gosub, bolita_mouse
	sleep 30
	gosub, elejir_estrella
	Click up
	gosub, bolita_mouse
	gosub, clico
	Click up
	gosub, bolita_mouse
	sleep 30
	gosub, defender
	Click up
	gosub, bolita_mouse
	gosub, clico
	Click up
	gosub, bolita_mouse
	sleep 30
	gosub, atq_defender
	Click up
	gosub, bolita_mouse
	sleep 30
	Click up
	gosub, clico
	Click up
	sleep 30
	gosub, seleccionar_target
	sleep 30
	Click up
	sleep 30
	gosub, back_2.9.1
	sleep 30
	click up
	sleep 30
	gosub, seleccionar_target_arriba_derecha
	sleep 30
	gosub, seleccionar_target_arriba_izquierda
	sleep 30
	gosub, seleccionar_target_abajo_derecha
	sleep 30
	gosub, seleccionar_target_abajo_izquierda
	sleep 30
return








;si existe lobby y no existe archivo clico en ready y creo archivo
chequeo_si_lobby:
if FileExist("lobby_ready.txt")
{
	;significa que ya hizo click en ready
	return
}
else
{
	;significa que no hizo click en ready
	FileAppend,, lobby_ready.txt
	;espero 7000 para darle chance a que esten todos ready despues de partida
	sleep 7000
	gosub, ready
	sleep 7000
	return
}
return


;si existe lobby y existe el archivo lo elimino
chequeo_no_lobby:
if FileExist("lobby_ready.txt")
{
	FileDelete, lobby_ready.txt
	return
}
else
{
	return
}
return


;control
;cerrar----------------------------------
^+x::
send {LControl up}
send {LShift up}
Click up
send {MButton up}
exitapp

x::
send {LControl up}
send {LShift up}
Click up
send {MButton up}
exitapp

;restartear------------------------------
r::
sleep 50
send {r up}
sleep 50
send {LControl up}
sleep 50
send {LShift up}
sleep 50
Click up
sleep 50
send {MButton up}
sleep 50
reload

^+R::
sleep 50
send {R up}
sleep 50
send {LControl up}
sleep 50
send {LShift up}
sleep 50
Click up
sleep 50
send {MButton up}
sleep 50
reload
return

p::
gosub, chequeo_no_lobby
return

;posicion mouse--------------------------
z::
MouseGetPos, xpos, ypos 
msgbox %xpos% - %ypos%
return
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

q::
single := "no"
sufijo := "coop"
;cliente
Loop {
	gosub, correr_mouse
	gosub, clico
	Click up
	gosub, buscar_espectador
	gosub, buscar_lobby
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
sleep 50
Click down
sleep 50
Click up
sleep 50
return

clico_derecho:
sleep 50
Click down r
sleep 50
Click up r
sleep 50
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
	ImageSearch, FoundX, FoundY, 403, 12, 438, 35, *32 singleply800.png
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
;selecciono el chap y salteo cinematica
gosub, seleccionar_chap_final
;aca deberia elegir char y mazo y esas cosas
;vuelvo y hago un chequeo de imagen para elegir char
return

seleccionar_chap_final:
;click en el chap donde estoy parado
gosub, clico
sleep 1700
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
MouseMove, 417, 398
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
MouseMove, 475, 549
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
gosub, clico
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
MouseMove, 220, 520
sleep 30
return



















;main bot play
;-------------------------------------------
main_bot:
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

;posicion mouse--------------------------
z::
MouseGetPos, xpos, ypos 
msgbox %xpos% - %ypos%
return

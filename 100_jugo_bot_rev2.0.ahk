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

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Mouse, Client
CoordMode, Pixel, Client
#SingleInstance force

q::
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
;busca letras player para ver si estoy listo para iniciar main bot
;800
	ImageSearch, FoundX, FoundY, 178, 0, 235, 37, *32 player800.png
	if ErrorLevel = 0
		{
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

correr_mouse:
;corro mouse para que no me tape la vista
;800
MouseMove, 22, 238
return

elegir_char:
;elegir char y luego cartas
;800
;click en char traer menu para elejir chars
MouseMove, 658, 422
gosub, clico
;elegir chifu
MouseMove, 119, 262
gosub, clico
;elegir mazo 2
MouseMove, 120, 129
gosub, clico
;elegir estetico numero 1
MouseMove, 577, 549
gosub, clico
;click en ready de listo char
MouseMove, 577, 110
gosub, clico
return

soy_host:
;encontro lobby, click en begin 1/s 6 veces y espero 2 segundos
Loop 6{
	sleep 1000
	gosub, ready
}
sleep, 2000
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
send {LControl up}
send {LShift up}
Click up
send {MButton up}
reload

^+r::
send {LControl up}
send {LShift up}
Click up
send {MButton up}
return

;posicion mouse--------------------------
z::
MouseGetPos, xpos, ypos 
msgbox %xpos% - %ypos%
return
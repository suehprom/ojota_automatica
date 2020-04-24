# ojota_automatica
automatizacion del ojota con server y client

no voy a explicar con detalles para que no salga en ningun crawl bot

pantalla 800*600

q: corre instancia como cliente (adentro de lobby, cualquier instancia, seleccionar carta o poner ready o en medio de partida)

w: corre instancia como servidor hosteando (intenta ready, en partida acepta cualquier que se quiera unir)

e: corre instancia como singleplayer para misiones basado en opciones del archivo personaje.txt

z: devuelve posicion del mouse

r: restartea el programa

x: cierra el programa

---

personaje.txt:

archivo definicion de parametros, linea entre corchetes parametros aceptados, siguiente linea parametro
L1-L2:[sugus, qp, manager, chifu, yuki, starbo, default ] char seleccionables para jugar la partida, default deja el que viene por defecto en la mision singleplayer o deja el ultimo seleccionado en coop/multi

L3-L4:[qp-suguri-extra-kai-girlpower-marc-starbo-sweetbo-algochristmases-oldguardian] mision seleccionable en modo single player

L5-L6:[casual-normal-original-extreme] modo de dificultad de la mision single player

L7-L8:[chap 1-2-3-4-5-6-7(back)] seleccionar chap manual, 6 parametros, ejemplo 1,2,3,4,5,6, hara primero chap 1, luego chap 2, luego chap 3, hasta chap 6 donde repetira del comienzo, repetido el 1 puesto si no se definen los otros, ejemplo 2,5,3, hara los chapter en este orden 2,5,3,2,2,2 y repetira, si se pone un solo chap hara ese chap ad infinitum

L9-L10:[simple-auto] define avance de chaps, en simple seguira los chap seleccionados en L8, en auto en base a la dificultad (solo original o extreme) chequeara en base a la mision que chap falta por ganar, ira avanzando hasta limpiar todos los chap, con el personaje seleccionado en la campaña seleccionada en la dificultad seleccionada

notas de version:

2020-04-24: agregado mision automatica para modos original y extremo, cicla respectivamente las misiones no completadas de esa campaña en esa dificultad, actualizacion busqueda de imagenes mas consistente

2020-04-23: agregada subrutina solo singleplayer para desbloquear misiones, basado en archivo personaje.txt, agregado escritura de log a finalizar partida para control interno, cambios QoL, agregado opciones de multiples misiones en solo

2020-04-21: actualizado player800.png para matchear cambio de version a 2.9.1, actualizado rutinas de chequeo de imagenes, agregada nueva subrutina para fixear nuevo modo de juego, seleccion de cambio de personaje mas accesible

2020-03-23: actualizado player800.png para matchear cambio de version a 2.8.2

2020-03-23: creado repositorio

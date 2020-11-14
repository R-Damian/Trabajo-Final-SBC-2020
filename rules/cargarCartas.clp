;como es la menos especifica va a ser siempre la ultima en ejecutarse
(defrule borrarCarta
?Carta <- (Carta)
=>
(retract ?Carta))


(defrule siHayMasCartasDeOtrosJugadores
?HayMasCartasDeOtrosJugadores <- (HayMasCartasDeOtrosJugadores (valor si))
=>
(printout t "Ingrese el valor de la carta en la mesa que no sea suya" crlf)
(bind ?valorCarta (read))
(assert (Carta (valor ?valorCarta)))
(printout t "¿Quedan mas cartas de otros jugadores? si o no" crlf)
(bind ?respuesta (read))
(assert (HayMasCartasDeOtrosJugadores (valor ?respuesta)))
(retract ?HayMasCartasDeOtrosJugadores))




(defrule noHayMasCartasDeOtrosJugadores
?HayMasCartasDeOtrosJugadores <- (HayMasCartasDeOtrosJugadores (valor no))
=>
(assert (Mano (ases 0)(puntaje 0)))
(printout t "Ingrese su primera carta" crlf)
(bind ?valorCarta (read))
(assert (Carta (valor ?valorCarta)(enMano si)))
(printout t "Ingrese su segunda carta" crlf)
(bind ?valorCarta (read))
(assert (Carta (valor ?valorCarta)(enMano si)))
(retract ?HayMasCartasDeOtrosJugadores))



(defrule seguirPidiendo
(Mano (puntaje ?puntaje))
(test (< ?puntaje 17))
(not (Carta))
=>
(printout t "Pida otra carta" crlf)
(bind ?valorCarta (read))
(assert (Carta (valor ?valorCarta)(enMano si))))


(defrule cargaCartaDeLaBanca
?LaBancaEstaJugando <- (LaBancaEstaJugando (valor si))
=>
(retract ?LaBancaEstaJugando)
(printout t "Ingrese la carta de la banca" crlf)
(bind ?valorCarta (read))
(assert (Carta (valor ?valorCarta)))
(printout t "¿la banca sigue jugando? si o no" crlf)
(bind ?respuesta (read))
(assert (LaBancaEstaJugando (valor ?respuesta))))


(defrule laBancaSePlanto
?LaBancaEstaJugando <- (LaBancaEstaJugando (valor no))
=>
(retract ?LaBancaEstaJugando)
(printout t "¿jugar otra ronda? si o no" crlf)
(bind ?respuesta (read))
(assert (Ronda (jugar ?respuesta))))




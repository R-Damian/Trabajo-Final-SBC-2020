(defrule nuevaCartaComunEnMano
(Carta (valor ?valor)(enMano si))
(test (neq ?valor 1))
=>
(assert (NuevaCartaEnMano (valor ?valor))))


(defrule nuevoAsEnMano
(Carta (valor 1)(enMano si))
=>
(assert (NuevaCartaEnMano (valor 11))))



(defrule actualizarManoAS
?Mano <- (Mano (ases ?ases)(puntaje ?puntaje))
?NuevaCartaEnMano <- (NuevaCartaEnMano (valor 11))
=>
(modify ?Mano (ases (+ ?ases 1))(puntaje (+ ?puntaje 11)))
(retract ?NuevaCartaEnMano))



(defrule actualizarManoCartaComun
?Mano <- (Mano (ases ?ases)(puntaje ?puntaje))
?NuevaCartaEnMano <- (NuevaCartaEnMano (valor ?valor))
=>
(modify ?Mano (puntaje (+ ?puntaje ?valor)))
(retract ?NuevaCartaEnMano))



(defrule nosPasamosConAses
?Mano <- (Mano (puntaje ?puntaje) (ases ?ases))
(test (and (> ?puntaje 21)(> ?ases 0)))
(not (Carta))
=>
(modify ?Mano (ases (- ?ases 1))(puntaje (- ?puntaje 10))))


(defrule nosPasamosSinAses
?Mano <- (Mano (puntaje ?puntaje) (ases 0))
(test (> ?puntaje 21))
(not (Carta))
=>
(retract ?Mano)
(printout t "Nos pasamos. Turno de la banca" crlf)
(assert (LaBancaEstaJugando (valor si))))



(defrule nosPlantamos
?Mano <- (Mano (puntaje ?puntaje))
(test (>= ?puntaje 17))
(not (Carta))
=>
(retract ?Mano)
(printout t "Nos plantamos. Turno de la banca" crlf)
(assert (LaBancaEstaJugando (valor si))))
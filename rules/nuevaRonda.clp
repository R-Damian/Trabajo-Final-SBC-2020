(defrule nuevaRondaSinVentaja
?Ronda <- (Ronda (jugar si))
(Juego (contadorHiLo 0))
=>
(printout t "Nueva ronda apueste normal" crlf)
(assert (HayMasCartasDeOtrosJugadores (valor si)))
(retract ?Ronda))


(defrule nuevaRondaConVentaja
?Ronda <- (Ronda (jugar si))
(Juego (contadorHiLo ?contadorHiLo))
(test (> ?contadorHiLo 0))
=>
(printout t "Nueva ronda apueste fuerte" crlf)
(assert (HayMasCartasDeOtrosJugadores (valor si)))
(retract ?Ronda))


(defrule nuevaRondaConDesventaja
?Ronda <- (Ronda (jugar si))
(Juego (contadorHiLo ?contadorHiLo))
(test (< ?contadorHiLo 0))
=>
(printout t "Nueva ronda apueste bajo" crlf)
(assert (HayMasCartasDeOtrosJugadores (valor si)))
(retract ?Ronda))



(defrule fin
?Ronda <- (Ronda (jugar no))
=>
(printout t "Fin" crlf)
(retract ?Ronda))
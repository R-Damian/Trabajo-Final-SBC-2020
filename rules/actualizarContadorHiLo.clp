(defrule nuevaCartaQueSuma
(Carta (valor ?valor))
(test (and ( >= ?valor 2)( <= ?valor 6)))
=>
(assert (CambioConteoHiLo (cantidad 1))))

(defrule nuevaCartaQueRestaFigura
(Carta (valor 10))
=>
(assert (CambioConteoHiLo (cantidad -1))))

(defrule nuevaCartaQueRestaAs
(Carta (valor 1))
=>
(assert (CambioConteoHiLo (cantidad -1))))


(defrule actualizarContadorHiLo
?CambioConteoHiLo <- (CambioConteoHiLo (cantidad ?cantidad))
?Juego <- (Juego (contadorHiLo ?contadorHiLo))
=>
(modify ?Juego (contadorHiLo (+ ?contadorHiLo ?cantidad)))
(retract ?CambioConteoHiLo))
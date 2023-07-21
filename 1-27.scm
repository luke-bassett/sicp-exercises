#lang sicp
(define (congruent? n)
  (check-congruent n (- n 1)))

(define (check-congruent n a)
  (cond ((= a 1) true)
        ((= (remainder (expt a n) n) (remainder a n)) (check-congruent n (- a 1)))
        (else false)))

(congruent? 89) ;prime 
(congruent? 561) ;not prime, but should pass (Carmichael number)
(congruent? 1105) ;Carmichael number
(congruent? 1729) ;Carmichael number
(congruent? 2465) ;Carmichael number
(congruent? 2821) ;Carmichael number
(congruent? 6601) ;Carmichael number

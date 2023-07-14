#lang sicp

; given this procedure for greatest common denominator
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
; I'll shorted remainder to 'r'

; Expand with substitution using normal order
; At each step indicate if remainder is ever evaluated.
(gcd 206 40)
(if (= 40 0)
(gcd 40 (r 206 40))
(if (= (r 206 40) 0)) ; 1 eval of r
(gcd (r 206 40) (r 40 (r 206 40)))
(if (= (r 40 (r 206 40)) 0)) ; 2 evals
(gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
(if (= (r (r 206 40) (r 40 (r 206 40))) 0)) ; 4 eval (b evals to 2)
(gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))  
(if (= (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))) 0)) ; 7 evals (b evals to 0)
(r (r 206 40) (r 40 (r 206 40))) ; 4 more evals to complete

; How many remainder steps performed?
11 if you count the ifs

; Now try with applicative order
(gcd 206 40)
(if (= 40 0))
(gcd 40 (r 206 40))
(gcd 40 6)
(if (= 6 0))
(gcd 6 (r 40 6))
(gcd 6 4)
(if (= 4 0 ))
(gcd 4 (r 6 4))
(gcd 4 2)
(if (= 2 0))
(gcd 2 (r 4 2))
(gcd 2 0)
(if = 0 0 )
2

; Remainder is performed 4 times with applicative order

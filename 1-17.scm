#lang sicp
; Suppose we have a language which does not have multiplication, but does have
; addition, double, and halve (for even ints). Design a multiplication procedure
; analogous to fast-expt that uses a logarithmic number of steps.
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))
(define (fast-mult a b) 
  (cond ((= b 1) a)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (dec b))))))

(fast-mult 3 7)
(fast-mult 2 4)
(fast-mult 2 5)
(fast-mult 7 9)
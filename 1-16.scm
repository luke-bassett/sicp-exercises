#lang sicp
; Design a procedure that evolves an iterative exponentiation process that uses
; successive squaring and uses a logrithmic number of steps.

; Iterative, meaning theta(1) space.

; Hint
; (b^(n/2))^2 = (b^2)^(n/2)
; This means b^n = (b^2)^(n/2) (use this when n is even), and we know that b^n
; = b*b^(n-1), (use this when n is odd).

; Keep track of b, n, and a, where ab^n is constant across iterations.
; Start with a=1. At the end of the process, the value of a will be the answer.

(define (sq x) (* x x))
(define (expt b n) (expt-iter b n 1))
(define (even? x) (= (remainder x 2) 0))
(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (sq b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))

; if n is even, we square b and leave a unchanged
; if n is odd, say a = a*b and leave b unchanged.

(expt 2 2) ;4
(expt 3 3) ;27
(expt 4 4) ;256
(expt 5 5) ;3125
(expt 7 7) ;823543
(expt 8 8) ;16777216
(expt 79 61)

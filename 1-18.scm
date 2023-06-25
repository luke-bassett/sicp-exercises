#lang sicp
; Make a process to multiply like 1.17 but iterative like 1.16. Must be in log
; time. 

; Take the concept of the invariant value from 1.16 and this time define the
; invariant as ab+c. When b is even double a and halve b, when it's odd, c = c+a
; and decrement b. Start c at 0. When b is 1, the answer is a + c.

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))

(define (mult a b) (mult-iter a b 0))
(define (mult-iter a b c)
    (cond ((= b 1) (+ a c))
          ((even? b) (mult-iter (* a 2) (/ b 2) c))
          (else (mult-iter a (dec b) (+ a c)))))

(mult 4 105)
(mult 3 23)
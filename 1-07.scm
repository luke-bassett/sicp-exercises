#lang sicp
(define (sqrt-iter guess x)
   (if (good-enough? guess x)  guess
       (sqrt-iter (improve guess x) x)))
    
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; modified from implementation in book to solve problem 1.7
(define (good-enough? guess x)
  (< 
  (abs (- guess (improve guess x)))
  (/ guess 100000000)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; very small numbers
(sqrt 0.00000000000001)

; very large numbers
(sqrt 7777777777777777799999999)

(sqrt 9)
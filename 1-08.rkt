; cube root
#lang racket
(define (3rt-iter guess x)
   (if (good-enough? guess x)
       guess
       (rt-iter (improve guess x) x)))
    
(define (improve guess x)
(/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (abs-delta x y)
(abs (- x y)))

(define (good-enough? guess x)
  (< 
  (abs-delta guess (improve guess x))
  (/ guess 1000000000)))

(define (curt x)
  (3rt-iter 1.0 x))

(curt 27)
(curt 8)
(curt 216)
(curt 100)
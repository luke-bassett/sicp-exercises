#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
      guess
      (iter (improve guess))))
  (lambda (x) (iter x)))

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess) 
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.0001))
  ((iterative-improve good-enough? f) first-guess))

(sqrt 9)
(fixed-point cos 1.0) ; .739

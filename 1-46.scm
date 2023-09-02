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

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) first-guess))

(sqrt 9)
(fixed-point cos 1.0) ; .739

#lang sicp

(define (compose f g) 
  (lambda (x) 
    (f (g x))))

(define (square x) (* x x))

((compose inc inc) 6) ; 8
((compose square inc) 6) ; 49

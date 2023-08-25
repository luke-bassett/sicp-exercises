#lang sicp
(define (double p)
  (lambda (x)
    (p (p x))))

((double inc) 5) ; 7
(((double double) inc) 5) ; 9
(((double (double double)) inc) 5) ; 21

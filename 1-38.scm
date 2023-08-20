#lang sicp

; a 
(define (cont-frac n d k)
  (define (recurse n d i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (recurse n d (inc i))))))
  (recurse n d 1))

(define (dterm i)
  (if (= 0 (modulo (+ i 1) 3))
    (- i (floor (/ i 3)))
    1))

(cont-frac (lambda (i) 1.) dterm 100)

#lang sicp

; calling cons with args x and y returns a procedure that takes x and y as
; arguments
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define pair (cons 2 4))
(car pair)
(cdr pair)

; substitution of cdr of pqir
; (cdr pair)
; (cdr (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) q))
; ((lambda (p q) q) x y)
; y

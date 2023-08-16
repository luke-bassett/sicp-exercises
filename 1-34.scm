#lang sicp

(define (f g)
  (g 2))

(define (square x) (* x x))
(f square)
(f (lambda (x) (* x x)))
(f (lambda (z) (* z (+ z 1))))

; What happens if we call (f f)
(f f)
; error: not a procedure
; expected a procedure that can be applied to arguments
; given:  2

; First time f will try to apply it's argument, f, to 2
; The second time, f will try to apply it's argument 2, to 2, which doesn't work
; Trace
; (f f)
; (f 2)
; (2 2)

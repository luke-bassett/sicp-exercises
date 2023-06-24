#lang sicp
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3)))))

(sine 12.15)

; How many times is p applied when (sin 12.15) is evaluated?
; (sine 12.15)
; (p (sine( 4.05))) 
; (p (p (sine (1.35))))
; (p (p (p (sine .45))))
; (p (p (p (p (sine .15)))))
; (p (p (p (p (p (sine .05))))))
; 5 times

; Order of growth in space an steps?
; Each time we triple the input angle, we get 1 more step. In other words the
; number of steps, n, is related to a by (a/3^n) < 0.1. 
; some algebra...
; a/.1 < 3^n
; log(a/.1) < nlog(3)
; (log(a) - log(.1))/log(3) < n
; 
; This reduces to log(a). This is the complexity for size and steps.

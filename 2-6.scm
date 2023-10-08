#lang sicp

(define zero 
  (lambda (f) 
    (lambda (x) x)))
; so ((zero f) x) evaluates to 
; ((lambda (x) x) x)
; x 
; this means 'zero applicatiosn of a function'

(define (add-1 n) 
  (lambda (f) 
    (lambda (x) 
      (f ((n f) x)))))
(add-1 zero)
; ((lambda (f)
;   (lambda (x)
;     (f ((zero f) x)))))

; ((lambda (f)
;   (lambda (x)
;     (f x))))
(define one (lambda (f) (lambda (x) (f x))))
; ((one f) x)
; evaluates to (f x)
; so it means 'one application of a function

;so two is
(define two (lambda (f) (lambda (x) (f (f x)))))
; ((two f) x)
; (f (f (x)))
; two applications of a function

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

; TODO
; read up on this one a lot, need to revist in a bit and make sure I get it



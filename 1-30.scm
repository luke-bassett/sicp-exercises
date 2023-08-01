#lang sicp

(define (cube x) (* x x x))

; from page 58 - the linear recursive version
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

; iterative version 
; you can tell this version is iterative because it keeps track of the result
; throughout the process, so if you knew the parameters at a give step you could
; start from there.
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

(sum cube 1 inc 4)
(sum-iter cube 1 inc 4)

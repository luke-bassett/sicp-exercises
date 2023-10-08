#lang sicp
; we just need to count the number of time we can devide evenly by 2 for 'car'
; and by 3 for 'cdr'

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

; count number of times we can divide n evenly by f
(define (count-factor n f)
  (define (iter n i)
    (if (= (modulo n f) 0)
      (iter  (/ n f) (+ i 1))
      i))
  (iter n 0))

(define (car z)
  (count-factor z 2))

(define (cdr z)
  (count-factor z 3))

(define p (cons 100 20))
(car p)
(cdr p)

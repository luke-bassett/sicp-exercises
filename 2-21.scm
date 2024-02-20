#lang sicp

; The procedure square-list takes a list of numbers as argument
; and returns a list of the squares of those numbers. Complete the
; defninitions. 

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list (cdr items)))))

(square-list (list 1 2 3))

(define (square-list2 items)
  (map square items))

(square-list2 (list 1 2 3))

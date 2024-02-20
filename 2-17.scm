#lang sicp


; Define a procedurem, last-pair, that takes a list as argument and returns
; onlythe last element 

(define (last-pair l)
  (if (null? (cdr l))
    (car l)
    (last-pair (cdr l))))

(last-pair (list 1 2 3 4 5))

#lang sicp
(define list1 (list 1 3 (list 5 7) 9))
(define list2 (list (list 7)))
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(display list1)
(newline)
(display list2)
(newline)
(display list3)
(newline)

(car (cdr (car (cdr (cdr list1)))))

(caar list2)

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list3))))))))))))
; gross

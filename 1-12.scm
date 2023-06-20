#lang sicp
(define (pascals-triangle row column)
  (cond ((or (= row 0) (= row 1)) 1)
        ((or (= column 0) (= column row)) 1)
        (else (+ 
                (pascals-triangle (dec row) (dec column)) 
                (pascals-triangle (dec row) column)
                ))))

(pascals-triangle 0 0)
;1
(pascals-triangle 1 1)
;1
(pascals-triangle 2 1)
;2
(pascals-triangle 4 0)
;1
(pascals-triangle 4 1)
;4
(pascals-triangle 4 2)
;6
(pascals-triangle 4 3)
;4
(pascals-triangle 4 4)
;1



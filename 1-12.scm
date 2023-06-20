#lang sicp
(define (pascals-triangle row column)
  (cond ((or (= row 1) (= row 2)) 1)
        ((or (= column 1) (= column row)) 1)
        (else (+ 
                (pascals-triangle (- row 1) (- column 1)) 
                (pascals-triangle (- row 1) column)
                ))))

(pascals-triangle 1 1)
;1
(pascals-triangle 2 2)
;1
(pascals-triangle 3 2)
;2
(pascals-triangle 5 3)
;6



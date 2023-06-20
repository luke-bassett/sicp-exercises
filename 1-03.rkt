#lang racket
(define (sum_of_sq_largest_two x y z) 
  (cond ((and (>= x z) (>= y z)) (+ (* x x) (* y y)))  ; z is smallest
        ((and (>= x y) (>= z y)) (+ (* x x) (* z z)))  ; y is smallest
        ((and (>= y x) (>= z x)) (+ (* y y) (* z z))))); x is smallest

(sum_of_sq_largest_two 2 2 3)

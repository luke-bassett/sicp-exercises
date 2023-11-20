#lang sicp

(define (make-center-percent c p)
  (make-interval 
    (- c (* c (* p .01))) 
    (+ c (* c (* p .01)))))

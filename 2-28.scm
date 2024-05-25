#lang sicp

(define (fringe tree)
  (define (get-leaves tree leaves)
    (if (null? tree)
      leaves
      (get-leaves (cdr tree) (append leaves (car tree)))))
  (get-leaves tree nil))

(define x (list (list 1 2) (list 3 4)))

(fringe x)

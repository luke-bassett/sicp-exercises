#lang sicp

(define (reverse l)
  (define (recurse fl rl)
    (if (null? fl)
      rl
      (recurse (cdr fl) (cons (car fl) rl))))
  (recurse l nil))

(reverse (list 1 2 3))

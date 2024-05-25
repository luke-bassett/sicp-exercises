#lang sicp

(define (reverse l)
  (define (recurse fl rl)
    (if (null? fl)
      rl
      (recurse (cdr fl) (cons (car fl) rl))))
  (recurse l nil))

(define (deep-reverse l)
  (define (recurse fl rl)
    (if (null? fl)
      rl
      (recurse (cdr fl) 
              (let ((first (car fl)))
                (cons (if (not (list? first)) 
                        first 
                        (deep-reverse first))
                      rl)))))
  (recurse l nil))

(define x (list (list 1 2) (list  3 4)))
(reverse x)
(deep-reverse x)
; recusivley check if each item in a list is a list, if it is reverse it

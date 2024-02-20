#lang sicp

(define (same-parity first . rest)
  (define (filter rest)
    (cond ((null? rest) nil)
           ((= (remainder first 2) (remainder (car rest) 2))
            (cons (car rest) (filter (cdr rest))))
           (else 
             (filter (cdr rest)))))
  (cons first (filter rest)))

(same-parity 1 2 3 4 5)
(same-parity 2 3 4 5)

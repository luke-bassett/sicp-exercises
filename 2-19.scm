#lang sicp

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else 
          (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values))
                 coin-values)))))

(define (no-more? l)
  (if (null? l)
    true
    false))

(define (except-first-denomination l)
  (cdr l))

(define (first-denomination l)
  (car l))

(define us-coins (list 50 25 10 5 1))
(cc 100 us-coins)


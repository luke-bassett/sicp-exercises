#lang sicp

; a.
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) 
              (accumulate combiner null-value term (next a) next b))))

(define (prod term a next b)
  (accumulate * 1 term a next b)) 

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (identity n) n)

(sum identity 1 inc 5) ; 15
(prod identity 1 inc 5) ; 120

; b. make it iterative
(define (acc-iter combiner null-value term a next b)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a) (combiner (term a) res))))
  (iter a null-value))

    
(define (prod-iter term a next b)
  (acc-iter * 1 term a next b)) 

(define (sum-iter term a next b)
  (acc-iter + 0 term a next b))

(sum-iter identity 1 inc 5) ; 15
(prod-iter identity 1 inc 5) ; 120



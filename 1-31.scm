#lang sicp

; a.
; define a procedure called product which is analogous to sum, i.e., finds the
; product of values of a function at points over a given range.
(define (prod term a next b)
  (if (> a b)
  1
  (* (term a)
     (prod term (next a) next b))))

; use prod to define factorial
(define (factorial n)
  (define (identity n) n)
  (prod identity 1 inc n))

(factorial 5)

;approxomate pi with Wallis function
; pi/4 = (2/3)*(4/3)*(4/5)*(6/5)*(6/7)*(8/7)...
;          0     1     2     3     4     5
; even i means (i+2/i+3)
; odd i means (i+3/i+2)

(define (wallis-pi n)
  (define (wallis-term n)
    (cond 
      ((even? n)  (/ (+ n 2.) (+ n 3)))
      (else       (/ (+ n 3.) (+ n 2)))))
  (* 4 (prod wallis-term 0 inc n)))

(wallis-pi 10)
(wallis-pi 100)
(wallis-pi 1000)
(wallis-pi 10000)
(wallis-pi 100000)

; b.
; redefine prod to be iterative rather than recursive
(define (prod-iter term a next b)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a) (* (term a) res))))
  (iter a 1))

; use prod to define factorial with prod-iter
(define (fact-iter n)
  (define (identity n) n)
  (prod-iter identity 1 inc n))
(fact-iter 5)

#lang sicp

; define filtered accumulate
(define (filtered-accumulate combiner filter null-value term a next b)
  (cond  ((> a b) null-value)
         ; if not prime, recurse without combining
         ((not (filter a)) (filtered-accumulate combiner filter null-value term (next a) next b))
         ; else combine with recurse
         (else 
           (combiner 
             (term a)
             (filtered-accumulate combiner filter null-value term (next a) next b)))))

; prime test from 1.24
(define (prime? n)
    (= n (smallest-divisor n)))
(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
    (= (remainder b a) 0))
(define (square a) (* a a))

; a. sum of squares of only prime numbers
(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + prime? 0 square a inc b))

(sum-of-squares-of-primes 5 6) ; should be 25
(sum-of-squares-of-primes 5 10) ; should be 74

; b. produce of all positive ints less than n that are relatively prime to n
; (i.e. GCD(i, n) = 1)

; from 1.20
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (rel-prime? i n)
  (= (gcd i n) 1))

(define (identity n) n)

(define (part-b n)
  (define (rel-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * rel-prime? 1 identity 1 inc n))
(part-b 5) ; 4 * 3 * 2 * 1 = 24
(part-b 6) ; 5 

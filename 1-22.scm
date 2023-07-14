#lang sicp
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))
  #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (prime? n)
  (= n (smallest-divisor n)))

; from 1-21
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a) (* a a))

; search for primes starting at n, and counting up until m primes are found.
(define (search-primes n m)
  (if (> m 0)
    (if (timed-prime-test n)
      (search-primes (+ n 1) (- m 1))
    (search-primes (+ n 1) m))))

; I configured this to only display the primes and not the other numbers tested. 

; increasing the starting point to get decent numbers
(search-primes 100000000 3) ;~30
(search-primes 1000000000 3) ;~95
(search-primes 10000000000 3) ;~315
(search-primes 100000000000 3) ;~900
; Should go up by a factor of sqrt(10) for each extra 0, looks about right


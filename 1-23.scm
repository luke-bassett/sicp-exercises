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
    (else (find-divisor n (next test-divisor)))))

(define (next n) 
  (if (= n 2) 3 (+ n 2)))

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

; This is a copy of 1-22 but using 'next' to increment the test-divisor.

; increasing the starting point to get decent numbers
(search-primes 100000000 3) ;~16 (was 30)
(search-primes 1000000000 3) ;~69 (was 95)
(search-primes 10000000000 3) ;~165 (was 315)
(search-primes 100000000000 3) ;~490 (was 900)

; This confirms the expectation that the time was reduced by about half.
; Checking other solutions shows that more rigerous testing reveals that the
; speed-up is less than 2x, more like 1.7x. This is most likely due to needing
; to check the value of n each time in the logic of 'next'.
; Should go up by a factor of sqrt(10) for each extra 0, looks about right


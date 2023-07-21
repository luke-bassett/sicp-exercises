#lang sicp
(define (timed-prime-test n)
  (define start-time (runtime))
  (if (fast-prime? n 10)
    (report-prime n (- (runtime) start-time))
  #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

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

; search for primes starting at n, and counting up until m primes are found.
(define (search-primes n m)
  (if (> m 0)
    (if (timed-prime-test n)
      (search-primes (+ n 1) (- m 1))
    (search-primes (+ n 1) m))))

; Copied 1.22, and then tidied it a bit as a starting point for 1.24.
; Now I'll add fast-prime?
(define (fast-prime? n i)
  (cond ((= i 0) true)                            ; never failed, prob prime
        ((fermat-test n) (fast-prime? n (- i 1))) ; didn't fail, try again
        (else #f)))                               ; failed, not prime

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (hack-random (- n 1)))))

(define (hack-random n)
  (if (> (- n 1) 4294967087) (random 4294967087 ) (random (- n 1))))

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent) 
         (remainder (square (expmod base (/ exponent 2) m)) m))
        (else
         (remainder (* base (expmod base (- exponent 1) m)) m))))

; 1.22 results 
; (search-primes 100000000 3) ;~30
; (search-primes 1000000000 3) ;~95
; (search-primes 10000000000 3) ;~315
; (search-primes 100000000000 3) ;~900

; 1.24 results with 10 checks
(search-primes 100000000 3) ; ~4
(search-primes 1000000000 3) ; ~6
; Scheme doesn't generate random ints over 4294967087, I'll adjust to make that
; the max
(search-primes 10000000000 3) ; ~25
(search-primes 100000000000 3) ;~29
; It's much quicker, but the rate of growth is a bit wonky. I think hack-random
; might take a bit of extra time. And the fact that I'm using 10 checks might be
; excessive. 
; Running with just 3 checks is stupid fast and seems pretty reliable. 

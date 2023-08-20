#lang sicp

(define (cont-frac n d k)
  (define (recurse n d i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (recurse n d (inc i))))))
  (recurse n d 1))

(define (tan-cf x k)
  (define (nterm i)
    (if (= i 1)
      x
      (* -1 x x)))
  (define (dterm i)
    (- (* 2 i) 1))
  (cont-frac nterm dterm k))

(tan-cf 3.14159 100) ; should be 0
(tan-cf (/ 3.14159 4) 100) ; should be 1

#lang sicp

; a 
(define (cont-frac n d k)
  (define (recurse n d i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (recurse n d (inc i))))))
  (recurse n d 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 8)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 9)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
; k = 11 gets us to 4 decimal places of accuracy


; b
(define (cont-frac-iter n d k)
  (define (iter i res)
    (if (= i 0)
      res
      (iter (dec i) (/ (n i) (+ res (d i))))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 8)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 9)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11)

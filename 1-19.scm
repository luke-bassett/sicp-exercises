#lang sicp

; a' = bq + aq + ap
; b' = bp + aq
; a" = b'q + a'q + a'p
; a" = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
; a" = bpq + aqq + bqq + aqq + apq + bpq + apq + app

; rearrange to match the starting form, because "if we apply the same
; transformation twice" which we have done, "the effect is same as using a
; single transformation of T(p', q') *of the same form*."

; In other words 

; a" = bq' + aq' + ap' = b(2pq + qq) + a(2pq + qq) + a(pp + qq) 
; so p' = p^2 + q^2 and q' = 2pq + q^2

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (even? x) (= (remainder x 2) 0))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
          (fib-iter 
            a 
            b 
            (+ (* p p) (* q q)) 
            (+ (* 2 p q) (* q q))
            (/ count 2)))
        (else 
          (fib-iter
            (+ (* b q) (* a q) (* a p))
            (+ (* b p) (* a q))
            p
            q
            (dec count)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
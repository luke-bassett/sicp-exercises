#lang sicp
; f(n) = n if n < 3, f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3.

; recursive
(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ 
          (f-recursive (- n 1))
          (* 2 (f-recursive (- n 2))) 
          (* 3 (f-recursive (- n 3)))))))

(define (run func from to)
  (cond((<= from to) 
         (display (func from))
         (newline)
         (run func (inc from) to))))

(run f-recursive 25 36)

; iterative
; what are the state variables? 
(define (f-iterative n) 
  (cond ((< n 3) n)
        (else (iter 2 1 0 (- n 2)))))

(define (iter a b c count)
  (if (= count 0)
    a
    (iter (+ a (* 2 b) (* 3 c)) a b (dec count))))

(run f-iterative 25 36)



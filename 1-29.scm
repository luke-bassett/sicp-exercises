#lang sicp

(define (cube x) (* x x x))

; from page 58
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

; from page 60
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (coeff k)
    (cond ((odd? k) 4)
          ((or (= k 0) (= k n)) 1)
          (else 2)))
  (define (term k) (* (y k) (coeff k)))
  (* (/ h 3) (sum term 0 inc n)))

(integral cube 0 1 .01)
(simpsons-integral cube 0 1.0 100)
(integral cube 0 1 .001)
(simpsons-integral cube 0 1.0 1000)

; The simpsons integral is much closer to the true answer.

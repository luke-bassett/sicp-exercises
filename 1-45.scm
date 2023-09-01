#lang sicp

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x)
    (f (g x))))


(define (repeated f n)
  (if (= n 1)
    f
    (compose (repeated f (- n 1) ) f)))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
    1.0))

(define (power b n)
  (if (= n 1)
    b
    (* b (power b (- n 1)))))

(define (n-root n x)
  (fixed-point (average-damp (lambda (y) (/ x (power y (- n 1)))))
    1.0))

(define (n-root-m-damp n m x)
  (fixed-point 
    ((repeated average-damp m) (lambda (y) (/ x (power y (- n 1)))))
    1.0))

(define (n-root-flex-damp n x)
  (fixed-point
    ((repeated average-damp (floor (log n 2)))
     (lambda (y) (/ x (power y (- n 1)))))
    1.0))

; messy experimenting
(sqrt 25)
(sqrt 26)
(n-root 3 27)
; (n-root 4 81) ; does not converge
(n-root-m-damp 4 2 81) ;converges
(n-root-m-damp 5 2 243) ;converges
(n-root-m-damp 6 2 729) ;converges
(n-root-m-damp 7 2 2187) ;converges
;(n-root-m-damp 8 2 6561) ;does not converge
(n-root-m-damp 8 3 6561) ;converges
(n-root-m-damp 9 3 19683) ;converges
(n-root-m-damp 10 3 221213123) ;converges
(n-root-m-damp 15 3 221213123) ;converges
;(n-root-m-damp 20 3 221213123) ;does not converge
; (n-root-m-damp 16 3 221213123) ;does not converge
(n-root-m-damp 16 4 221213123) ;converges
; looks like m must be at least sqrt of n, let's test
;should converge
(n-root-m-damp 24 4 23423423)
;shouldn't converge
(n-root-m-damp 25 4 23423423) ;converges
; (n-root-m-damp 50 4 23423423) ; does not converge
(n-root-m-damp 30 4 23423423) ;converges
; (n-root-m-damp 35 4 23423423) ;does not converge
; (n-root-m-damp 40 4 23423423)

; so far...
; 3-root or less, 1 damp (2,3)
; 4-root to 7-root, 2 damp (4,5,6,7)
; 8-root to 15-root, 3 damp (8,9,10,11,12,13,14,15)
; every doubled number of bases one new damp
; so 16-root to 31-root should need 4 damp, but 32 root should need 5

(n-root-m-damp 31 4 12345) ;converges
; (n-root-m-damp 32 4 1234235) ; does not converge
; so 1 damp for each power of two in the root
; in other words damp (floor (log base 2)) times

(n-root-flex-damp 32 1234234)
(n-root-flex-damp 4 81)

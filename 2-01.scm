#lang sicp

; Only make-rat will be modified from what's given in the book.
; Make it so make-rat can handle negative input(s).

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


(define (make-rat n d) 
  (let ((make-pos (lambda (x) (if (> x 0) x (* -1 x))))
        (g (gcd n d))
        (sign (if (or (and (> n 0) (< d 0))
                   (and (< n 0) (> d 0)))
             -1
             1)))
    (cons (* sign (/ n g)) (make-pos (/ d g)))))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third))
(print-rat (make-rat  9 6))
(print-rat (make-rat  -9 -6))
(print-rat (make-rat  9 -6))
(print-rat (make-rat  -9 6))

#lang sicp

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment s)
  (make-point 
    (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2.)
    (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2.)))


(print-point (make-point 2 2))
(print-point (start-segment (make-segment (make-point 2 2) (make-point 3 3))))
(print-point (end-segment (make-segment (make-point 2 2) (make-point 3 3))))
(print-point (midpoint-segment (make-segment (make-point 2 2) (make-point 3 3))))

(define p1 (make-point -2 4))
(define p2 (make-point 1 20))
(define s1 (make-segment p1 p2))
(print-point (midpoint-segment s1))

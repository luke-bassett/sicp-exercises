#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (crosses-zero? i)
  (let ((a (lower-bound i))
        (b (upper-bound i)))
    (if
      (or 
        (= a 0)
        (= b 0)
        (and (< a 0) (> b 0))
        (and (> a 0) (< b 0)))
      #t #f)))

(define (div-interval x y)
  (if (crosses-zero? y) (error "denominator includes zero"))
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

(define x (make-interval 1 2))
(define y (make-interval 0 1))
(div-interval x x)
(div-interval x y)

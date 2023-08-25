#lang sicp

(define tolerance 0.0001)

; from the book
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
            (else
              (display next)
              (newline)
              (try next)))))
  (try first-guess))

(define dx 0.0001)

(define (deriv g)
  (lambda (x) 
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess) 
  (fixed-point (newtons-transform g) guess))

; define cubic so it can be used with newtons method
(define (cubic a b c)
  (lambda (x)
    (+ (cube x) (* a (square x)) (* b x) c)))

(define (cube x) (* x x x))
(define (square x) (* x x))

(newtons-method (cubic 1 1 1) 1.0) ; should be -1


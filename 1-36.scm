#lang sicp

(define tolerance 0.0001)


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

; without average damping
(display "without average damping")
(newline)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 3)

; with average damping
(display "with average damping")
(newline)
(define (average x y) (/ (+ x y) 2))
(fixed-point
  (lambda (x) (average x (/ (log 1000) (log x))))
  3)

; average damping requires far fewer steps

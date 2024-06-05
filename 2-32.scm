#lang sicp

(define (subset s)
  (if (null? s)
    (list nil)
    (let ((rest (subset (cdr s))))
      (append rest (map (lambda (elem) (cons (car s) elem))
                     rest)))))

(subset (list 1 2 3))
; I looked up the solution to this one and it is still tricky to understand. I
; feel like I'm right on the verge of really getting it. -- REVISIT

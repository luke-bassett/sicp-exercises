#lang sicp

(define (subset s)
  (if (null? s)
    (list nil)
    (let ((rest (subset (cdr s))))
      (append rest (map (lambda (elem) (cons (car s) elem))
                     rest)))))

(subset (list 1 2 3))
; this one still bends my mind -- revisit

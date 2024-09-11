#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x rest-len) (+ 1 rest-len)) 0 sequence))


; test
(define (square x)
  (* x x))
(map square (list 2 3 4))
(map (lambda (x) (* 3 x)) (list 2 3 4))

(append (list 1 2) (list 69 420))

(length (list 1 1 1))

#lang sicp

(define (make-mobile left right)
  (list left right))

; structure can be either a scalar weight or a mobile
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight structure)
  (cond ((null? structure) 0)
        ((not (pair? structure)) structure)
        (else (+ (total-weight (branch-structure (left-branch structure)))
                 (total-weight (branch-structure (right-branch structure)))))))

(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? structure)
  (cond ((not (pair? structure)) #t)
        ((= (torque (left-branch structure)) (torque (right-branch structure))) #t)
        (else #f)))


(define b1 (make-branch 2 3))
(define b2 (make-branch 1 6))
(define m1 (make-mobile b1 b2))
(define b3 (make-branch 1 m1))
(define m2 (make-mobile b3 b3))
(define b4 (make-branch 1 7))
(define m3 (make-mobile b2 b4)) ; unbalanced

(total-weight m1)
(total-weight m2)

(balanced? m1)
(balanced? m3)

; part d: you would need to rewrite right-branch and branch-structure 

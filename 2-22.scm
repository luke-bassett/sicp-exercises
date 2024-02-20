#lang sicp

(define (square x) (* x x))

; why does this procedure reverse the squared list?
(define (square-list items) 
  (define (iter things answer)
    (if (null? things) 
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
(iter items nil))

(square-list (list 1 2 3))  ;(9 4 1)

; iter items and nil, things aren't null so we iter the cdr of things and a new list answer which is the cons of square of car of things and answer. So for each iter we add the square of the most recently in front value to the front of the list. The last value will be the final one to be 'most recently in front'.

; Swapping the args to cons doesn't work either, why?
(define (square-list items) 
  (define (iter things answer)
    (if (null? things) 
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
(iter items nil))

; because this calls iter with the remaining things as things, and an list answer is consed onto the squared value.



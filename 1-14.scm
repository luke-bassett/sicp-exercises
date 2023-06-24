#lang sicp

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
           (cc (- amount (first-denomination kinds-of-coins))
               kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 5)
(count-change 10)
(count-change 11)
(count-change 100)

; (count-change 11)
; (cc 11 5)
; (+ (cc 11 4) (cc -39 5))
; ...
; 
; drawing a "tree" all the instaces of (cc amount kinds-of-coins) by listing only the operands
; (11 5)
; (11 4) (-39 5)
; (11 3) (-14 4)
; (11 2) (1 3)                                         
; (11 1) (6 2) (1 2) (-9 3)
; (11 0) (10 1) (6 1) (1 2) (1 1) (-4 2)
; (10 0) (9 1) (6 0) (5 1) (1 1) (-4 2) (1 0) (0 1)    + 1
; (9 0) (8 1) (5 0) (4 1) (1 0) (0 1)                  + 1
; (8 0) (7 1) (4 0) (3 1)
; (7 0) (6 1) (3 0) (2 1)
; (6 0) (5 1) (2 0) (1 1)
; (5 0) (4 1) (1 0) (0 1)                              + 1
; (4 0) (3 1)
; (3 0) (2 1) 
; (2 0) (1 1)
; (1 0) (0 1)                                          + 1
; 

; Since it's a recursive process the order of growth for space is proportional
; to the amount, i.e., theta(n).

; If there was only one kind of coin, then we woluld have 1 step per unit of
; amount. If we add a second then there is another tree which has steps
; proportional to the amount, so then we have n^2. We can extend this to intuit
; that the time complexity is equal to n to the power of kinds-of-coins. So in
; our case theta(n^5).

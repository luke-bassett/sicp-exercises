#lang sicp
; Consider these two implementations of expmod

; A
(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent)
         (remainder (square (expmod base (/ exponent 2) m)) m))
        (else
         (remainder (* base (expmod base (- exponent 1) m)) m))))

; B 
(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent)
         (remainder (* (expmod base (/ exponent 2) m) 
                       (expmod base (/ exponent 2) m))
                     m))
        (else
         (remainder (* base (expmod base (- exponent 1) m)) m))))

; Why is B theta(n) when A is only theta(logn)?
#|
B is tree recursive, A is linear recursive. This is because for each even
exponent iteration, B calls expmod **twice** and evaluated each before
multiplying them. A just calls it once, and then squares **the result**. (This
is because scheme uses applicative order, so args are evaluated before
operators.) The process becomes theta(log(2^n)) which reduces to theta(nlog(2))
and then to theta(n).
|#

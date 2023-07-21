; It will be much slower because the intermdeiate numbers generated in fast-expt
; will be enormous. It's faster to reduce it first, this way we never have to
; deal with numbers much larger than our inputs. (See footnote 46)

; for reference
; the good way
; evaluates to the ((base^exponent) % m)
(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent)
         (remainder (square (expmod base (/ exponent 2) m)) m))
        (else
         (remainder (* base (expmod base (- exponent 1) m)) m))))

; the bad way
; Does not apply least squares **to the modulo**, but rather the whole thing
(define (expmod base exponent m)
  (remainder (fast-expt base exponent) m))

; evaluates to b^n
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; let's go through the first steps of each with (expmod 971 977 89)
; good way
; (expmod 971 977 89)
; (remainder (* 971 (expmod 971 976 89)) 89)
; ... remainders at each step, keeping the maximum number to handle much lower

; bad way
; (expmod 971 977 89)
; (remainder (fast-expt 971 977) 89)
; (remainder (<lots of multiplication before any remainder>) 89)

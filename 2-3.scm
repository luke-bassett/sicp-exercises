#lang sicp
; I'm assuming for now that the rectagles axes are prallel to the plane's axes,
; it would just be more math and error checking to allow rotated rectangles and
; I don't feel like I need to do that to get the intention of the lesson!

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

; first define area and perim procedures that should work with both
; implementations 
(define (rect-area r)
  (* (height r) (width r)))
(define (rect-perimeter r)
  (* 2 (+ (height r) (width r))))

; make rectangle with lower-left and dimensions
; NOTE: commented out so I don't get an error for redefining procedures
; (define (make-rectangle ll w h) (cons ll (cons w h)))
; (define (width r) (car (cdr r)))
; (define (height r) (cdr (cdr r)))

; (define p (make-point 1 1))
; (define w 7)
; (define h 4)
; (define r (make-rectangle p w h))
; (rect-area r)
; (rect-perimeter r)

; make rectange with lower-left and upper-right points assuming it's parallel to
; the axes of the plane b/c i'm lazy
(define (make-rectangle ll ur) (cons ll ur))
(define (width r) (- (car (cdr r)) (car (car r))))
(define (height r) (- (cdr (cdr r)) (cdr (car r))))

(define r (make-rectangle (make-point 1 1) (make-point 8 5)))
(rect-area r)
(rect-perimeter r)


(load "lib/point.scm")

(define (make-rect p1 p2)
  (cons p1 p2)
  )
(define (make-rect2 p1 width height)
  (cons p1 (make-point (+ (x-point p1) width) (+ (y-point p1) height)))
  )

(define (p1 r)
  (car r)
  )
(define (p2 r)
  (cdr r)
  )
(define (width r)
  (abs (- (x-point (p1 r)) (x-point (p2 r))))
  )

(define (height r)
  (abs (- (y-point (p1 r)) (y-point (p2 r))))
  )

(define (perimeter r)
  (* (+ (width r) (height r)) 2) 
  )

(define (area r)
  (* (width r) (height r))
  )

(define r (make-rect (make-point 1 1) (make-point 2 2)))
(perimeter r)
(area r)

(define r (make-rect2 (make-point 1 1) 1 1))
(perimeter r)
(area r)

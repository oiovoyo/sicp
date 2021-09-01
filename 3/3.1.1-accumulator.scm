(define (make-accumulator i)
  (define (add x)
    (set! i (+ i x))
    i)
  add
  )

(define (make-accumulator-l i)
  (lambda (x)
    (set! i (+ i x))
    i)
)

(define A (make-accumulator 2))
(A 1)

(define B (make-accumulator 20))
(B 3)

(define Al (make-accumulator-l 2))
(Al 1)

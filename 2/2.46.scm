(define (make-vect x y)
  (cons x y)
  )

(define (xcor-vect v)
  (cons (car v) 0)
  )

(define (ycor-vect v)
  (cons 0 (cdr v))       
  )

(define (add-vect v1 v2)
  (cons (+ (car v1) (car v2)) (+ (cdr v1) (cdr v2)))
  )

(define (sub-vect v1 v2)
  (cons (- (car v1) (car v2)) (- (cdr v1) (cdr v2)))
  )

(define (scale-vect v s)
  (cons (* (car v) s) (* (cdr v) s))
  )

(define v1 (make-vect 1 2))
(define v2 (make-vect 2 3))

(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect v1 3)

(load "lib/common.scm")
(define (iterative-improve good-enough improve)
  (define (f x guess) 
    (if (good-enough guess x)
        guess 
        (f x (improve guess x)))) 
  f
  )

(define (improve guess x)
  (average guess (/ x guess))
  )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001)
  )

((iterative-improve good-enough? improve) 10.0 2.0)


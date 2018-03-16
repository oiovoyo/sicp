(define (sqrt-iter guess x)
  ( if (good-enough? guess x)
  guess 
  (sqrt-iter (improve guess x) x)
  ))


(define (improve guess x)
  ( average guess (/ x guess)
  ))


(define (average x y)
  (/ (+ x y) 2)
  )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001)
  )

(define (square x)
 (* x x) 
  )

(square 2)

(good-enough? 1.0 4)



(define (sqrt x)
  (sqrt-iter 1.0 x)
  )

(sqrt 3)
(sqrt 30000)
(sqrt 4)
(sqrt 100)
(sqrt 0.01)
(sqrt 0.000000000001)
(sqrt 99999999999999990.000000000001)

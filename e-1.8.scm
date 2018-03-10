(define (cube-iter guess x)
  ( if (good-enough? guess x)
  guess 
  (cube-iter (improve guess x) x)
  ))


(define (improve y x)
  (/ (+ ( / x (* y y)) (* 2 y)) 3)
  )


(define (good-enough? guess x)
  (< (abs (- (power3 guess) x)) 0.0001)
  )

(define (power3 x)
 (* x x x) 
  )

(good-enough? 1.0 4)



(define (cube x)
  (cube-iter 1.0 x)
  )

(cube 3)
(cube 27)
(cube 30000)
(cube 8)
(cube 100)
(cube 0.01)
(cube 0.000000000001)
(cube 99999999999999990.000000000001)
(* 8 9)

(define (sqrt-iter guess x)
  ( new-if (good-enough? guess x)
  guess 
  (sqrt-iter (improve guess x) x)
  ))

; sqrt-iter call new-if predicate then-clause else-clause
; is evaluated before call it
; so sqrt-iter is evaluated as third para
; and that cause an infinite evaluating

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

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

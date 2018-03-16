(load "lib/newtons-method.scm")

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c))
  )

(newtons-method (cubic 3 -2 -1) 1)
(newtons-method (cubic -3 3 -1) 1.2)

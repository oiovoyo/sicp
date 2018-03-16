(load "cont-frac.scm")

(define (N i) 1)

(define (D i) 
  ( if (= 0 (remainder (- i 2) 3))
       (* 2 (/ (+ i 1) 3))
       1
       )
  )

(D 8)

(define (E k)
  (+ 2 (cont-frac-iter N D k 0.0))
  )

(E 20)

(load "lib/common.scm")

(define (product-i term a next b)
  (define (iter a result)
    (if (< b a) 
        result
        (iter (next a) (* result (term a)))
        )
    )
  (iter a 1.0)
  )

(define (product-r term a next b)
  (if (< b a) 
      1.0
      (* (term a)
         (product-r term (next a) next b)
         )
      )
  )

(define (inc n) (+ n 2))
(define (item i) (/ (* (- i 1) (+ i 1)) (* i i)))
(define (pi p b)
(* 4.0 (p item 3.0 inc b)
  ))

(pi product-i  10000)
(pi product-r  10000)

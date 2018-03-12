(load "common.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (< b a) 
        result
        (iter (next a) (+ result (term a)))
        )
    )
  (iter a 0)
  )

(define (inc n) (+ n 1))
(define (sum-cubes a b)
 (sum cube a inc b)
  )
(sum-cubes 1 10)

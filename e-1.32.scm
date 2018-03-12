(load "common.scm")

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (< b a) 
        result
        (iter (next a) (combiner result (term a)))
        )
    )
  (iter a null-value)
  )

(define (add a b) (+ a b))
(define (inc n) (+ n 1))
(define (f x) x)

(define (sum a b)
  (accumulate add 0 f a inc b)
  )

(sum 1 10)

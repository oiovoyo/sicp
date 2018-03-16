(load "lib/common.scm")

(define (fib n)
  (fib-iter 1 0 0 1 n)
  )
(define (fib-iter a b p q count)
  (cond ((zero? count) b)
        ((even? count)
         (fib-iter 
           a 
           b 
           (+ (* p p) (* q q)) 
           (+ (* 2 p q) (* q q))
           (/ count 2)))
        (else (fib-iter (+ (* b q) ( * a q) (* a p)) 
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
(fib 1)
(fib 2)
(fib 7)

(load "common.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m)) 
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))
(define (fermat-test-all a n)
  (cond ((= a 0)
         true ) 
         ((= a (expmod a n n))
          (fermat-test-all (- a  1) n))
         (else (display a) false))))

(define (test-all n)
  (fermat-test-all (- n 1) n)
  )

(test-all 561)
(test-all 1105)
(test-all 1729)
(test-all 2465)
(test-all 2465)
(test-all 2821)
(test-all 6601)

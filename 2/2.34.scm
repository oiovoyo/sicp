(load "lib/accumulate.scm")
(define (hornel-eval x coeff)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* x higher-terms) this-coeff)) 0 coeff))

(hornel-eval 2 (list 1 3 0 5 0 1))

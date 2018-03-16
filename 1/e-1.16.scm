(load "lib/common.scm")

(define (feii a b n)
  (cond ((= n 0) a)
  ((even? n) (feii a (* b b) (/ n 2)))
  (else (feii (* a b) b (- n 1)))
  ))
(feii 1 2 1)
(feii 1 2 19)

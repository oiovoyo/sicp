(load "lib/common.scm")
(define (average-damp f)
  (lambda (x) (average x (f x)))
  )

((average-damp log) 10)

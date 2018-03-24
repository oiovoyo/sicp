(load "lib/accumulate.scm")
(define (flatmap proc seq)
  (accumulate append nil (map proc seq))
  )

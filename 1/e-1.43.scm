(define (repeated f n)
  (define (fn n x)
    (if (= n 1)
        (f x)
        (f (fn (- n 1) x))
        )
    )
  (lambda (x) (fn n x))
  )

((repeated square 2) 5)

(load "lib/compose.scm")

(define (repeated-with-compose f n)
  (if (= n 1)
      f
      (compose f (repeated-with-compose f (- n 1)))
      )
  )

((repeated-with-compose square 2) 5)

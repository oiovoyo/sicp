(load "lib/accumulate.scm")
(load "lib/filter.scm")
(define (flatmap proc seq)
  (accumulate append nil (map proc seq))
  )

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq
          )
  )

(permutations (list 1 2 3))


(load "lib/flatmap.scm")
(load "lib/accumulate.scm")
(load "lib/filter.scm")
(load "lib/enumerate-interval.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list j i))
                  (enumerate-interval 1 (- i 1))
                  ))
           (enumerate-interval 1 n)))

(unique-pairs 3)

(define (ordered-triple n)
  (flatmap (lambda (k)
             (map (lambda (ij)
                    (append ij (list k))
                    ) 
                    (unique-pairs (- k 1))
                  ))
           (enumerate-interval 1 n)))

(ordered-triple 4)

(define (triple-sum n s)
 (map (lambda (x)
        (append x (list (accumulate + 0 x)))
        )
      (filter (lambda (x) 
            (= s (accumulate + 0 x)))
          (ordered-triple n))
      ) 
  )

(triple-sum 6 11)


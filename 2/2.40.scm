(load "lib/accumulate.scm")
(load "lib/filter.scm")
(load "lib/prime.scm")
(load "lib/flatmap.scm")
(load "lib/enumerate-interval.scm")
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list j i))
                  (enumerate-interval 1 (- i 1))
                  ))
           (enumerate-interval 1 n)))

(unique-pairs 5)

(define (prime-sum-pairs n)
  (map (lambda (x)
         (append x (list (+ (car x) (cadr x)))))
       (filter (lambda (x)
                 (prime? (+ (car x) (cadr x)))
                 )
               (unique-pairs n))))

(prime-sum-pairs 8)
(define (pow a n)
  (if (= n 0)
      1
      (* a (pow a (- n 1)))
      )
  )

(define (factor-count z a)
  (if (> (remainder z a) 0)
      0
      (+ 1 (factor-count (/ z a) a))
      )
  )

(define (cons-n a b)
  (* (pow 2 a) (pow 3 b))
  )

(define (car-n z)
  (factor-count z 2)
  )

(define (cdr-n z)
  (factor-count z 3)
  )


(car-n (cons-n 4 5))
(cdr-n (cons-n 4 5))

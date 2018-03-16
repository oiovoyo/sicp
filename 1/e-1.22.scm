(define (smallest-divisor n)
  (find-divisor n 2)
  )
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0)
  )

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 31)

(define (timed-prime-test n) 
  ; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time) 
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      0
      )
  ) 

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  1 
  )
( = 1 (timed-prime-test 3))

(define (search-for-prime n count)
  ( if ( > count 0 ) 
       (cond ((= (timed-prime-test n) 0)
              (search-for-prime (+ n 1) count))
             ( else (search-for-prime (+ n 1) (- count 1))))
       ))

(search-for-prime 100000000 3)

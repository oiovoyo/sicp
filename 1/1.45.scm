(load "lib/average-damp.scm")
(load "lib/fixed-point.scm")
(load "lib/repeated.scm")

(define (root x n k)
  (define (f m)
    (lambda (y) 
      (if (= m 1)
          x
         (/ ((f (- m 1)) y) y) 
          )
      ) 
    )
 (fixed-point (repeated (average-damp (f n)) k) x)) 

(define (guess-k n)
  (if (=  (remainder n 2) 0)
      (/ n 2)
     (/ (- n 1) 2) 
      )
  )

(define (guess-k-failed n)
  (if (=  (remainder n 2) 0)
     1 
     2 ))
(define (guess-k-failed n)
  (if (=  (remainder n 2) 0)
     2 
     (/ (- n 1) 2) ))
(define (guess x n)
 (root x n (guess-k n)) 
  )

(define (pow x n)
  (if (= n 1)
      x
      (* x (pow x (- n 1)))
      )
  )

(define (result x n)
  (pow (guess x n) n)
  )

; (root 10.0 5 fuckyou)
(result 10.0 6)
; (result 10.0 5)

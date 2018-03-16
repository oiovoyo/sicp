(define (p) (p))

(define (test x y)
  (if (= x 0)
      0 
      y ) )
; this line will never return in my mit-scheme
; so it is normal order 
; which will expand (p) before test

(test 0 (p))

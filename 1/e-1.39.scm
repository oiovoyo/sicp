(load "lib/cont-frac.scm")


(define (D i)
  (- (* 2 i ) 1)
  )

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
       x 
        (* x x -1)
        )
    )
  (cont-frac-iter N D k 0.0)
  )
; tan pi is 0
(tan-cf 3.14159265358978323846 10)
; tan e+pi/2 is huge positive  
(tan-cf 1.57089635358979323846 10)
; tan -e+pi/s is huge negative
(tan-cf 1.56989635358979323846 10)

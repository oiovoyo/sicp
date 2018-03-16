(load "lib/repeated.scm")

(define dx 0.00001)


(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3))
  )


(define (n-fold f n)
  (repeated (smooth f) n)
  )


((smooth square) 1)

( (n-fold square 10) 1)

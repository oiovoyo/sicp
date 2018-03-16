(define (cont-frac-recur n d i k)
 (if (= i k)
     (/ (n i) (d i))
     (/ (n i) (+ (d i) (cont-frac-recur n d (+ i 1) k)))
     ) 
  )

(define (fi-recur k)
  (cont-frac-recur (lambda (x) 1.0) (lambda (x) 1.0) 1 k)
  )

(fi-recur 11)


(define (cont-frac-iter n d i r)
  (if (= i 0)
      r
      (cont-frac-iter n d (- i 1) (/ (n i) (+ (d i) r)))))

(define (fi-iter k)
  (cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0) k 0.0)
  )

(fi-iter 11)

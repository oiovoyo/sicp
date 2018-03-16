(load "lib/common.scm")
(define (sum f a next b)
  (if (> a b) 
      0
      (+ (f a) (sum f (next a) next b))))

(define (inc n ) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b)
  )

(sum-cubes 1 10)


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.001)

(define (simpson-rule f a b n)
  (* (/ (- b a) ( * 3.0 n)) (+ (f a) (f b) (simpson-sum f a (/ (- b a) n) (- n 1) 4))
  )
  )
(define (simpson-sum f a steps n co)
  (cond ((= n 0) 0)
        ((= co 4) (+ (* co (f (+ a (* steps n))))
                     (simpson-sum f a steps (- n 1) 2)
                     ))
        ((= co 2) (+ (* co (f (+ a (* steps n))))
                     (simpson-sum f a steps (- n 1) 4)
                     ))
        )
  )

(define (fk f a b n k)
 (f (+ a (/ (* (- b a) k) n))) 
  )

(integral cube 0 1 0.001)
(simpson-rule cube 0.0 1.0 100)
(simpson-rule cube 0.0 1.0 1000)
(/ 1 2)

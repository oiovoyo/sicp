(define (fr n)
  (cond ((< n 3) n)
  (else ( + (* 1 (fr (- n 1))) 
            (* 2 (fr (- n 2))) 
            (* 3 (fr (- n 3)))))))
(fr 4)
(fr 5)


(define (fi n)
  (fi-iter 2 1 0 n)
  )
(define (fi-iter n1 n2 n3 count)
  (cond ((= count 0) n3)
        ((= count 1) n2)
        ((= count 2) n1)
        (else (fi-iter (+ n1 (* 2 n2) (* 3 n3) ) n1 n2 (- count 1)))
      ) 
  )
(fi 4)
(fi 5)
(fi 6)
(fr 6)

(define (ACK x y) 0 n
    (cond ((= y 0) 0)
              ((= x 0) (* 2 y))
              ((= y 1) 2)
              (else (ACK (- x 1) (ACK x (- y 1)))))) 



(ACK 1 10)
(ACK 2 4)
(ACK 3 3)
(* 65536 2)

(define (f n) (ACK 0 n)) 
(define (g n) (ACK 1 n)) 
(define (h n) (ACK 2 n)) 
(define (k n) (* 5 n n)) 

(f 1)
(f 2)
(f 3)
(f 4)
(g 1)
(g 2)
(g 3)
(g 4)
(h 1)
(h 2)
(h 3)
(h 4)

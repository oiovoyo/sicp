(define (accumulate op initial seq)
  (if (null? seq)
      initial 
      (op (car seq) 
          (accumulate op initial (cdr seq)))))


(define (map1 p seq)
  (accumulate (lambda (x y) (cons (p x) y)) nil seq))


(map1 square (list 1 2 3 4))

(define (append1 seq1 seq2)
  (accumulate cons seq2 seq1)
  )
(append1 (list 2 3 4) (list 5 6 7))

(define (length1 seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))
(length1 (list 1 2 3 4 5))

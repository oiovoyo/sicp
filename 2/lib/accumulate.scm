(define (accumulate op initial seq)
  (if (null? seq)
      initial 
      (op (car seq) 
          (accumulate op initial (cdr seq)))))

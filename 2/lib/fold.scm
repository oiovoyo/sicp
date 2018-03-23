(load "lib/accumulate.scm")

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result 
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define fold-right accumulate)


(load "lib/accumulate.scm")

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result 
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define fold-right accumulate)


(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-left list nil (list 1 2 3))

; only if (op x y) == (op y x) just like + * but - /
; that can make fold-left and fold-right the same result


(define (tree-map f tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (f tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree tree) (tree-map square tree))

(square-tree 
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7))
  )


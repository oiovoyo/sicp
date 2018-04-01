(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list 
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list 
                              (right-branch tree)
                              result-list)))))
  (copy-to-list tree '()))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right) 
  (list entry left right)
  )

(define t (make-tree 10 
                     (make-tree 8 
                                (make-tree 7 '() '()) 
                                (make-tree 9 '() '())) 
                     (make-tree 12 
                                (make-tree 11 '() '()) 
                                (make-tree 13 '() '()))))

(tree->list-1 t)
(tree->list-2 t)

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))
      )
  )

(square-list (list 1 2 3 4))

(define (map1 proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map1 proc (cdr items)))
      )
  )
(define (square-list items)
 (map1 square items ) 
  )

(square-list (list 1 3 5 7))

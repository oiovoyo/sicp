(define (reverse l)
  (if (null? (cdr l))
      l 
      (append (reverse (cdr l)) (list (car l)))
      )
  )

(reverse (list 1 3 4 5 2 3 4))

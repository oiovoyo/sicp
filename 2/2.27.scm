(define (reverse l)
  (if (null? (cdr l))
      l 
      (append (reverse (cdr l)) (list (car l)))
      )
  )

(reverse (list 1 3 4 5 2 3 4))

(define (reverse-deep l)
 (if (null? l)
     l
     (if (list? (car l))
         (append (reverse-deep (cdr l)) (list (reverse-deep (car l))))
         (append (reverse-deep (cdr l)) (list (car l)))
         )))

(reverse-deep (list 1  (list 1 2) 3 (list 3 4) (list 4 0 9 3 2 (list 3 2 1))))

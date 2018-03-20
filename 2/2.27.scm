(define (reverse l)
  (if (null? (cdr l))
      l 
      (append (reverse (cdr l)) (list (car l)))
      )
  )

(reverse (list 1 3 4 5 2 3 4))

(define (deep-reverse l)
 (if (null? l)
     l
     (if (list? (car l))
         (append (deep-reverse (cdr l)) (list (deep-reverse (car l))))
         (append (deep-reverse (cdr l)) (list (car l)))
         )))

(deep-reverse (list 1  (list 1 2) 3 (list 3 4) (list 4 0 9 3 2 (list 3 2 1))))
(deep-reverse (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

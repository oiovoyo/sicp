(define (equal-list? l1 l2)
 (cond ((and (null? l1) (null? l2)) true)
       ((not (eq? (car l1) (car l2))) false)
       (else (equal-list? (cdr l1) (cdr l2)))
       ) 
  )

(equal-list? '(this is a list) '(this is a list))
(equal-list? '(this is a list) '(this (is a) list ))

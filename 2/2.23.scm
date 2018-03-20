(define (for-each1 f l)
 (if (not (null? l))
    (begin
       (f (car l))
       (for-each1 f (cdr l))
    )
 )
)

(for-each1 (lambda (x) (newline) (display x))
          (list 1 3 4))

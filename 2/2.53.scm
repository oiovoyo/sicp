(list 'a 'b 'c)

(list (list 'george))

(cdr '((x1 x2) (y1 y2)))

(cadr '((x1 x2) (y1 y2)))

(pair? (car '(a short list)))

(define (memq item x )
  (cond ((null? x) false)
        ((eq? (car x) item) true) 
        (else (memq  item (cdr x)))
        )
  )

(memq 'red '((red shoes) (blue socks)))

(memq 'red '(red shoes blue socks))



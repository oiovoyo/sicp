(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))
; answer's order depend on square (car things)) evaluate order
; which is reverse

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    ( list (square (car things)))))))
  (iter items nil))
(square-list (list 1 2 3 4))

; the second one is right in order 
; but result is not list but a pair
; fix it as list result with append operation

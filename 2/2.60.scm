(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set)
  )

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2))
         )
        (else (intersection-set (cdr set1) set2))
        )
  )

(intersection-set '(1 2 3) '( 2 3 4))

(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
       (else (append set1 set2)) 
        )
  )

(union-set '(1 2 3) '( 2 3 4))
(union-set '() '(1))
(union-set '(1) '())
(union-set '() '())

; adjoin-set and union-set is O(1) compared with non-duplicated set
; so when frequently usage of adjoin-set and union-set and memory is not taken in account
; duplicated set is preferrd

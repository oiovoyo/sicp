(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
       (append rest (map (lambda (r) (cons (car s) r)) rest)))))

(subsets (list 1 2 3 4 5))

; rest is a set which has not the (car s) element
; so cons (car s) with each elment of rest
; build a full subset of s

(load "lib/permutations.scm")
(load "lib/enumerate-interval.scm")
(load "lib/filter.scm")
(load "lib/flatmap.scm")
(load "lib/accumulate.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (position)  (safe? k position))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position 
                       new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)
(define (adjoin-position new-row k rest-of-queens)
  (if (null? rest-of-queens)
      (list new-row)
      (append (list new-row) rest-of-queens ) 
      )
  )
; calculate two point of queen is conflict
; (car x) is row (cdr x) is col

(define (conflict? x y)
  (let ((dis (- (car y) (car x)))) 
   (cond ((= (cdr y) (+ (cdr x) dis)) true)
         ((= (cdr y) (- (cdr x) dis)) true)
         ((= (cdr y) (cdr x)) true)
         (else false)
         )
   )
  )

; (conflict? (cons 1 2) (cons 2 4))
; we assume that (car pos) is the kth col queen
; and assume that the k-1th pos is safe
; so we only check the kth col of queen with
; each of [1, k-1] col queen with conflict?

(define (safe? k pos)
  (if (null? (cdr pos))
      true 
      (null? (filter 
               (lambda (x) (conflict? (cons k (car pos)) x))
               (map (lambda (row col) (cons (- k row) col))
                    (enumerate-interval 1 (- k 1)) (cdr pos))))
      )
  )

; (safe? 3 (list 1 2 3))
(queens 8)

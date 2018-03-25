(define (make-frame origin e1 e2)
  (list origin e1 e2)
  )

(define (origin-frame f)
  (car f)
  )
(define (edge1-frame f)
  (car (cdr f))
  )

(define (edge2-frame f)
  (car (cdr (cdr f)))
  )

(define f (make-frame 1 2 3))
(origin-frame f)
(edge1-frame f)
(edge2-frame f)

(define (make-frame origin e1 e2)
  (cons origin (cons e1 e2))
  )

(define (origin-frame f)
  (car f)
  )
(define (edge1-frame f)
  (car (cdr f))
  )
(define (edge2-frame f)
  (cdr (cdr f))
  )
(define f (make-frame 1 2 3))
(origin-frame f)
(edge1-frame f)
(edge2-frame f)



(load "lib/fold.scm")
(define (reverse-r seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq)
  )

(reverse-r (list 1 2 3 (list 5 6 7 (list 8 9))))

(define (reverse-l seq)
  (fold-left (lambda (x y) (cons y x)) nil seq)
  )
(reverse-l (list 1 2 3 (list 5 6 7 (list 8 9))))

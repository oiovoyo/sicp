(load "lib/accumulate.scm")
(define nil '())
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil 
      (cons (accumulate op init (map car seqs)) 
            (accumulate-n op init (map cdr seqs))
            )
      )
  )

(accumulate-n + 0 (list (list 1 2 3) (list 2 3 4)))
(map car (list (list 1 2) (list 2 3) (list 4 5)))
(map cdr (list (list 1 2 0) (list 2 3) (list 4 5)))

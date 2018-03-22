(load "lib/accumulate.scm")

(define (accumulate-n op init seqs)
  (if (null? seqs)
      nil 
      (cons (accumulate op init (car seqs)) 
            (accumulate-n op init (cdr seqs))
            )
      )
  )

(accumulate-n + 0 (list (list 1 2) (list 2 3) (list 3 4 5)))

(load "lib/accumulate.scm")

(define (accumulate-n op init seqs)
  (if (null? seqs)
      nil 
      (cons (accumulate op init (car seqs)) 
            (accumulate-n op init (cdr seqs))
            )
      )
  )

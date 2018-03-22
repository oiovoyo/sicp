(load "lib/accumulate.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (not (pair? x)) 
                             1
                             (count-leaves x)
                             )
                         ) t)))




(count-leaves (list (list 2 (list 3 (list 4))) 1 2 3 (list 4  5 6)))

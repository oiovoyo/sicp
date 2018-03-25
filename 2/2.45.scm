(define (split first-op second-op)
  (lambda (painter n)
    (if (= n 0)
        painter 
        (let ((smaller ((split first-op second-op) painter (- n 1)))))
        (first-op painter (second-op smaller smaller))
        )
    )
 )

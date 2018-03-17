(define (make-rat n d)
  (let ((g (gcd n d)))
   (cons (>= (* n d) 0) (cons (/ (abs n) g) (/ (abs d) g)))
   ))

(define (numer x)
  (car (cdr x))
  )


(define (denom x)
  (cdr (cdr x))
  )
(define (positive? x)
  (car x)
  )


(define (print-rat x)
  (newline)
  (if (not (positive? x))
      (display "-")
      )
  (display (numer x))
  (if (> (denom x) 1)
      (begin 
        (display "/")
        (display (denom x)) 
        )
      )
  )

(print-rat (make-rat 4 -2))

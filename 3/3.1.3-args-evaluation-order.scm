(define (create-f)
  (define i 'nil)
  (lambda (x)
    (if (eq? i 'nil)
        (begin (set! i x)))
    (if (eq? i 0)
        (begin 0)
        x)))

(define f (create-f))
(+ (f 0) ( f 1))

(define f (create-f))
(+ (f 1) ( f 0))

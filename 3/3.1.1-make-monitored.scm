(define (make-monitored lbd)
  (define c 0)
  (define (how-many-calls?)
    c)
  (define (dispatch x)
    (cond ((eq? x 'how-many-calls?) (how-many-calls?))
          (else
           (set! c (+ c 1))
           (lbd x))))

  dispatch
)

(define (add1 x)
  (+ x 1))
(define s (make-monitored add1))

(s 1)
(s 'how-many-calls?)

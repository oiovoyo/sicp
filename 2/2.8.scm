(load "lib/interval.scm")

(define (sub-interval i1 i2)
  (let ((a (- (lower-bound i1) (lower-bound i2)))
        (b (- (upper-bound i1) (upper-bound i2))))
    (make-interval a b)))


(sub-interval (make-interval 1 2) (make-interval 2 3))

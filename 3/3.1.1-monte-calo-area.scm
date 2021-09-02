(define (estimate-integral trials x1 x2 y1 y2)
  (*
      (monte-carlo trials (cesaro-test x1 x2 y1 y2))
      (*
       (- y2 y1)
       (- x2 x1)
      )
      1.0) 
  )

(estimate-integral 10000 -1 1 -1 1)



(define (rand-range low high)
  (+ low (random (- high low)))
  )

(min 1 2)
(define (is-in-circle x0 y0 r x y)
  (<= (+ (* (- x x0) (- x x0)) (* (- y y0) (- y y0))) (* r r))
)
(is-in-circle 500 500 500 1 1)

(define (area-test x1 x2 y1 y2)
  (let ((x (rand-range x1 x2)))
    (let ((y (rand-range y1 y2)))
      (let ((r (/ (min (- y2 y1) (- x2 x1)) 2)))
        (is-in-circle (/ (+ x1 x2) 2) (/ (+ y1 y2) 2) r x y)
        )
      )
    )
)

(area-test 0 1000 0 1000)

(define (cesaro-test x1 x2 y1 y2)
  (lambda ()
    (area-test x1 x2 y1 y2)))

((cesaro-test 0 200 0 200))

(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
      (cond ((= trials-remaining 0)
             (/ trials-passed trials))
            ((experiment)
             (iter (- trials-remaining 1)
                   (+ trials-passed 1)))
            (else
             (iter (- trials-remaining 1)
                   trials-passed))))
    (iter trials 0))

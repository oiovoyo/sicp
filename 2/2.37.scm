(load "lib/accumulate.scm")
(load "lib/accumulate-n.scm")

(accumulate + 0 (map * (list 1 2 3) (list 2 3 4)))

(define (dot-product v w)
  (accumulate + 0 (map * v w))
  )

(dot-product (list 1 2 3) (list 2 3 4))


(define (matrix-*-vector m v)
  (map (lambda (v1) (dot-product v v1)) m)
  )

(define tran-f (lambda (x y) (if (null? y)
                                   x
                                   (map lxy x y)
                                   )))

(define lxy (lambda (x y) (cond ((and (not (pair? x)) (not (pair? y))) (list x y))
                                 ((and (pair? x) (not (pair? y))) (append x (list y)))
                                 ((and (pair? y) (not (pair? x))) (cons x y))
                                 (else (append x y))
                                 )))

(define (transpose mat)
  (accumulate tran-f nil mat)
  )

(transpose  (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(transpose (transpose  (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12))) )

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
   (map (lambda (mi) (matrix-*-vector cols mi)) m) 
    )
  )
(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(define y (transpose x))
(matrix-*-matrix x y)
(matrix-*-matrix y x)

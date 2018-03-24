(load "lib/enumerate-interval.scm")
(load "lib/prime.scm")
(load "lib/accumulate.scm")
(load "lib/filter.scm")

(define (flatmap proc seq)
  (accumulate append nil (map proc seq))
  )

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))
  )

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
  )

(define (prime-sum-pairs n)
  (map make-pair-sum 
       (filter prime-sum? (flatmap 
                            (lambda (i)
                              (map (lambda (j) (list i j))
                                   (enumerate-interval 1 (- i 1))))
                              (enumerate-interval 1 n)))))

(prime-sum-pairs 10)

(map square (list 1 2 3))

(accumulate append nil (list (list 1 2) (list 2 3)))

(define pa (map (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 4)
     ))

(display pa)
; (() ((2 1)) ((3 1) (3 2)) ((4 1) (4 2) (4 3)))

(accumulate append nil pa)
; ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))

; as we can see (display pa) is (list (list (list)))
; after flatmap, it becomes (list (list))
; which is a flat list 

; flatmap make recursive list into flat list as it's name shows 


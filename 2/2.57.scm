(define (deriv ex var)
  (cond ((number? ex) 0)
        ((variable? ex) (if (same-variable? ex var) 1 0 ))
        ((sum? ex) (make-sum (deriv (addend ex) var)
                             (deriv (augend ex) var)))
        ((product? ex)
         (make-sum 
           (make-product (multiplier ex)
                         (deriv (multiplicand ex) var))

           (make-product (deriv (multiplier ex) var)
                         (multiplicand ex))))
        ((exponent? ex)
         (make-product 
           (make-product (exponent-n ex) (make-exponent (exponent-base ex) (- (exponent-n ex) 1)))
           (deriv (exponent-base ex) var)
           )
         )
        (else 
          (error "unknown exressoin type: DERIV" ex)))) 

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum-list a1 an)
(cond ((null? (cdr an))
          (make-sum2 a1 (car an)))
         (else (make-sum2
                 a1 (make-sum-list (car an) (cdr an))
                 )))
  )
(define (make-sum a1 . an)
  (make-sum-list a1 an)
  )

(define (make-sum2 a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))
        )

  )
(define (=number? ex num)
  (and (number? ex) (= ex num))
  )

(define (make-product-list a1 an)
(cond ((null? (cdr an))
          (make-product2 a1 (car an)))
         (else (make-product2
                 a1 (make-product-list (car an) (cdr an))
                 )))
  )
(define (make-product a1 . an)
  (make-product-list a1 an)
  )

(define (make-product2 m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))
  )
  )
(define (sum? x) ( and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) 
  (cond ((null? (cdr (cdr (cdr s)))) (cadr (cdr s)))
       (else (make-sum-list (cadr (cdr s)) (cdr (cdr (cdr s))))) 
        )
  )

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand s) 
  (cond ((null? (cdr (cdr (cdr s)))) (cadr (cdr s)))
       (else (make-product-list (cadr (cdr s)) (cdr (cdr (cdr s))))) 
        )
  )
(define (exponent? x) (and (pair? x) (eq? (car x) '**)))

(define (exponent-base s) (cadr s))

(define (exponent-n s) (caddr s))

(define (make-exponent base n) (list '** base n))
(define (make-exponent base n) 
  (cond ((= n 0) 1)
        ((= n 1) base)
        (else (list '** base n))
        )
  )

(deriv '(+ x 3 x (** x 5) (* x 6 (** x 8)) ) 'x)
(deriv '(* x x x) 'x)
(deriv '(** (** x 2) 3) 'x)
(deriv '(** (** x 1) 3) 'x)

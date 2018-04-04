(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define install-deriv-sum-package
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'deriv '+ deriv-sum))

(define install-deriv-product-package
  (define (deriv-product exp var)
    (make-sum (make-product 
                (multiplier exp)
                (deriv (multiplicand exp) var))
              (make-product 
                (deriv (multiplier exp) var) 

                (multiplicand exp))))
  (put 'deriv '* deriv-product))

(define install-deriv-exponent-package 
  (define (deriv-exponent exp var)
    (make-product 
      (make-product (exponent-n ex) (make-exponent (exponent-base ex) (- (exponent-n ex) 1)))
      (deriv (exponent-base ex) var)))
  (put 'deriv '** deriv-exponent))

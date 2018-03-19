(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else 
          (+ (cc amount
                 (except-first-demomination 
                   coin-values))
             (cc ( -  amount 
                      (first-demomination 
                        coin-values))
                 coin-values)))))

(define (first-demomination coins)
  (car coins)
  )

(define (except-first-demomination coins)
  (cdr coins)
  )

(define (no-more? coins)
  (null? coins)
  )

(define us-coins (list 25 50 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(cc 100 us-coins)
(cc 100 uk-coins)
; the order has no affect
; cc do not use the order 

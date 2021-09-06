(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define w-time 0)
  (define (check-account-ps? ps)
    (eq? ps password)
    )

  
  
  (define (check-ps? ps)
    (check-account-ps? ps))
  (define (password-error . param)
    (set! w-time (+ w-time 1))
    (if (>= w-time 7)
        (begin
          (set! w-time 0)
          (call-police))
        "Incorrect password")
        )
  (define (call-police)
    "I'm calling the police")
  (define (dispatch ps m)
    (if (check-ps? ps)
        (begin
          (set! w-time 0)
          (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     ((eq? m 'check-account-ps?) check-account-ps?)
                     (else (error "Unknown request: MAKE-ACCOUNT" m))))
        password-error)
    )
  dispatch)


(define (make-joint acc password new-password)
  (define (check-ps? ps)
    ((acc  password 'check-account-ps?) ps))
  (define (password-error . param)
    "Incorrect local password"
    )

  (define (dispatch ps m)
    (if (check-ps? password)
        (begin
          (cond ((eq? ps new-password) (acc password m))
                (else password-error)))
        password-error))
  dispatch
  )

(define acc (make-account 100 'a))
(define acc1 (make-joint acc 'a 'cc))

((acc1 'cc 'deposit) 10)
((acc 'a 'withdraw) 10)


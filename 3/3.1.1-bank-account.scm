(define balance 100)
(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))

(withdraw 10)
(withdraw 10)
(withdraw 90)


(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "2 -> Insufficient funds"))))

(new-withdraw 10)
(new-withdraw 91)

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "3 -> Insufficient funds")))

(define w1 (make-withdraw 100))
(define w2 (make-withdraw 100))

(w1 40)
(w2 60)

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch m)
    (cond((eq? m 'withdraw) withdraw)
         ((eq? m 'deposit) deposit)
         (else (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch)

(define acc (make-account 100))

((acc 'withdraw) 60)
((acc 'deposit) 60)
((acc 'withdraw) 60)
((acc 'withdraw) 60)

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
  (define (password-error amount)
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
    (if (eq? ps password)
        (begin
          (set! w-time 0)
          (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     (else (error "Unknown request: MAKE-ACCOUNT" m))))
        password-error)
    )
  dispatch)


(define acc (make-account 100 'secret))

((acc 'secret 'withdraw) 10)
((acc 'secret-p 'withdraw) 10)

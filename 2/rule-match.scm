; atom? is not in a pair or null (empty)

(define (atom? x)
  (and (not (pair? x))
       (not (null? x))))


; Dictionaries 

; it is a procedure which has no argument
(define (make-empty-dictionary) '())

; 
(define (extend-dictionary pat dat dictionary)
  ; vname is (cadr pat) 
  (let ((vname (variable-name pat)))
   ; assq is to find vname is in dictionary or not?
   ; if not found v is false
   ; else v is the first pair where (eq? vname (car v)) is true
   ; so here v is to find vname as key is exist in dictionary or not
   (let ((v (assq vname dictionary)))
    ; can not find and put it in dictionary
    (cond ((not v)
           (cons (list vname dat) dictionary))
          ; if found and the value is  equal to dat
          ; we do not extend nothing return dictionary itself 
          ((eq? (cadr v) dat) dictionary)
          ; if value is not equal to dat return failed
          ; because the value should be equal
          (else 'failed)))))
; find var as key in dictionay
(define (lookup var dictionary)
  (let ((v (assq var dictionary)))
   (if (not v)
       var
       (cadr v))))

; Expressions

(define (compound? exp) (pair?   exp))
(define (constant? exp) (number? exp))
(define (variable? exp) (atom?   exp))

; Patterns

; so the pattern of constant is '?c
(define (arbitrary-constant?    pattern)
  (if (pair? pattern) (eq? (car pattern) '?c) false))
; so the pattern of expression is '?
(define (arbitrary-expression?  pattern)
  (if (pair? pattern) (eq? (car pattern) '? ) false))
; so the pattern of variable is '?v
(define (arbitrary-variable?    pattern)
  (if (pair? pattern) (eq? (car pattern) '?v) false))

; 
; variable name is second item of pattern list
(define (variable-name pattern) (cadr pattern))

; Pattern Matching and Simplification
; 
(define (match pattern expression dictionary)
  ; if pattern and expression is null return dictionary
  (cond ((and (null? pattern) (null? expression))
         dictionary)
        ; dictionary may be failed returned by extend-dictionary
        ((eq? dictionary 'failed) 'failed)
        ; pattern is atom
        ((atom? pattern)
         ; expression is atom
         (if (atom? expression)
             ; pattern == expression
             ; return dictionary
             (if (eq? pattern expression)
                 dictionary
                 'failed)
             'failed))
        ; pattern is constant
        ((arbitrary-constant? pattern)
         ; expression is constant
         (if (constant? expression)
             ; extend dictionary with key pattern and value expression
             (extend-dictionary pattern expression dictionary)
             'failed))
        ; pattern is variable
        ((arbitrary-variable? pattern)
         ; expression is variable
         (if (variable? expression)
             (extend-dictionary pattern expression dictionary)
             'failed))
        ; pattern is expression
        ((arbitrary-expression? pattern)
         (extend-dictionary pattern expression dictionary))
        ((atom? expression) 'failed)
        ; else means pattern is not atom and not constant and not variable and not expression
        ; it is a list of patterns and expressions
        ; match the first one and match the left
        (else
          (match (cdr pattern)
                 (cdr expression)
                 (match (car pattern)
                        (car expression)
                        dictionary)))))

; Skeletons & Evaluations

; is skeleton or not?
(define (skeleton-evaluation? skeleton)
  (if (pair? skeleton) (eq? (car skeleton) ':) false))
; get expression content
(define (evaluation-expression evaluation) (cadr evaluation))


(define (instantiate skeleton dictionary)
  ; null skeleton return null list
  (cond ((null? skeleton) '())
        ; skeleton is atom return itself
        ((atom? skeleton) skeleton)
        ; is evaluation 
        ((skeleton-evaluation? skeleton)
         ; return evaluate content of skeleton with dictionary
         (evaluate (evaluation-expression skeleton)
                   dictionary))
        ; same as match instantiate first one and cons with the left
        ; it is a lisp program pattern that 
        ; procedure receive list and non list as parameter
        ; first do non list one and cons the result as follows:
        (else (cons (instantiate (car skeleton) dictionary)
                    (instantiate (cdr skeleton) dictionary)))))

; Evaluate (dangerous magic)
(define (evaluate form dictionary)
  ; atom form 
  ; lookup in dictionary 
  (if (atom? form)
      ; if is atom return lookup result
      (lookup form dictionary)
      ; (apply + '(3 4)) get 7
      ; eval usage (eval '(+ 3 4) user-initial-environment) get 7
      ; so eval here is the key function of entire system
      ; lookup first of form in dictionary and eval it
      ; that eval result is just the first argument of apply
      ; which will apply to (map .....)
      ; as author said, it's a dangerous magic
      ; and easy to make bug here
      (apply (eval (lookup (car form) dictionary)
                   user-initial-environment)
             ; return a list , the value of (cdr form) as key in dictionary
             (map (lambda (v) (lookup v dictionary))
                  (cdr form)))))

; so the basic lisp language pattern is 
; constructor and selectors
; 

; below is Rules selectors
; Rules
; Rules is list which the first item is pattern 
(define (pattern  rule) (car  rule))
; Rules is list which the rest items is skeleton 
(define (skeleton rule) (cadr rule))

; Simplifier

; return a procedure
; which will carry the-rules

(define (simplifier the-rules)
  ; sub procedure simplify-exp
  (define (simplify-exp exp)
    ; argument of try-rules 
    ; if exp is not compound 
    ; simplify-parts it
    ; otherwise itself
    (try-rules (if (compound? exp)
                   (simplify-parts exp)
                   exp)))

  (define (simplify-parts exp)
    (if (null? exp)
        '()
        ; if exp is list simplify-exp fist one
        ; and cons to simplify-parts with
        (cons (simplify-exp   (car exp))
              (simplify-parts (cdr exp)))))
  (define (try-rules exp)
    (define (scan rules)
      (if (null? rules)
          exp
          (let ((dictionary (match (pattern (car rules))
                                   exp
                                   (make-empty-dictionary))))
            (if (eq? dictionary 'failed)
                (scan (cdr rules))
                (simplify-exp (instantiate (skeleton (car rules))
                                           dictionary))))))
    (scan the-rules))
  simplify-exp)

; another way to write simplify-exp
(define (simplify-exp exp)
  (try-rules
    (if (compound? exp)
        (map simplify-exp exp)
        exp)))

'(+ (* (? x) (? y)) (? y))

'(+ (* 3 x) x)

(match '(+ (* (? x) (? y)) (? y)) '(+ (* 3 x) x) (make-empty-dictionary))

(evaluate '(+ x x) '((y x) (x 3)))

; Symbolic Differentiation

(define deriv-rules
  '(
    ( (dd (?c c) (? v))              0                                 )
    ( (dd (?v v) (? v))              1                                 )
    ( (dd (?v u) (? v))              0                                 )
    ( (dd (+ (? x1) (? x2)) (? v))   (+ (dd (: x1) (: v))
                                        (dd (: x2) (: v)))             )
    ( (dd (* (? x1) (? x2)) (? v))   (+ (* (: x1) (dd (: x2) (: v)))
                                        (* (dd (: x1) (: v)) (: x2)))  )
    ( (dd (** (? x) (?c n)) (? v))   (* (* (: n) (+ (: x) (: (- n 1))))
                                        (dd (: x) (: v)))              )
    ))

(define dsimp (simplifier deriv-rules))

(define asimp (simplifier algebra-rules))

(define (d-a-simp exp) 
  (asimp (dsimp exp))
  )
;; Algebraic simplification
(define algebra-rules
  '(
    ( ((? op) (?c c1) (?c c2))                (: (op c1 c2))                )
    ( ((? op) (?  e ) (?c c ))                ((: op) (: c) (: e))          )
    ( (+ 0 (? e))                             (: e)                         )
    ( (* 1 (? e))                             (: e)                         )
    ( (* 0 (? e))                             0                             )
    ( (* (?c c1) (* (?c c2) (? e )))          (* (: (* c1 c2)) (: e))       )
    ( (* (?  e1) (* (?c c ) (? e2)))          (* (: c ) (* (: e1) (: e2)))  )
    ( (* (* (? e1) (? e2)) (? e3))            (* (: e1) (* (: e2) (: e3)))  )
    ( (+ (?c c1) (+ (?c c2) (? e )))          (+ (: (+ c1 c2)) (: e))       )
    ( (+ (?  e1) (+ (?c c ) (? e2)))          (+ (: c ) (+ (: e1) (: e2)))  )
    ( (+ (+ (? e1) (? e2)) (? e3))            (+ (: e1) (+ (: e2) (: e3)))  )
    ( (+ (* (?c c1) (? e)) (* (?c c2) (? e))) (* (: (+ c1 c2)) (: e))       )
    ( (* (? e1) (+ (? e2) (? e3)))            (+ (* (: e1) (: e2))))))

(dsimp '(dd (+ x y) x))
(asimp (dsimp '(dd (+ x y) x)))
(dsimp '(dd (* x y) x))
(asimp (dsimp '(dd (* x y) x)))
(dsimp '(dd (+ (* x x) (* y (** x 8))) x))
(asimp (dsimp '(dd (+ (* x x) (* 8 (* x 8))) x)))
(asimp '(** x 8))
(dsimp '(dd (* (** x 4) (* x a)) x))
(write (asimp (dsimp '(dd (+ (* x x) (* 8 (* x 8))) x))))

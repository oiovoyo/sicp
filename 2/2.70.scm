(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-code-tree left right) 
  (list left 
        right 
        (append (symbols left ) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree ) (cadr tree))
(define (symbols tree) 
 (if (leaf? tree) 
     (list (symbol-leaf tree))
     (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch 
                (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch ) 
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else  (error "bad bit: CHOOSE-BRANCHE" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
       ((< (weight x) (weight (car set))) (cons x set))
       (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
       (adjoin-set (make-leaf (car pair ) 
                              (cadr pair))
                   (make-leaf-set (cdr pairs))))))

(define sample-tree 
  (make-code-tree (make-leaf 'A 4)
                 (make-code-tree 
                   (make-leaf 'B 2)
                   (make-code-tree 
                     (make-leaf 'D 1)
                     (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)
(encode (decode sample-message sample-tree) sample-tree)

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message ) tree)
              (encode (cdr message) tree))))
(define (symbol-include? s ch)
  (cond ((null? s) false)
        ((eq? (car s) ch) true)
        (else (symbol-include? (cdr s) ch))
        )
  )
(define (encode-symbol message tree)
  (cond ((leaf? tree)
        '() 
         )
        (else 
          (let ((left (left-branch tree))
                (right (right-branch tree)))
            (cond ((symbol-include? (symbols left) message)
                   (cons 0 (encode-symbol message left )))
                  ((symbol-include? (symbols right) message)
                   (cons 1 (encode-symbol message right )))
                  (else (error "can not find message in tree" message)))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (if (= (length leaves) 1)
      (car leaves)
      (let ((first (car leaves))
            (second (cadr leaves)) )
        (successive-merge (adjoin-set (make-code-tree first second) (cdr (cdr leaves)))))
      )
  )

(generate-huffman-tree (list '(A 1) '(B 2) '(C 4) '(D 10) '(E 5)))
(encode '(A C D E) (generate-huffman-tree (list '(A 1) '(B 2) '(C 4) '(D 10) '(E 5))))
(define ly-tree (generate-huffman-tree (list '(A 1) '(GET 2) '(SHA 3) '(WAH 1) '(BOOM 1) '(JOB 2) '(NA 16) '(YIP 9))))
(define ly '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom)) 
(encode ly ly-tree)


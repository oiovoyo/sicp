(define (min a b)
 (if (< a b ) 
  a 
  b))

(define ( square a ) ( * a a)))

(define ( summax a b c ) ( - ( + (square a ) (square b) (square c)) (square (min (min a b) c))))

( summax 1 2 3)


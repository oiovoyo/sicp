(define wave2 (beside wave (flib-vert wave)))
(define wave4 (below wave2 wave2))
(define (flipped-paires painter)
  (let ((painter2 (beside painter (flip-vert painter))))
   (below painter2 painter2)
   )
  )
(define wave4 (flipped-paires wave))

(define (right-split painter n)
  (if (= n 0)
      painter 
      (let ((smaller (right-split painter (- n 1))))
       (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 1)
      painter 
      (lent ((up (up-split painter (- n 1)))
             (right (right-split painter (- n 1)))
             
             (let ((top-left (beside up up))
                   (bottom-right (below right right))
                   (roner (corner-split painter (- n 1)))
                   
                   (beside (below painter top-left)
                           (below bottom-right corner)
                           )
                   ))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
   (lent ((half (beside (flip-horiz quarter) quarter)))
         (below (flip-vert half) half))))

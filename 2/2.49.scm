(load "lib/segment.scm")
(load "lib/frame.scm")
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame)
           (start-segment segment)
           ((frame-coord-map frame)
            (end-segment segment)
            )
           segment-list))))))

(define (outline-frame f)
  (segment-painter (list 
                     (make-segment (origin-frame f) (edge1-fram f))
                     (make-segment (edge1-frame f) (add-vect (edge1-frame f) (edge2-frame f)))
                     (make-segment  (add-vect (edge1-frame f) (edge2-frame f)) (edge2-frame f))
                     (make-segment  (edge2-fram f) (origin-frame f))
                     ) f)
  )
(define (xline-frame f)
  (segment-painter (list 
                     (make-segment (origin-frame f) (add-vect (edge1-frame f) (edge2-frame f)))
                     (make-segment  (edge1-fram f) (edge2-frame f))
                     ) f)
  )

(define (diamond-frame f)
  (segment-painter (list 
                     (make-segment  (scale-vect (add-vect (origin-frame f) (edge1-vect f)) 0.5) (scale-vect (add-vect (edge1-frame f) (add-vect (edge1-frame f) (edge2-frame f))) 0.5) )
                     (make-segment  (scale-vect (add-vect (edge1-frame f) (add-vect (edge1-frame f) (edge2-frame f))) 0.5)(scale-vect (add-vect (edge2-frame f) (add-vect (edge1-frame f) (edge2-frame f))) 0.5) )
                     (make-segment  (scale-vect (add-vect (edge2-frame f) (add-vect (edge1-frame f) (edge2-frame f))) 0.5) (scale-vect (add-vect (edge2-frame f) (edge1-vect f)) 0.5) )
                     (make-segment  (scale-vect (add-vect (edge2-frame f) (edge1-vect f)) 0.5) (scale-vect (add-vect (origin-frame f) (edge1-vect f)) 0.5) )
                     (make-segment  (edge1-fram f) (edge2-frame f))
                     ) f)
  )



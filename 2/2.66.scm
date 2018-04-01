(load "lib/tree.scm")
(load "lib/tree-balance.scm")
(define (lookup given-key set)
  (cond ((null? set) false)
       ((equal? given-key (key (entry set)) ) (entry set)) 
       ((> given-key (key (entry set))) (lookup given-key (right-branch set)))
       ((< given-key (key (entry set))) (lookup given-key (left-branch set)))))

(define (key x) x)

(lookup 1 '())
(lookup 2123 (list->tree '( 1 2 3 4 6 7 8 19 2123)))

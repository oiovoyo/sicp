(load "common.scm")

(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

(gcd 10 5)
(gcd 3 5)
(gcd 3 9)

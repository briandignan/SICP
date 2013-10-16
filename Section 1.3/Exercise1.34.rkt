(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

;(f f)  results in a compile error

;(f 2)  results in a compile error
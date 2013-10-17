(define (square x) (* x x))

(define (repeated f quantity)
  (define (application-loop g q)
    (if (> quantity q)
        (lambda (x) (f (g x)))  ; Add another call of function f to the compound function g
        g))
  
  (application-loop f 1))


((repeated square 2) 5)
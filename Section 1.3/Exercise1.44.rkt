(define (repeated f quantity)
  (define (application-loop g q)
    (if (> quantity q)
        (lambda (x) (f (g x)))  ; Add another call of function f to the compound function g
        g))
  
  (application-loop f 1))



(define (square x) (* x x))

(define (average3 a b c) (/ (+ a b c) 3.0))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (average3 (f (- x dx)) (f x) (f (+ x dx)))))


((smooth square) 2)

(((repeated smooth 3) square) 2)


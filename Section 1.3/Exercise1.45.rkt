(define (square x) (* x x))

(define (average3 a b c) (/ (+ a b c) 3.0))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (average3 (f (- x dx)) (f x) (f (+ x dx)))))

((smooth square) 2)
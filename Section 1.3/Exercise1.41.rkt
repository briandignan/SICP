(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))


; example where inc is applied twice
((double inc) 1)


; applying double twice to inc (plus 4)
(((double double) inc) 5)


; My original expectation was it would be 8-times, but it turned out to be 16-times. 
; This makes sense, because (double 4-times) -> (4-times 4-times)
(((double (double double)) inc) 5)


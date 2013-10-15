(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? n) (= (remainder n 2) 0))

(define (* a b)
  (cond ((= a 0) 0)
        ((even? a) (double (* (halve a) b)))
        (else (+ b (* (- a 1) b)))))

(* 5 10)  ; expected 50
(* 9 9) ; expected 81
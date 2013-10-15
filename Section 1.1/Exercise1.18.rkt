(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? n) (= (remainder n 2) 0))

(define (* a b)
  (define (iter x y c)
    (cond ((= c 0) x)
          ((even? c) (iter x (double y) (halve c)))
          (else (iter (+ x y) y (- c 1)))))
  
  (iter 0 b a))

(* 5 10) ; expected 50
(* 9 9) ; expected 81
; Recursive procedure / Recursive process
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))
 
(f 0) ; expected 0
(f 1) ; expected 1
(f 2) ; expected 2
(f 3) ; expected 4
(f 4) ; expected 11
(f 5) ; expected 25


(define (g n)
  (define (g-iter a b c count)
    (if (= count 0)
        c
        (g-iter (+ (* 3 c) (* 2 b) a) a b (- count 1 ))))
  
  (g-iter 2 1 0 n))

(g 0) ; expected 0
(g 1) ; expected 1
(g 2) ; expected 2
(g 3) ; expected 4
(g 4) ; expected 11
(g 5) ; expected 25
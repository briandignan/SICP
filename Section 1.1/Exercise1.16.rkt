

(define (fast-expt b n)
  
  (define (square x) (* x x))
  
  (define (even? n)
  (= (remainder n 2) 0))
  
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b ) b (- n 1)))))

  (iter 1 b n))

(fast-expt 10 2) ; expected 100
(fast-expt 10 3) ; expected 1000
(fast-expt 10 4) ; expected 10000
(fast-expt 2 8) ; expected 256
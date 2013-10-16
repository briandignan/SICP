
(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k (/ (n k) (d k))))



(define (find-e) (+ 2 (cont-frac-iter 
 (lambda (i) 1.0)  ; numerator (always 1)
 (lambda (i)  ; denominator ( 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8 .... )
   (if (= (remainder (+ i 1) 3) 0)  ; if (i+1) % 3 == 0
         (* (/ 2 3) (+ i 1))  ; ( 2/3 ) * (i + 1) 
         1.0))
 1000)))

;; e == 2.718281...

(find-e)



(define (square x) (* x x))

(define (cont-frac-iter combiner n d k) ; Added a combiner, since the successive fractions subtract instead of add
  (define (iter i acc)
    (display acc) (newline)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (combiner (d i) acc)))))
  (iter k (/ (n k) (d k))))


(define (tan-cf x k)  
  (/ 
   (cont-frac-iter
   -
   (lambda (i) (square x))
   (lambda (i) (- (* 2 i) 1))
   k)
   x)) ; Since the top numerator needs to be x and not x^2, divide the entire cont-frac result by x
  
(tan-cf 1.0 100)
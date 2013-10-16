(define (inc x) (+ x 1))

(define (identity x) x)

(define (accumulate-iter combiner null-value a term b next)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (combiner (term a) acc))))
  
  (iter a null-value))


(define (accumulate-recur combiner null-value a term b next)
  (define (recur a)
    (if (> a b)
        null-value
        (combiner (term a) (recur (next a)))))
  (recur a))


(define (sum-recur a b)
  (accumulate-recur + 0 a identity b inc))


(define (sum-iter a b)
  (accumulate-iter + 0 a identity b inc))


(define (product-recur a b)
  (accumulate-recur * 1 a identity b inc))


(define (product-iter a b)
  (accumulate-iter * 1 a identity b inc))

(sum-iter 1 10)
(sum-recur 1 10)
(product-recur 1 5)
(product-iter 1 5)




      
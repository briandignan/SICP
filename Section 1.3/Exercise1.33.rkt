(define (prime? n)
  (define (iter k)
    (cond ((> (+ k 1) n) true)  
          ((= (remainder n k) 0) false)
          (else (iter (+ k 1)))))
  (iter 2))

(define (display-primes-up-to n)
  (define (iter k)
    (if (< (- k 1) n)
        (begin 
          (cond ((prime? k) 
                (begin (display k) (newline))))
          (iter (+ k 1)))))
  
  (iter 2))

;(display-primes-up-to 20)

(define (filtered-accumulate combiner null-value filter a term b next)
  (define (iter a acc)
    (cond ((> a b) acc)
          ((filter a) 
           (begin 
             (display a) (display " passed filter") (newline)
             (iter (next a) (combiner (term a) acc))))
          (else (iter (next a) acc))))
  
  (iter a null-value))

(define (square x) (* x x))

(define (sum-square-primes a b)
  (filtered-accumulate + 0 prime? a square b inc))

(sum-square-primes 2 10)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Idea to reduce coprime? arguments down to 1 from http://www.billthelizard.com/2010/05/sicp-exercise-133-filtered-accumulator.html
(define (product-of-coprimes n)
  (define (coprime? i)
    (if (= 1 (gcd i n))
        true
        false))
  
    (filtered-accumulate * 1 coprime? 2 identity n inc))

(product-of-coprimes 10)

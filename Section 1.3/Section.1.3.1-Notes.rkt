(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 3 3)

(define (identity x) x)

(define (sum-integers a b) 
  (sum identity a inc b))

(sum-integers 3 5)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000000))


(define (prefix a b n) 
  (/ (/ (- b a) n) 3))

(prefix 10 20 2)




  (define (term-prefix k)
    (cond ((= k 0) 1)
          ((= k 10) 1)
          ((= (remainder k 2) 1) 4)
          (else 2)))

 ; (term-prefix 0)
 ; (term-prefix 1)
 ; (term-prefix 2)
 ; (term-prefix 3)
 ; (term-prefix 4)
 ; (term-prefix 5)
 ; (term-prefix 6)
 ; (term-prefix 7)
 ; (term-prefix 8)
 ; (term-prefix 9)
 ; (term-prefix 10)
  
  
  
    (define (pi-approx-numer k) 
    (if (= (remainder k 2) 1) 
        (+ k 1)
        (+ k 2))) 
    
    (pi-approx-numer 1)
    (pi-approx-numer 2)
    (pi-approx-numer 3)
    (pi-approx-numer 4)
    (pi-approx-numer 5)
    (pi-approx-numer 6)
    
      (define (pi-approx-denom k)
    (if (= (remainder k 2) 1) 
        (+ k 2)
        (+ k 1))) 
      
(pi-approx-denom 1)
(pi-approx-denom 2)
(pi-approx-denom 3)
(pi-approx-denom 4)
(pi-approx-denom 5)
(pi-approx-denom 6)
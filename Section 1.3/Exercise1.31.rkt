(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a) (product-recur term (next a) next b))))


(define (factorial a) 
  (product identity 1 inc a))

(define (factorial-recur a)
  (product-recur identity 1 inc a))

(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)

(factorial-recur 1)
(factorial-recur 2)
(factorial-recur 3)
(factorial-recur 4)
(factorial-recur 5)


(define (pi-approx-term k) 
  (define (pi-approx-numer k) 
    (if (= (remainder k 2) 1) 
        (+ k 1)
        (+ k 2))) 
  
  (define (pi-approx-denom k)
    (if (= (remainder k 2) 1) 
        (+ k 2)
        (+ k 1))) 
  
  (/ (pi-approx-numer k) (pi-approx-denom k)))


(define (pi-div-4-approx n)
  (product pi-approx-term 1 inc n))


(pi-div-4-approx 100)
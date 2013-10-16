(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (sum-integral f a b n)
  (define h (/ (- b a) n))
  
  (define (y k) (f (+ a (* k h))))
  
  (define (front-prefix h) (/ h 3))
  
  (define (term-prefix k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((= (remainder k 2) 1) 4)
          (else 2)))
  
  (define (term k)
    (* (term-prefix k) (y k)))
  
  (* (front-prefix h) (sum term 0 inc n)))

(sum-integral cube 0 1 10)
(sum-integral cube 0 1 1000)
          
  

  
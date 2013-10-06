; Mucking around when reading section 1.1

(define (square x) (* x x))
(square (square 5 ) )
(define (sum-of-squares x y) (+ (square x) (square y)))
(sum-of-squares 4 5)
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -5)
(abs 3)
(abs 0)

; Exercise 1.1 

(define a 3)
(define b (+ a 1))
(= a b)
(if (and (> b a) (< b (* b a)))
    b
    a)
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))


; Exercise 1.2

(/ (+ 5 4 
      (- 2 
         (- 3 
            (+ 6 
               (/ 4 5))))) 
   (* 3 
      (- 6 2) 
      (- 2 7)))

; Exercise 1.3

(define (sum-of-squares-largest-two a b c) 
  (cond ((and (< a b) (< a c)) (sum-of-squares b c))
        ((and (< b a) (< b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

(sum-of-squares-largest-two 2 3 4)
(sum-of-squares-largest-two 3 2 4)
(sum-of-squares-largest-two 3 4 2)

; Exercise 1.4 (causes infinite loop)

(define (p) (p))
`
(define (test x y)
  (if (= x 0)
      0
      y) )

;; commented out because it causes a compile error (should cause an infinite loop??)
;;(test 0 (p))


; Example 1.1.7 (Square root approximation)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)


; Exercise 1.8




(define (cbrt-iter guess x)
  (if (good-enough-cbrt? guess x)
      guess
      (cbrt-iter (improve-cbrt guess x)
                 x)))

; if abs((guess^3 - x) / x) < .0001 then true else false
(define (good-enough-cbrt? guess x)
  (< (abs (/ (- (* guess guess guess) x) x )) .0001))


(define (improve-cbrt y x)
  (/ (+ (/ x (* y y )) (* 2 y )) 3))
  
(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt .00000001)
(cbrt 100000000)
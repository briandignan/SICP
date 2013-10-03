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

(test 0 (p))
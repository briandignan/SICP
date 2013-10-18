(define (logB x b) (/ (log x) (log b)))

(define (average x y) (/ (+ x y) 2.0))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    ;(display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (repeated f quantity)
  (define (application-loop g q)
    (if (> quantity q)
        (application-loop (lambda (x) (f (g x))) (+ q 1))  ; Add another call of function f to the compound function g
        g))
  
  (application-loop f 1))


(define (exp n k)
  (if (> k 0)
      (* n (exp n (- k 1)))
      1))

;(exp 2 5)

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (timesOneHundred x) (* x 100))

;((average-damp (average-damp (average-damp timesOneHundred))) 5)

;(((repeated average-damp 4) timesOneHundred) 5)

(define (fixed-point-of-transform-qty transform g n guess)
  (fixed-point ((repeated transform n) g) guess))



; Finds the nth root of x, so nRoot 100 2 will find the sqaure root of 100. 
(define (nRoot x n)
   (fixed-point-of-transform-qty 
   average-damp 
   (lambda (y) (/ x (exp y (- n 1))))   ; find fixed point of y -> x / y^(n-1), where n is the nth root
   (floor (logB n 2))    ; The quantity of damping operations is  floor of log base 2 of n   (1-3 => 1, 4-7 => 2, 8-15 => 3, etc)         
   1))


(nRoot 5 1000)





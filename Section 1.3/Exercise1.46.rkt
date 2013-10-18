(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))




(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess)
    (iter guess)))


(define (new-sqrt x)
  ((iterative-improve
   (lambda (guess) (< (abs (- (square guess) x)) .001))  ; The good-enough? function for sqrt
   (lambda (guess) (average guess (/ x guess)))) ; The improve function for sqrt
   1.0)) ; The initial guess that's passed to the lambda returned from iterative-improve

(new-sqrt 100)

; not finished
(define (new-fixed-point f first-guess)
  (define tolerance 0.00001)
  ((iterative-improve
    (lambda (guess) (< (abs (- guess (f guess))) tolerance))  ; The good-enough function
    (lambda (guess) (f guess)))  ; The improve function
   1.0)) 

(new-fixed-point cos 1.0)  ; expected .739.... (page 69)

(define (square x) (* x x))
(define (cube x) (* x x x))


(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))



;; Returns a function that takes a single argument x, which then calculates the cubic polynomial value for the given a, b and c
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 1 2 3) 1.0)

; result is -1.2756822036498454
(define p -1.2756822036498454)

; expect p^3 + ap^2 + bp + c is very close to zero
; show that it's very close to zero
(+ (cube p) (* 1 (square p)) (* 2 p) 3)
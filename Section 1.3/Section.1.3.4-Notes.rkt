(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)  ; 'expands' to  (lambda (x) (average x (square x)))

(define (logB x b) (/ (log x) (log b)))

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


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(sqrt 100)


; Somewhat hard to 'visualize' how it expands. Manual expansion:

(define (sqrt-e1 x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt-e1 100)

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cube x) (* x x x))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-p75 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(sqrt-p75 (sqrt-p75 100))
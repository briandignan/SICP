
(define (close-enough? x y)
  (< (abs (- x y)) .001))

(define (average x y) (/ (+ x y) 2.0))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value) (search f a b)))
          ((and (negative? b-value) (positive? a-value) (search f b a)))
          (else (error "Values ar enot of opposite sign" a b)))))

(half-interval-method sin 2.0 4.0)
;(half-interval-method sin 4.0 6.0)  ; Produces an error (as expected) because sin(4) and sin(6) are both negative

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)


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

(fixed-point cos 1.0)

(define (double x) (* 2 x))

;(fixed-point double 1.0)  Runs forever (as expected)
; Confirming the expectation that fixed-point runs forever on functions that don't converge

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 2)
                                     
                                     
                                     

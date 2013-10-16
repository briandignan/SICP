
(define (average x y) (/ (+ x y) 2.0))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


;;(fixed-point (lambda (x) (+ 1 (/ 1 x)))  1.0)   ; expected = 1.6180....


(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)  ; no average damping-- 38 steps


;(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)  ; with average damping-- 14 steps


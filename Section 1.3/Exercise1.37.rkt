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

(define (average x y) (/ (+ x y) 2.0))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))



(define (cont-frac-recur n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (+ (d i) (/ (n i) (d i))))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))


;(define (cont-frac-with-target n d target)
;  (define (iter i)
;    (if (< (abs (target i k)
;        (/ (n i) (+ (d i) (/ (n i) (d i))))
;        (/ (n i) (+ (d i) (iter (+ i 1))))))
;  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k (/ (n k) (d k))))


(define epsilon .00001)

(define (cont-frac-with-target n d target epsilon)  ; 
  (define (iter count acc)
    (display acc) (newline)
    (if (< (abs (- target acc)) epsilon)
        count
        (iter (+ count 1) (/ (n 1.0) (+ (d 1.0) acc)))))
  (iter 0 (/ (n 1.0) (d 1.0))))



; theta
(define theta (/ (+ 1 (sqrt 5)) 2))
(define one-div-theta (/ 1 theta))

one-div-theta
; prove that it approaches 1 div theta
(cont-frac-recur 
 (lambda (i) 1.0)
 (lambda (i) 1.0)
 1000)

(cont-frac-iter 
 (lambda (i) 1.0)
 (lambda (i) 1.0)
 1000)


; count the number of iterations required for continuous fraction to be within 4 decimal places of one-div-theta
(cont-frac-with-target 
 (lambda (i) 1.0)
 (lambda (i) 1.0)
 one-div-theta
 epsilon)

((lambda (x) (+ x 4)) 10)

(define (square x) (* x x))

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y)) 
   (- 1 y)))

(f 3 4)

(define (f2 x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(f2 3 4)


(define x 2)  ; If this line is commented out, the program doesn't compile because y MUST? be defined by some outside x?
(let ((x 3)
      (y (+ x 2)))
  (* x y))

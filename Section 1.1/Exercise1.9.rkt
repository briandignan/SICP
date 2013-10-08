;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))

(inc (+ 4 5))
(inc (inc (+ 3 5)))
(inc (inc (inc (+ 2 5))))
(inc (inc (inc (inc (+ 1 5)))))
(inc (inc (inc (inc (inc (+ 0 5))))))
(inc (inc (inc (inc (inc 5)))))
(inc (inc (inc (inc 6))))
(inc (inc (inc 7)))
(inc (inc 8))
(inc 9)
10



;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))

(+ 5 5)
(+ 4 6)
(+ 3 7)
(+ 2 8)
(+ 1 9)
(+ 0 10)
10
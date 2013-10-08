(define (pascal r c)
  (cond ((and (= r 0) (= c 0)) 1)
        ((or (< r 0) (< c 0) (> c r)) 0)
        (else (+ (pascal (- r 1) c) (pascal (- r 1) (- c 1))))))

(pascal 0 0) ; expected 1
(pascal -1 0) ; expected 0
(pascal 2 2) ; expected 1
(pascal 2 1) ; expected 2
(pascal 4 1) ; expected 4
(pascal 4 2) ; expected 6
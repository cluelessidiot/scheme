(define (even-avg ls)
  (define even-sum
    (lambda (ls sum ct)
     (if (null? ls)
      (/ sum ct)
     (if(= 0 (modulo (car ls) 2))(even-sum(cdr ls)(+ sum (car ls))(+ ct 1))
      (even-sum (cdr ls) sum ct)))))
  (if (null? ls)
  "ERROR...ENTER A VALID ARRAY"
   (even-sum ls 0 0)))

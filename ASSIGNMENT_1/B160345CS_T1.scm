;take one element and compare with remaining elements 
;and it will print value if search is unsuccesfull 
;or else increment the variable 'l
;linear serach function will act as condition to remove-duplicates


(define (linearsearch ar n)
(if(null? ar)#f
    (if(= n (car ar))#t 	
	   (linearsearch (cdr ar) n)
	)
)

)
;take one element and search it with remaining elements
;output will contain elements printed only if its not repeated in sub list.
;if the element used for searching is given out if its not in subarray.

(define (remove-duplicates ls)
  (cond ((null? ls)
         '())
        ((linearsearch (cdr ls) (car ls))
         (remove-duplicates (cdr ls)))
        (else
         (cons (car ls) (remove-duplicates (cdr ls))))))
		
		 

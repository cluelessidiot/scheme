(define (sum ls)
 (if(null? ls)0
 (+ (car ls) (sum(cdr ls)))))
 ;input:list of marks of each students
 ;output:total marks of each students

 (define (roll-sum ls)
  (if(null? ls)'()
  (cons(cons(car(car ls)) (cons(sum (car(cdr(cdr(car ls))))) '())) (roll-sum (cdr ls)))))
  ;input:list of student record.
  ;output:return a list of pairs, where each pair is student's roll no and total marks.
  
    (define (sum-only ls)
  (if(null? ls)'()
  (cons(car(cdr(car ls)))(sum-only (cdr ls)))))
  ;input:list of pairs, where each pair is student's roll no and total marks.
  ;output:list of total sum of marks of students.
  
   (define (largest ls)
  (if(null? (cdr ls))(car ls)
  (if(< (car ls) (car(cdr ls)))(largest (cdr ls))
  (largest(cons(car ls)(cddr ls))))))
  
  ;input:list of total sum of marks of each students.
  ;output:largest element of list. 
  
  
    
  (define (check-list l ls)
  (if(null? ls)'()
  (if(= l (car(cdr(car ls))))(caar ls)
  (check-list l (cdr ls)))))
  ;input:calls two arguments ,one is largest elements of sum only set,other is list that containing rollnumber andmark as pair of each students.
  ;output:return roll number of student having highest marks
  ;------main------
  ;input:list of student record.
  ;output;return the roll no of student having highest mark.
  
  (define (topper ls)
   (check-list (largest (sum-only (roll-sum ls))) (roll-sum ls))  
  
  )

 
 

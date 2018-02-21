
;SELECTORS AND CONSTRUCTORS;
(define make-bankDb list)
(define (get-first-accountRecord bankDb) (car bankDb))
(define (get-rest-accountRecord bankDb) (cdr bankDb))

(define (make-accountRecord accNo txnList) (list accNo txnList))
(define (get-accNo accountRecord)(car accountRecord))
(define (get-txnList accountRecord)(car (cdr accountRecord)))

(define make-txnList list)
(define (get-first-txn txnList)(car txnList))
(define (get-rest-txn txnList)(cdr txnList))

(define (make-txn txnNo txnDt txnAmt) (list txnNo txnDt txnAmt))
(define (get-txnNo txn)(car txn)) 
(define (get-txnDt txn)(car(cdr txn)))
(define (get-txnAmt txn)(car (cddr txn)))

(define (make-txnDt dd mm yyyyy)(list dd mm yyyyy))
(define (get-dd txnDt)(car txnDt))
(define (get-mm txnDt)(car (cdr txnDt)))
(define (get-yyyy txnDt)(car(cdr(cdr txnDt))))


(define (check? ls)
(if(null? ls)#t #f))
;CHECK? return if list is null

(define (listcheck? ls1 ls2)
 (if(equal? ls1 ls2)#t #f))
 ;listcheck? compare two list and return true if both are equal,else false.
 

(define (pickTxns txnList txnDt)
(if(check? txnList)'()
(if(listcheck? (get-txnDt(get-first-txn txnList)) txnDt)
(cons(get-first-txn txnList)(pickTxns (get-rest-txn txnList) txnDt))(pickTxns (get-rest-txn txnList) txnDt))))
;input:txnlist and date of txn.
;output:returns the list of transactions which occured on the given txnDt

;input:bankDb and txnDt
;output;Collection of only those accountRecords in the bankDb with at least one transaction on the given txnDt.
(define(getRecordsOnDate bankDb txnDt)
	(if(check? bankDb)
		'()
		(if(check? (pickTxns (get-txnList(get-first-accountRecord bankDb)) txnDt))
				(getRecordsOnDate(get-rest-accountRecord bankDb) txnDt)
				(cons(get-first-accountRecord bankDb)(getRecordsOnDate (get-rest-accountRecord bankDb) txnDt)))))

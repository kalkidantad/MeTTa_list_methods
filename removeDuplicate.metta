
 ; Define the type signature for removeDuplicate
(: removeDuplicate (-> (List $t) (List $t)))

 ; Base case: an empty list has no duplicates
(= (removeDuplicate ()) ())

 ; Recursive case: check if the head is already in the tail
(= (removeDuplicate (:: $h $t))
    (if (contains $h $t) ; Check if the head $h is in the tail $t
        (removeDuplicate $t) ; If it is, skip it and continue removing duplicates from the tail
        (:: $h (removeDuplicate $t)))) ; If not, include $h and continue removing duplicates from the tail
 ; Define the type signature for contains
(: contains (-> $t (List $t) Bool))

 ; Base case for contains an empty list does not contain any elements
(= (contains $x ()) False)

 ; Recursive case for contains check if head equals x, or if x is in the tail
(= (contains $x (:: $h $t))
    (if (== $x $h)
        True ;
        (contains $x $t))) ;

! (removeDuplicate (:: 1 (:: 2 (:: 2 (:: 3 (:: 1 ()))))))
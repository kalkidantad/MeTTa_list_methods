
 ; Define the type signature for removeDuplicate
(: removeDuplicate (-> (List $t) (List $t)))

 ; Base case: an empty list has no duplicates
(= (removeDuplicate Nil) Nil)

 ; Recursive case: check if the head is already in the tail
(= (removeDuplicate (Cons $h $t))
    (if (contains $h $t) ; Check if the head $h is in the tail $t
        (removeDuplicate $t) ; If it is, skip it and continue removing duplicates from the tail
        (Cons $h (removeDuplicate $t)))) ; If not, include $h and continue removing duplicates from the tail
 ; Define the type signature for contains
(: contains (-> $t (List $t) Bool))

 ; Base case for contains an empty list does not contain any elements
(= (contains $x Nil) False)

 ; Recursive case for contains check if head equals x, else if x is in the tail
(= (contains $x (Cons $h $t))
    (if (== $x $h)
        True
        (contains $x $t)))

! (removeDuplicate (Cons 1 (Cons 2 (Cons 2 (Cons 3 (Cons 1 Nil))))))


 ; Define the type signature for removeElement
(: removeElement (-> $t (List $t) (List $t)))

 ; Base case: an empty list has no elements to remove
(= (removeElement $x ()) ())

 ; Recursive case: if the head equals the element, skip it; otherwise, include it
(= (removeElement $x (:: $h $t))
    (if (== $x $h)
        (removeElement $x $t)
        (:: $h (removeElement $x $t))))
! (removeElement 2 (:: 1 (:: 2 (:: 2 (:: 3 (:: 2 ()))))))
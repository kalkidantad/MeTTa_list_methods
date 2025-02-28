
 ; Define the type signature for removeElement
(: removeElement (-> $t (List $t) (List $t)))

 ; Base case: return Nil when reaching the end of the list
(= (removeElement $x Nil) Nil)

 ; Recursive case: if the head equals the element, skip it; otherwise, construct it
(= (removeElement $x (Cons $h $t))
    (if (== $x $h)
        (removeElement $x $t)
        (Cons $h (removeElement $x $t))))

! (removeElement 2 (Cons 1 (Cons 2 (Cons 2 (Cons 3 (Cons 2 Nil))))))


 ; when the list is empty the length is 0
 ; otherwise, prepend 1's and calculate their sum

(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))
! (length (Cons A (Cons B (Cons C Nil))))

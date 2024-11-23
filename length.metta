
 ; when the list is empty the length is 0 ,
 ; for a list with at least one value
 ; calculate 1 plus the length of tail

(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))
! (length (Cons A (Cons B (Cons C Nil))))
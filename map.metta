 ; Define the Map function that takes a function $f and a list, returning a new list
(= (Map $f Nil) Nil) ; if empty , return an empty list

(= (Map $f (Cons $h $t)) ; otherwise, the list has a head and tail
    ( ($f $h) (Map $f $t)) ; apply the function $f to the head element $h and recursively map $f over the tail $t
)

 ; Let's use a Cubic function that returns the cubic value of the input
(= (Cubic $p ) (* $p (* $p $p)))
! ( Map Cubic (Cons 5 (Cons 3 Nil)))

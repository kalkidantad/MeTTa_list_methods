 ; put you code here
 ; appending an empty list to any list results the list itself
 ; appending $ys to the list gives new list with the head as $x and the rest as $x

(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys)
    (Cons $x (append $xs $ys)))

! (append () (Cons 1 (Cons 2 (Cons 3 ()))))

 ; append takes two arguments - xs (the list to append to) and ys (the list to be appended)
 ; check conditions - If xs is empty , simply return ys (since appending an empty list doesn't change the second list)
 ; Otherwise, we use destructure (symbolized by ((else $x $t)) to split xs into the head element ($x) and the tail ($t))

(append $xs $ys)
(if (== $xs ()) True

)
(: appends (-> $p (List $p) (List $p)))
(= (appends $x (:: $h $t))
    (if  ))

 ; the function takes another function as an input and list
 ; if the list is empty return empty
 ; otjerwise, take the head and tail and check if

(: filters ())
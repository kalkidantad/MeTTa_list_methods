
 ; recieves a function with type t to bool and a list then return a list
(: filters (-> (-> $t Bool) (List $t) (List $t)))

 ;basecase
(= (filters $f Nil) Nil)

 ; recursive case,
(= (filters $f (Cons $h $t))
    (if ($f $h) ; Check if the predicate function $f returns true for the head element $h.
        (Cons $h (filters $f $t)) ; If true, include the head $h in the result list, followed by applying filter on the rest
        (filters $f $t))) ; If false, skip the head $h and just continue filtering the rest.

 ; let's take even as predicate function to return bool

(: even (-> Number Bool))
(= (even Nil) Nil)
(= (even $x ) (== (% $x 2) 0))

 ; ! (even 9)
 ! (filters even (Cons 1 (Cons 0 (Cons 3 (Cons -4 Nil)))))

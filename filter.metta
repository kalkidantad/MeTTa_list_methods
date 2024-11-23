
 ; takes a function from type t to bool and a list then return a list
(: filters (-> (-> $t Bool) (List $t) (List $t)))

 ;basecase , if empty return empty list
(= (filters $f ()) ())

 ; recursive case,
(= (filters $f (:: $h $t)) ; takes the function and the list
    (if ($f $h) ; Check if the predicate function $f returns true for the head element $h.
        (:: $h (filters $f $t)) ; If true, include the head $h in the result list, followed by the result of filtering the tail $t.
        (filters $f $t))) ; If false, skip the head $h and just continue filtering the tail $t.

 ; let's take lessthan_zero as predicate function

(: lessthan_zero (-> Number Bool))
(= (lessthan_zero ()) ())
(= (lessthan_zero $x ) (< $x 0))

(lessthan_zero -2)
! (filters lessthan_zero (:: 1 (:: -2 (:: 3 ()))))

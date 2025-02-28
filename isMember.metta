
 ; the function takes two arguments and returns bool val
(: isMember (-> $x (List $x ) Bool))
 ; base case when empty return false, the passed argument is not a member
(= (isMember $y Nil) False )
 ; let's define head as $h and the rest as $x
(= (isMember $y (Cons $h $x))
    (if (== $y $h) True
        (isMember $y $x))
)
! (isMember 9 (Cons 3 (Cons 7 (Cons 0 Nil))))

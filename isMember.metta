
 ; the function takes two arguments and returns bool val, defining type signature
(: isMember (-> $x (List $x ) Bool))
 ; base case when empty return false meaning $y(input ) is not a member
(= (isMember $y ()) False )
 ; let's define head as $h and the rest as $x
(= (isMember $y (:: $h $x))
    (if (== $y $h) True
        (isMember $y $x))
)
! (isMember 9 (:: 3 (:: 7 (:: 0 ()))))

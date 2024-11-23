 ; append method

 ; assume $t as tail and $h as head

(: append (-> (List $t) $t) (List $t) ) ; Type definition
(= (append () $x ) (:: $x ())) ; when empty list found return the appended value
(= (append (:: $h $t) $x ) (:: $h (append $t $x))) ; recursively add to the end

! (append (:: 1 (:: 5 (:: 10 ()))) 15)

; let $t as tail and $h as head
; Type definition
(: append (-> (List $l) $l) (List $l) ) 
 ; base case
(= (append Nil $x ) (Cons $x Nil)) 
 ; recursive case to 
(= (append (Cons $h $l) $x ) (Cons $h (append $l $x))) 

! (append (Cons 1 (Cons 5 (Cons 10 Nil))) 15)

(: removeElement (->  (List $t) $t (List $t)))
(= (removeElement Nil $x) Nil)
(= (removeElement (List $x) Nil) (List $x))

(= (removeElement (Cons $h $t) $x)
    (if (== $h $x) $t (Cons $h (removeElement $t $x)))
)

; ! (removeElement (Cons 99 (Cons 88 Nil)) 00 )

(: findMin (-> (List Number) Number))
 ; receives list and calls smallest on that list passing the Head of the list as $min and the rest as the list 
(= (findMin Nil) Nil)
(= (findMin (Cons $h $t)) (smallest $t $h))


(: smallest (->  (List Number) Number Number))
 ; receives list and returns minimum by comparing head with the rest of the list
(= (smallest Nil $min) $min)
(= ( smallest (Cons $h $t) $min)
    (if (< $h $min) (smallest $t $h) (smallest $t $min)))

(= (sort Nil) Nil)
(= (sort (Cons $h $t))
    (let* (
            ($min (findMin (Cons $h $t)))
            ($removedList (removeElement (Cons $h $t) $min))
        )
    (let () (println! ($removedList))
        (Cons $min (sort $removedList))
    )
)
)
! (sort (Cons 9 (Cons 19 (Cons 6 (Cons 16 (Cons 11 (Cons 0 Nil)))))))

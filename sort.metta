(: removeElement (->  (List $t) $t (List $t)))
(= (removeElement () $x) ())
(= (removeElement (List $x) ()) (List $x))

(= (removeElement (:: $h $t) $x)
    (if (== $h $x) $t (:: $h (removeElement $t $x)))
)

! (removeElement (:: 99 (:: 88 ())) 00 )

(: findMin (-> (List Number) Number))
(: helper (->  (List Number) Number Number))
(= (findMin (:: $h $t)) (helper $t $h))
(= (findMin ()) ())

(= (helper () $min) $min)
(= ( helper (:: $h $t) $min)
    (if (< $h $min) (helper $t $h) (helper $t $min)))

(= (sorts ()) ())
(= (sorts (:: $h $t))
    (let* (
            ($min (findMin (:: $h $t)))
            ($removedList (remove (:: $h $t) $min))
        )
    (let () (println! ($removedList))
        (:: $min (sorts $removedList))
    )
)
)
! (sorts (:: 9 (:: 19 (:: 6 (:: 16 (:: 11 (:: 0 ())))))))
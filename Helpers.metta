
 ; updateFrequency()
 ; updates the frequency of an element in a frequency list. If the element exists, increment its count; otherwise, add it with a count of 1.
(: updateFrequency (-> $t (List (Pair $t Number)) (List (Pair $t Number))))

 ; Base case: an empty list means we add the element with frequency 1
(= (updateFrequency $x ())
    (:: (Pair $x 1) ()))

 ; Recursive case: if the head matches, increment its frequency; otherwise, recurse on the tail
(= (updateFrequency $x (:: (Pair $k $v) $t))
    (if (== $x $k)
        (:: (Pair $k (+ $v 1)) $t)
        (:: (Pair $k $v) (updateFrequency $x $t))))

 ; Define the type signature for countFrequency
(: countFrequency (-> (List $t) (List (Pair $t Number))))

 ; Base case: an empty list has no frequency
(= (countFrequency ()) ())

 ; Recursive case: check if the head of the list is already in the result, and update its frequency
(= (countFrequency (:: $h $t))
    (updateFrequency $h (countFrequency $t)))

 ; Test case
! (countFrequency (:: 3 (:: 1 (:: 2 (:: 2 (:: 3 (:: 1 ())))))))

 ; getMinElement
(: getMinElement (-> (List (Pair $t Number)) $t))

 ; Base case: an empty frequency list should return a default value or raise an error
(= (getMinElement ()) (error "Cannot get minimum element from an empty list."))

 ; Base case: the minimum of a single pair is the element itself
(= (getMinElement (:: (Pair $k $v) ())) $k)

 ; Recursive case: compare the current head with the smallest of the rest
(= (getMinElement (:: (Pair $k1 $v1) (:: (Pair $k2 $v2) $t)))
    (if (< $v1 $v2) ; Compare frequencies, not keys
        (getMinElement (:: (Pair $k1 $v1) $t))
        (getMinElement (:: (Pair $k2 $v2) $t)))
)

 ; getMinFrequency
(: getMinFrequency (-> (List (Pair $t Number)) Number))

 ; Base case: the frequency of a single pair is its frequency
(= (getMinFrequency (:: (Pair $k $v) ())) $v)

 ; Recursive case: compare the frequency of the current pair with the rest
(= (getMinFrequency (:: (Pair $k1 $v1) (:: (Pair $k2 $v2) $t)))
    (if (< $v1 $v2) ; Compare frequencies, not keys
        $v1
        (getMinFrequency (:: (Pair $k2 $v2) $t)))
)

 ; removeElementFreq
(: removeElementFreq (-> $t (List (Pair $t Number)) (List (Pair $t Number))))

 ; Base case: removing an element from an empty list does nothing
(= (removeElementFreq $x ()) ())

 ; Recursive case: skip the pair if it matches, otherwise keep it
(= (removeElementFreq $x (:: (Pair $k $v) $t))
    (if (== $x $k)
        (removeElementFreq $x $t) ; Correctly recurse on the tail
        (:: (Pair $k $v) (removeElementFreq $x $t))) ; Keep the current pair and recurse
)

 ; append
(: append (-> (List $t) $t (List $t)))
(= (append () $x) (:: $x ()) ) ; when empty list found return the appended value
(= (append (:: $h $t) $x) (:: $h (append $t $x))) ; recursively add to the end

 ; replicate
(: replicate (-> $t Number (List $t)))

 ; Base case: Replicating 0 times results in an empty list
(= (replicate $x 0) ())

 ; Recursive case: Add the element and decrement the count
(= (replicate $x $n)
    (if (== $n 0) ; Check if $n is 0 to prevent infinite recursion
        ()
        (:: $x (replicate $x (- $n 1))))
)

 ;; reconstructList
(: reconstructList (-> (List (Pair $t Number)) (List $t)))

 ; Base case: an empty frequency list produces an empty sorted list
(= (reconstructList ()) ())

 ; Recursive case: find the smallest element and place it in the sorted list
 ; Recursive case for reconstructing the sorted list
(= (reconstructList $freqList)
    (if (== $freqList ())
        () ; Handle empty frequency list explicitly
        (append
            (replicate (getMinElement $freqList) (getMinFrequency $freqList))
            (reconstructList (removeElementFreq (getMinElement $freqList) $freqList)))))
 ; Linearsort()
 ; Define the type signature for linearSort
(: linearSort (-> (List $t) (List $t)))

 ; Base case: an empty list is already sorted
(= (linearSort ()) ())

 ; Recursive case: use frequency information to reconstruct the sorted list
(= (linearSort $list)
    (reconstructList (countFrequency $list)))

! (linearSort (:: 3 (:: 1 (:: 2 (:: 2 (:: 3 (:: 1 ())))))))

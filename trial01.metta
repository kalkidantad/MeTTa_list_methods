; (: Z Nat) ; Z is "zero"
; (: S (-> Nat Nat)) ; S "constructs" the next number
; ! (S Z) ; this is "one"
; ! (S (S Z)) ; this is "two"
; ! (get-type (S (S (S Z)))) ; Nat
; ! (get-type (S S)) ; not Nat
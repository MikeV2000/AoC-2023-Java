(**
let () =

  (** A recursive function called "sum" that has the parameter "u" *)
  let rec sum u =
  match u with

    (** if u matches an empty list, return 0 *)
    | [] -> 0

    (** 
        if u matches a list that has an item and a tail, call sum with the tail
        (Basically iterates through the array)
     *)
    | x :: v -> x + sum v
*)

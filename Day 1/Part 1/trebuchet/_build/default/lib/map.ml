(**
let () =

let square x = x * x;

  let rec map f u =
    match u with
    | [] -> []
  | x :: v -> f x :: map f v;
*)

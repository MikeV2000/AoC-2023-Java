(**
type 'a option = None | Some of 'a

let () =
  let f opt = match opt with
    | None -> None
    | Some None -> None
    | Some (Some x) -> Some x
*)

let read_file filename process =
  let ic = open_in filename in
  let rec read_lines sum =
    try
      let line = input_line ic in
      let new_sum = sum + process line in
      read_lines new_sum
    with
    | End_of_file -> close_in ic; sum
    | e -> close_in_noerr ic; raise e
  in
  read_lines 0

let rec get_num_as_string str index exit_predicate change_index =
  if exit_predicate index str then
    ""
  else
    try let c = str.[index] in
    match c with
    | '0' .. '9' -> Printf.sprintf "%c" c
    | _ -> get_num_as_string str (change_index index) exit_predicate change_index
    with Failure _ -> ""

let safe_int_of_string str =
  try int_of_string str
  with Failure _ -> 0

let () =
  let filename = "input.txt" in
  let sum = read_file filename (fun str -> 
    let first_digit = get_num_as_string str 0 (fun idx str -> idx >= String.length str) (fun idx -> idx + 1) in
    let last_digit = get_num_as_string str (String.length str - 1) (fun idx _ -> idx < 0) (fun idx -> idx - 1) in
    safe_int_of_string (first_digit ^ last_digit)
  ) in
  print_endline (string_of_int sum)

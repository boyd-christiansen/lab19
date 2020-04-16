(* isu@college.harvard.edu
jfried@college.harvard.edu
mohamedahmed@college.harvard.edu
boyd_christiansen@college.harvard.edu *)


let asl : account_spec list ref = ref [] ;;

let initialize (spl : account_spec list) : unit =
  asl := spl
;;

let rec acquire_id () : id =  try let uid = read_int () in
  (* NOTE: Do better validation *)
  Printf.printf "Enter id: ";
  if (List.hd (List.filter (fun asl_index -> asl_index.id = uid) !asl)).id = [] ;;

let rec acquire_amount () : int =
  Printf.printf "Enter ammount: "; try read_int () with | _ -> acquire_amount ()


let acquire_act () : action = let uid = read_int () in
  Printf.printf "Enter action: (B) Balance (-) Withdraw (+) Deposit (=) Done (X) Exit: B";
  match read_line () with
  | "B" -> Balance
  | "-" -> Printf.printf "Enter ammount: "; Withdraw (read_int ())
  | "+" -> Printf.printf "Enter ammount: "; Deposit (read_int ())
  | "=" -> Next
  | "X" -> Finished
  | _ -> raise



  ;;

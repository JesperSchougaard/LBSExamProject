(* Test programs written here for main to use when testing parser *)

module T = Types

let labels_ttt : T.type_checker_labels =
  {pc = T.Trusted; l_i = T.Trusted; l_o = T.Trusted};;

let labels_utt : T.type_checker_labels =
  {pc = T.Untrusted; l_i = T.Trusted; l_o = T.Trusted};;
(* Minimal *)
let int_test : T.parse_tree = T.Value_node(T.Int{number = 5; label = T.Trusted});;

let bool_test : T.parse_tree =
  T.Value_node(T.Bool{b = true; label = T.Trusted});;

let plus_test : T.parse_tree =
  T.Operator_node{left = int_test; op = T.Plus; right = int_test};;


(* random test function *)
let testtypinghello() = Printf.printf "test_typing says hello! \n"
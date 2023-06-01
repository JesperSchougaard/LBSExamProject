(* Test programs written here for main to use when testing parser *)

module T = Types

(* Minimal *)
let int_test : T.parse_tree = T.Value_node(T.Int{int = 5});;






(* random test function *)
let testtypinghello() = Printf.printf "test_typing says hello! \n"
(* Main file for type checking *)

module T = Types

exception NotImplemented

(* Define types needed *)

(* Type checker gets as input a variable environment, two labels, and a parse_tree *)
(* If all typed sub-expressions/programs evaluate to true, then the entire program is true *)
let rec type_checker 
  (gamma: string -> T.types) (pc: string)
  (lambda_input: string) (lambda_output: string) 
  (pt: T.parse_tree) : bool =
  match pt with
  | Value_node value -> true
  | Operator_node {left; operator; right} -> true
  | Sequence_node list -> true
  | Lock_node {label; body} -> true
  | If_node {condition; then_branch; else_branch} -> true
  | Call_node {func_name; args} -> true

(* random test function *)
let typinghello = print_endline "\n typing says hello!"
(* Main file for type checking *)

module T = Types

exception NotImplemented

(* Define types needed specifically for typechecker  *)





(* Helper functions *)

let type_check_val(value: T.value) : T.typed_tree = match value with
    | Int {int} -> T.Int{typ = T.Int; int} (* No label requirement for values *)
    | Bool _ -> raise NotImplemented (* Check label stuff *)

(* Type checker gets as input a variable environment,
   two labels, and a parse_tree. If all typed sub-expressions/programs
   evaluate to true, then the entire program is true. *)
let rec type_check
  (gamma: map:string -> T.base_type) (pc: string)
  (l_i: string) (l_o: string)
  (pt: T.parse_tree) : T.typed_tree =
  match pt with
  | Value_node value -> type_check_val value
  | Operator_node {left; op; right} -> (
    (* Recursively check left and right expression *)
    (* CHECK FOR UPPER / LOWER BOUND SECURITY LABELS *)
    let left_t = type_check gamma pc l_i l_o left in
    let right_t = type_check gamma pc l_i l_o right in 
    T.Operator_t{left = left_t; op; right = right_t} )
  | Sequence_node _ -> raise NotImplemented
  | Lock_node _ -> raise NotImplemented
  | If_node _ -> raise NotImplemented
  | Let_node _ -> raise NotImplemented
  | Call_node _ -> raise NotImplemented



(* random test function *)
let typinghello() = Printf.printf "typing says hello! \n"
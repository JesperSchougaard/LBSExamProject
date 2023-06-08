(* Main file for type checking *)

module T = Types

exception NotImplemented

(* Helper functions *)

let type_check_val (value: T.value): T.typed_tree =
  match value with
  | Int {number; label} ->
    Printf.printf "int value: %i \n" number;
    T.Int_t {typ = {typ = Int; label}; int = number}
  | Bool {b; label} ->
    Printf.printf "bool and label value: %B, %s \n" b (T.label_to_string label);
    T.Bool_t {typ = {typ = Bool; label}; bool = b}

let get_typ (tt: T.typed_tree): T.tau =
  match tt with 
  | Int_t {typ; _} -> typ
  | Bool_t {typ; _} -> typ
  | Operator_t {typ; _} -> typ
  | Lock_t {typ; _} -> typ
  | Endorse_t {typ; _} -> typ

(* Type checker gets as input a variable environment,
   two labels, and a parse_tree. If all typed sub-expressions/programs
   evaluate to true, then the entire program is true. *)

let rec type_check
  (gamma) (labels: T.type_checker_labels) (pt: T.parse_tree) : T.typed_tree =
  match pt with
  | Value_node value -> type_check_val value
  | Operator_node {left; op; right} -> (
    (* Recursively check left and right expression.
       If base types of left and right differ throw an error,
       otherwise make typed_tree with integer base type and 
       PC levels integrity as label, i.e., current PC trusted
       means result of operation should be trusted *)
    (* Nooo... Make it least upper bound of each label in left/right? *)
    let left_t = type_check gamma labels left in
    let left_typ = get_typ(left_t) in
    let right_t = type_check gamma labels right in
    let right_typ = get_typ(right_t) in
    if left_typ.typ != right_typ.typ then (
      Printf.printf "operator missmatch \n";
      raise NotImplemented)
    else
    T.Operator_t{left = left_t; op; right = right_t;
                 typ = {typ = T.Int; label = labels.pc}})
  | Sequence_node _ -> raise NotImplemented
  | Lock_node _ -> raise NotImplemented
  | If_node _ -> raise NotImplemented
  | Let_node _ -> raise NotImplemented
  | Call_node _ -> raise NotImplemented



(* random test function *)
let typinghello() = Printf.printf "typing says hello! \n"
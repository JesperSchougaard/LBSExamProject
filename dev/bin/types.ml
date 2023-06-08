(* File containing list of types *)

type label =
  | Trusted
  | Untrusted
  | Lock

(* Just for printing labels to terminal when testing stuff *)
let label_to_string(label) : string = match label with
  | Trusted -> "Trusted"
  | Untrusted -> "Untrusted"
  | Lock -> "Lock"

type value =
    Int of {label: label; number: int}
  | Bool of {label: label; b: bool}

type operator =
    Plus
  | Minus
  | Mult

(* abstract syntax tree (AST) *)
type exp =
  | Val_exp of value (* value *)
  | Op_exp of {l: exp; op: operator; r: exp} (* operator *)
  | Seq_exp of exp list (* sequence *)
  | Lock_exp of {label: label; body: exp} (* lock *)
  | Call_exp of { func_name: string; args: exp list } (* function call *)
  | If_exp of {cond: exp; then_exp: exp; else_exp: exp} (* if *)
  (*| AssignExp of { var_name: string; assigned_exp: expression }*) (* assignment *)
  (* Is there any difference between assign and let? Func languages only allow consts*)
  | Let_exp of {var_name: string; var_exp: exp; body_exp: exp} (* let *)

(* intermediate representation *)
type parse_tree =
| Value_node of value
| Operator_node of {left: parse_tree; op: operator; right: parse_tree}
| Sequence_node of parse_tree list
| Lock_node of {label: label; body: parse_tree}
| If_node of {condition: parse_tree; then_branch: parse_tree; else_branch: parse_tree}
| Let_node of {var_name: label; var_exp: parse_tree; body_exp: parse_tree}
| Call_node of {func_name: label; args: label list}



(* Typechecker related *)

type base_type = Int | Bool

type tau = {typ: base_type; label: label}

type type_checker_labels = {pc: label; l_i: label; l_o: label}

type typed_tree =
  | Int_t of {typ: tau; int: int}
  | Bool_t of {typ: tau; bool: bool}
  | Operator_t of {typ: tau; left: typed_tree; op: operator; right: typed_tree; }
  (* seq *)
  | Lock_t of {typ: tau; label: label; body: typed_tree;}
  | Endorse_t of {typ: tau; value: value; label: label; label': label}
  (* Callexp *)
  (* If *)

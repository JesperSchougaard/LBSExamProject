(* File containing list of types *)

type label =
  | Trusted
  | Untrusted

type value = 
  | Int of {int: int} (* Ints do not need labels *)
  | Bool of {bool: bool; label: string} (* Bools need labels *)

type operator =
    Plus
  | Minus
  | Mult

(* abstract syntax tree (AST) *)
type exp =
  | Val_exp of value (* value *)
  | Op_exp of {l: exp; op: operator; r: exp} (* operator *)
  | Seq_exp of exp list (* sequence *)
  | Lock_exp of {label: string; body: exp} (* lock *)
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
| Lock_node of {label: string; body: parse_tree}
| If_node of {condition: parse_tree; then_branch: parse_tree; else_branch: parse_tree}
| Let_node of {var_name: string; var_exp: parse_tree; body_exp: parse_tree}
| Call_node of {func_name: string; args: string list}



(* Typechecker related *)

type base_type = Int | Bool

type tau = {typ: base_type; label: string}

type typed_tree =
  | Int of {typ: base_type; int: int} (* Preserve the value of the integer *)
  | Bool_t of {typ: tau; label: string}
  | Operator_t of {left: typed_tree; op: operator; right: typed_tree}
  (* seq *)
  | Lock_t of {label: string; body: exp; typ: tau}
  | Endorse_t of {value: value; label: string; label': string; typ: tau}
  (* Callexp *)
  (* If *)

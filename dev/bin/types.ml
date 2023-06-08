(* File containing list of types *)

(* Parser related *)


type label = Trusted | Untrusted

type value =
  | Int of { label: label; number: int }
  | Bool of { label: label; b: bool }


type operator =
    Plus
  | Minus
  | Mult

(* abstract syntax tree (AST) *)  
type expression =
  | Val_exp of value (* value *)
  | Op_exp of {l: expression; op: operator; r: expression} (* operator *)
  | Seq_exp of expression list (* sequence *)
  | Lock_exp of {label: string; body: expression} (* lock *)
  | Call_exp of { func_exp: expression; args: expression list } (* function call *)
  | If_exp of {cond: expression; then_exp: expression; else_exp: expression} (* if *)
  (*| AssignExp of { var_name: string; assigned_exp: expression }*) (* assignment *) (* Is there any difference between assign and let? Func languages only allow consts*)
  | Let_exp of {var_name: string; var_exp: expression; body_exp: expression} (* let *)

(* intermediate representation *)
type parse_tree =
| Value_node of value
| Operator_node of {left: parse_tree; operator: operator; right: parse_tree}
| Sequence_node of parse_tree list
| Lock_node of {label: string; body: parse_tree}
| If_node of {condition: parse_tree; then_branch: parse_tree; else_branch: parse_tree}
| Let_node of {var_name: string; var_exp: parse_tree; body_exp: parse_tree}
| Call_node of {func_name: string; args: string list}



(* Typechecker related *)

type types =
    Int of {label: string; typ: int}
  | Bool of {label: string; typ: bool}

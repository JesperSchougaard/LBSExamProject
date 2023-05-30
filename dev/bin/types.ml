(* File containing list of types *)

(* Parser related *)

type value =
    Int of {label: string; number: int}
  | Bool of {label: string; b: bool}

type operator =
    Plus
  | Minus
  | Mult

type expression =
  | ValExp of value (* value *)
  | OpExp of {l: expression; op: operator; r: expression} (* operator *)
  | SeqExp of expression list (* sequence *)
  | LockExp of {label: string; body: expression} (* lock *)
  (*| callexp *)
  | IfExp of {cond: expression; then_exp: expression; else_exp: expression} (* if *)
  (*| assignment - will require a variable environment to make sense *)
  | LetExp of {var_name: string; var_exp: expression; body_exp: expression} (* let *)

type parse_tree =
| Value_node of value
| Operator_node of {left: parse_tree; operator: operator; right: parse_tree}
| Sequence_node of parse_tree list
| Lock_node of {label: string; body: parse_tree}
| If_node of {condition: parse_tree; then_branch: parse_tree; else_branch: parse_tree}



(* Typechecker related *)

type types =
    Int of {label: string; typ: int}
  | Bool of {label: string; typ: bool}

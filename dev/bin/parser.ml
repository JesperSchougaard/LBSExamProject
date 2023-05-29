(* Main file for parsing *)


(* Exceptions *)

exception NotImplemented

(* Define types needed  *)

type val =
    Int of int
  | Bool of bool

type operator =
    Plus
  | Minus
  | Mult

type expression = 
  | ValExp of val (* value *)
  | OpExp of {l: expression; op: operator; r: expression} (* operator *)
  | SeqExp of expression list (* sequence *)
  | LockExp of {label: string; body: expression} (* lock *)
  (*| callexp *)
  | IfExp of {cond: expression; then_exp: expression; else_exp: expression} (* if *)
  (*| assignment - will require a variable environment to make sense *)
  | LetExp of {var_name: string; var_exp: expression; body_exp: expression} (* let *)

type parse_tree =
| ValueNode of val
| OperatorNode of {left: parse_tree; operator: operator; right: parse_tree}
| SequenceNode of parse_tree list
| LockNode of {label: string; body: parse_tree}
| IfNode of {condition: parse_tree; then_branch: parse_tree; else_branch: parse_tree}


let parse_value (v: value) : value =
  match v with
  | Int i -> Int i
  | Bool b -> Bool b

let parse_if (cond: expression) (then_exp: expression) (else_exp: expression) : parse_tree =
  let parsed_cond = parse_exp cond in
  let parsed_then = parse_exp then_exp in
  let parsed_else = parse_exp else_exp in
  IfNode {condition = parsed_cond; then_branch = parsed_then; else_branch = parsed_else}
  (* Construct appropriate parse tree node for if expression *)
  (* raise NotImplemented *)

  let parse_let (var_name: string) (var_exp: expression) (body_exp: expression) : parse_tree =
    let parsed_var_exp = parse_exp var_exp in
    let parsed_body_exp = parse_exp body_exp in
    (* Logic to handle let expression, Need assignment *)
    raise NotImplemented  



(* Rather than make statements, we essentially make due with expressions. *)
(* So, we move directly onto configuration *)

type config =
  { ct: ??? (* Class table *)
  ; sigma: ??? (* Heap map locations -> value-type pair *)
  ; m: ??? (* List of integrity labels, executing code *)
  ; l: ??? (* List of integrity labels, dynamic *) }


(* Parsing takes an expression and a configuration, returning a parse-tree to give to the type checker *)
(* Configuration gets modified throughout parsing, and so is not passed around *)
let rec parse (expression: expression) (c: config) : parse_tree = 
  let rec parse_exp (e: expression) : exp =
    match e with
    | ValExp v -> ValueNode (parse_value v)
    | OpExp l op r -> raise NotImplemented
    | SeqExp exp_list -> raise NotImplemented
    | LockExp {label; body} ->
    let parsed_label = parse_exp label in
    let parsed_body = parse_exp body in
    (* Logic to handle lock expression *)
    raise NotImplemented
    | IfExp {cond; then_exp; else_exp} -> parse_if cond then_exp else_exp
    | LetExp {var_name; var_exp; body_exp} -> parse_let var_name var_exp body_exp
  
  in parse_exp expression


(* random test function *)
let parserhello = print_endline "\n parser says hello!"


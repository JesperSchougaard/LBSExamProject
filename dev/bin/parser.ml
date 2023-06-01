(* Main file for parsing *)


(* Exceptions *)

exception NotImplemented

(* Define types needed  *)

module T = Types

let parse_value (v: T.value) : T.value =
  match v with
  | Int i -> Int i
  | Bool b -> Bool b


let parse_if (cond: T.expression) (then_exp: T.expression) (else_exp: T.expression) : T.parse_tree =
  let parsed_cond = parse_exp cond in
  let parsed_then = parse_exp then_exp in
  let parsed_else = parse_exp else_exp in
  IfNode {condition = parsed_cond; then_branch = parsed_then; else_branch = parsed_else}
  (* Construct appropriate parse tree node for if expression *)
  (* raise NotImplemented *)

let parse_let (var_name: string) (var_exp: T.expression) (body_exp: T.expression) : T.parse_tree =
  let parsed_var_exp = parse_expression var_exp in
  let parsed_body_exp = parse_expression body_exp in
  T.Let_node { var_name = var_name; var_exp = parsed_var_exp; body_exp = parsed_body_exp }

let parse_lock (label: string) (body: T.expression) : T.parse_tree =
  let parsed_body = parse_expression body in
  T.Lock_node { label = label; body = parsed_body }

let rec parse_seq_exp expressions =
  match expressions with
  | [] -> Unit_node
  | exp :: rest ->
    let _ = parse_exp exp in
    parse_seq_exp rest

(* Rather than make statements, we essentially make due with expressions. *)
(* So, we move directly onto configuration *)

type config =
  { (* sigma: map  Heap map locations -> value-type pair *) (* Not needed currently *)
    m: string list (* List of integrity labels, executing code *)
  ; l: string list (* List of integrity labels, dynamic *) }


(* Parsing takes an expression and a configuration, returning a parse-tree to give to the type checker *)
(* Configuration gets modified throughout parsing, and so is not passed around *)
let rec parse (expression: T.expression) (c: config) : T.parse_tree = 
  let rec parse_exp (e: T.expression) : T.expression =
    match e with
    | ValExp v -> ValueNode("bad", parse_value v)
    | OpExp l op r -> raise NotImplemented
    | SeqExp exp_list -> raise NotImplemented
    | LockExp {label; body} -> parse_lock label body
    | IfExp {cond; then_exp; else_exp} -> parse_if cond then_exp else_exp
    | LetExp {var_name; var_exp; body_exp} -> parse_let var_name var_exp body_exp
    | CallExp {func_exp; args} -> T.Call_node func_exp args
  
  in parse_exp expression


(* random test function *)
let parserhello = print_endline "\n parser says hello!"


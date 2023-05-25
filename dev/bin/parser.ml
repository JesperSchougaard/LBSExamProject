(* Main file for parsing *)


(* Exceptions *)

exception NotImplemented

(* Define types needed  *)

type val =
    int
  | bool

type operator =
    Plus
  | Minus
  | Mult

type expression = 
    ValExp of val (* value *)
  | OpExp of {l: expression; op: operator; r: expression} (* operator *)
  | SeqExp of expression list (* sequence *)
  (*| lock *)
  (*| callexp *)
  (*| if *)
  (*| assignment - will require a variable environment to make sense *)
  (*| let - same as above *)
  

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
    | ValExp v -> raise NotImplemented
    | OpExp l op r -> raise NotImplemented
    | SeqExp exp_list -> raise NotImplemented
  in parse_exp expression


(* random test function *)
let parserhello = print_endline "\n parser says hello!"


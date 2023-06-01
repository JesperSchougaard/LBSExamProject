(* Main file for the project:
   Here we connect the different modules together
   to perform tests of the parser and typechecker. *)

let babl() = Printf.printf "\nMain started \n";

(*module P = Parser*)
module T = Types
module Typ = Typing
module Tep = Tests_parser
module Tet = Tests_typing;;


(*P.parserhello;*)
babl();
Tep.testparserhello();
Tet.testtypinghello();
  
  

(* Main file for the project:
   Here we connect the different modules together
   to perform tests of the parser and typechecker. *)

(*module P = Parser*)
module T = Types

module Typ = Typing
module Tep = Tests_parser
module Tet = Tests_typing
module Gamma = Map.Make(String);;

Printf.printf "\nMain started \n";
Tep.testparserhello();
Tet.testtypinghello();

Printf.printf "Running int_test \n";
Typ.type_check Gamma.empty Tet.labels_ttt Tet.int_test;;
Printf.printf "Running bool_test \n";
Typ.type_check Gamma.empty Tet.labels_ttt Tet.bool_test;;
Printf.printf "Running plus_test \n";
Typ.type_check Gamma.empty Tet.labels_ttt Tet.plus_test;;

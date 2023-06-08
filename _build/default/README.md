# LBSExamProject
Language-based security exam project

To run this in a docker container, have docker installed and then create a ".devcontainer" folder with a ".devcontainer.json" file containing the following:

"
{
  "image": "ocaml/opam",
  "customizations": {
    "vscode": {
      "extensions": [],
      "settings": {
        "files.exclude": {}
      }
    }
  }
}
"

This will setup a docker container which will contain an installation of OCaml and Opam. From here, open the docker container, for example via visual studio code's docker extension, and initialize a project by using "dune init project [projectname]" in the terminal, where our projectname was simply "dev". Then switch into the new project directory and pull the codebase from github. To build, run "dune build" and for executing the build files, run "dune exec ./bin/main.exe".
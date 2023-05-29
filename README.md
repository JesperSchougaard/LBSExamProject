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

This will setup a docker container which will contain an installation of OCaml and Opam. From here, pull the code base and open the docker container, for example via visual studio code's docker extension, then *insert instructions for building and stuff*
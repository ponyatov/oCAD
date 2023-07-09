(lang dune 3.8)

(name oCAD)

(generate_opam_files true)

(source
 (github ponyatov/oCAD))

(authors "Dmitry Ponaytov <dponyatov@gmail.com>")

(maintainers "Dmitry Ponaytov <dponyatov@gmail.com>")

(license MIT)

(documentation https://url/to/documentation)

(package
 (name oCAD)
 (synopsis "CAD metasystem")
 (description "CAD metaprogramming in OCaml")
 (depends ocaml dune ocamlformat utop ocaml-lsp-server)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project

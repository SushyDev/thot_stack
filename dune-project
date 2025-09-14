(lang dune 3.10)

(package
 (name thot_stack)
 (synopsis "THOT Stack: Tailwind, HTMX, OCaml, Tyxml")
 (description "A web framework using OCaml with Dream, Tyxml, HTMX, and Tailwind")
 (depends
  dream
  tyxml
  lwt
  fmt
  ocaml
  dune
 )
)

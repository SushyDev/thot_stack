(lang dune 3.10)

(name thot_stack)
(version 1.0)

(package
 (name thot_stack)
 (synopsis "THOT Stack: Tailwind, HTMX, OCaml, Tyxml")
 (description "A web framework using OCaml with Dream, Tyxml, HTMX, and Tailwind")
  (depends
   (dream (= "1.0.0~alpha8"))
  (tyxml (>= "4.6.0"))
  (lwt (>= "5.9.2"))
  (fmt (>= "0.11.0"))
  (ocaml (>= "5.3.0"))
   (dune (= "3.20.2"))
 )
)

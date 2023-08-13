open Tyxml.Html

let heading_title = "caml my ocaml deez!"

let img_jay_diesel = 
  let src = "/dist/jay_diesel.jpg" in
  let alt = "jay diesel" in
  let width = 420 in

  img ~src ~alt ~a:[a_width width] ()

(* Not sure if this should be a function or a variable *)
let render = [
  main [
    h1 ~a:[a_class ["text-red-500"; "text-xl"]] [ txt heading_title ];
    img_jay_diesel;
  ]
]

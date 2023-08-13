open Tyxml.Html

let heading_title = "caml my ocaml deez!"
let image_src = "/static/jay_diesel.jpg"

(* Not sure if this should be a function or a variable *)
let render = [
  main [
    h1 [ txt heading_title ];
    img ~src:image_src ~alt:"jay diesel" ~a:[a_width 420] ();
  ]
]

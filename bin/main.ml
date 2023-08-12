let port = 42069

let elt_to_string (elt) = Fmt.str "%a" (Tyxml.Html.pp_elt ()) elt

let p_hello_world () =
  let open Tyxml in 
  let p_tag = Html.(p [txt ("Hello world!")]) in
  Dream.html @@ elt_to_string @@ p_tag

let () = Dream.run 
  ~port
  (fun _ -> p_hello_world ())

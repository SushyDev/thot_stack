open Tyxml

let port = 42069

let elt_to_string (elt) = Fmt.str "%a" (Tyxml.Html.pp_elt ()) elt

let p_hello_world () =
  let open Tyxml in 
  let p_tag = Html.(p [txt ("Hello world!")]) in
  Dream.html @@ elt_to_string @@ p_tag

let count = ref 0

let count_requests inner_handler request =
  count := !count + 1;
  inner_handler request

let title_elt (title_str : string) =
  let open Html in
  (title (txt title_str))

let head_elt () = 
  let open Html in
  let text = "Joe biden" in
  head (title_elt (text)) []

let html_elt () =
  let open Html in
  html (head_elt ())

let body_elt ?(content : [> Html_types.p ] Html.elt list = []) () =
  let open Html in
  body content

let page () = 
  let test = Html.(p [txt "Hello world!"]) in
  let elem_list = [test] in

  let html_elt = (
    html_elt ()
    ( body_elt ~content:elem_list () )
  ) in

  Dream.html @@ elt_to_string @@ html_elt

let () = Dream.run 
  ~port
  (* @@ Dream.logger *)
  @@ count_requests
  @@ Dream.router [
    Dream.get "/" (fun _ -> page ());
    Dream.get "/hello" (fun _ -> p_hello_world ());
    Dream.get "/static/**" @@ Dream.static "./static";
    Dream.get "/echo/:word" (fun request -> Dream.html (Dream.param request "word"));
    Dream.get "/count" (fun _ -> Dream.html (string_of_int !count));
  ]

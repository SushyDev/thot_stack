let port = 42069

let doc_to_string (page) = 
  let formatter = Tyxml.Html.pp () in
  let parser = Fmt.str "%a" formatter in 
  parser page

(* let elt_to_string (elt) = *)
(*   let formatter = Tyxml.Html.pp_elt () in *)
(*   let parser = Fmt.str "%a" formatter in  *)
(*   parser elt *)

let lwt_elt_to_string elt =
  let open Lwt.Syntax in
  let formatter = Tyxml.Html.pp_elt () in
  let parser = Fmt.str "%a" formatter in 
  let* elt = elt in
  Dream.html @@ parser @@ elt

let () = Dream.run 
  ~port
  @@ Dream.logger
  @@ Dream.livereload
  @@ Dream.router [
    Dream.get "/dist/**" @@ Dream.static "./_build/dist";
    Dream.get "/" (fun _ ->
       Dream.html
      @@ doc_to_string
      @@ Layouts.Primary.render
      @@ Pages.Home.render
    );
    Dream.get "/abouta" (fun _ ->
      Dream.html
      @@ doc_to_string
      @@ Layouts.Primary.render
      @@ Pages.About.render
    );
    Dream.get "/todo" (fun _ ->
      Dream.html
      @@ doc_to_string
      @@ Layouts.Primary.render
      @@ Pages.Todo.render
    );

    (* api *)
    Dream.put "/api/todo-add" (fun request -> 
      lwt_elt_to_string
      @@ Pages.Todo.item(request)
    );
  ]

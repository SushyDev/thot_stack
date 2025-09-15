let port = 42069

let elt_to_string page = 
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

let response_page page request = Dream.html
	@@ elt_to_string
	@@ Layouts.Primary.render (page, request)

let () = Dream.run ~port
	@@ Dream.logger
	(* @@ Dream.livereload *)
	@@ Dream.router [
		Dream.get "/dist/**" @@ Dream.static "./_build/dist";

		Dream.get "/" (response_page Home.page);
		Dream.get "/about" (response_page About.page);
		Dream.get "/todo" (response_page Todo.page);
		Dream.get "/project/:id" (fun request ->
			response_page (Project.page request) request);

		Dream.put "/api/todo-add" (fun request -> lwt_elt_to_string
			@@ Todo.item(request));
	]

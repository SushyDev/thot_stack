open Tyxml.Html
open Lib.Types

let heading_title = "about my caml"

let get_id request = Dream.param request "id"
let view_transition_card_style project = Printf.sprintf "view-transition-name: project-%s-card;" project
let view_transition_name_style project = Printf.sprintf "view-transition-name: project-%s-name;" project

let page (request) =
	let id = get_id request in
	{
		page_title = Some id;
		head = None;
		render = [
			main ~a:[a_style @@ view_transition_card_style id] [
				h1 ~a:[a_style @@ view_transition_name_style id] [
					txt id
				];
			];
		];
	}

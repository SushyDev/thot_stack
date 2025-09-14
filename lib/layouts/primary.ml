open Tyxml.Html
open Lib.Types

let page_title = "Caml layout"

let render (page, _) =
	let add_head = match page.head with
		| Some head -> head
		| None -> []; in

	let page_title = match page.page_title with
		| Some title -> title
		| None -> "Sushy"; in

	let head_elt = head (title (txt page_title)) (add_head @ [
		(meta ~a:[a_name "viewport"; a_content "width=device-width, initial-scale=1.0"] ());
		(meta ~a:[a_name "description"; a_content "Caml layout"] ());
		(link ~rel:[`Stylesheet] ~href:"/dist/assets/style.css" ());
		(script ~a:[a_src "/dist/assets/index.js"] (txt ""));
		(style [txt ""]);
	]) in

	html ~a:[a_lang "en"] (head_elt) (body page.render)

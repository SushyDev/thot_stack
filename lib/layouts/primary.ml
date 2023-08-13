open Tyxml.Html
let page_title = "Caml layout"
let src_htmx = "https://unpkg.com/htmx.org@1.9.4"

let render (elements) =
	let head_elt = head (title (txt page_title)) [
		(meta ~a:[a_name "viewport"; a_content "width=device-width, initial-scale=1.0"] ());
		(meta ~a:[a_name "description"; a_content "Caml layout"] ());
		(link ~rel:[`Stylesheet] ~href:"/dist/style.css" ());
		(script ~a:[a_src "/dist/index.js"] (txt ""));
		(script ~a:[a_src src_htmx] (txt ""));
	] in

	html ~a:[a_lang "en"] (head_elt) (body elements)

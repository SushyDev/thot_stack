open Tyxml.Html
let page_title = "Caml layout"

let render (elements) =
	let head_elt = head (title (txt page_title)) [
		(meta ~a:[a_name "viewport"; a_content "width=device-width, initial-scale=1.0"] ());
		(meta ~a:[a_name "description"; a_content "Caml layout"] ());
		(link ~rel:[`Stylesheet] ~href:"/dist/thot-stack.css" ());
		(script ~a:[a_src "/dist/index.js"] (txt ""));
	] in

	html ~a:[a_lang "en"] (head_elt) (body elements)

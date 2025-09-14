open Tyxml.Html
open Lib.Types

let heading_title = "about my caml"

let img_jay_diesel =
	let src = "/dist/jay_diesel.jpg" in
	let alt = "jay diesel" in
	let width = 420 in

	img ~src ~alt ~a:[a_width width] ()

let page = {
	page_title = Some heading_title;
	head = None;
	render = [
		main [
			h1 [ txt heading_title ];
			img_jay_diesel;
			]
		];
}

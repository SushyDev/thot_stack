open Tyxml.Html

let page_title = "Caml layout"

let render (elements) = (
			html
				(
					head (
						title (txt page_title)
					) []
				)
				(
					body elements
			) 
	)

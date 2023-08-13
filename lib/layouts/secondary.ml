open Tyxml.Html

let render (elements) = html ~a:[a_lang "en"] (head (title (txt "test")) []) (body elements)

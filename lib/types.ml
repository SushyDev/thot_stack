open Tyxml.Html

type page = {
	page_title : string option;
	head : Html_types.head_content_fun elt list_wrap option;
	render : Html_types.body_content elt list_wrap;
}

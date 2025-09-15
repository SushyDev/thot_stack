open Tyxml.Html

let button_classes_base = [
	"px-8";
	"xl:px-12";
	"py-2";
	"rounded-md";
	"font-semibold";
	"transition";
	"select-none";
]

let header elts = div ~a:[
	a_class [
		"relative";
		"bg-black";
		"h-fit";
		"md:h-[780px]";
		"px-4";
		"pt-8";
		"pb-10";
		"md:py-10";
		"flex";
		"flex-col";
		"overflow-hidden"
	];
	a_style "view-transition-name: page-top-top"
] elts

let header_flex elts = div ~a:[
	a_class [
		"flex";
		"flex-col";
		"gap-y-4";
		"md:gap-y-0";
		"md:flex-row";
		"min-h-px";
		"h-full";
		"md:pt-4"
	]; 
	a_style "view-transition-name: page-top"
] elts

let secondary_button (url, text) =
	let button_classes = button_classes_base @ [
		"hidden";
		"lg:block";
		"bg-gray-200";
		"hover:bg-gray-400";
		"text-gray-900";
	]; in
	a ~a:[a_class button_classes; a_href url] [
		txt text
	]

let primary_button (url, text) =
	let button_classes = button_classes_base @ [
		"hidden";
		"lg:block";
		"bg-red-600";
		"hover:bg-red-400";
		"text-gray-900";
	]; in
	a ~a:[a_class button_classes; a_href url] [
		txt text
	]

let header_bar (title) =
	let header_bar_container_classes = [
		"fixed";
		"w-full";
		"flex";
		"p-4";
		"inset-0";
		"pointer-events-none";
		"z-3";
	] in
	let header_bar_classes = [
		"p-4";
		"bg-white";
		"w-full";
		"rounded-xl";
		"flex";
		"items-center";
		"space-x-4";
		"h-18";
		"pointer-events-auto";
		"shadow";
	] in
	div ~a:[a_class header_bar_container_classes; a_style "view-transition-name: header-bar"] [
		div ~a:[a_class header_bar_classes] [
			span ~a:[a_class ["md:text-[1.75rem]"; "font-bold"; "ml-4"; "mr-10"; "uppercase"; "select-none"]] [ txt title];
			secondary_button ("#", "Get Started");
			secondary_button ("#", "Get Started");
			secondary_button ("#", "Get Started");
			div ~a:[a_class ["flex-1"]] [ ];
			secondary_button ("#", "Get Started");
			primary_button ("#", "Get Started");
		];
	]

let header_bar_placeholder (title) =
	let header_bar_container_classes = [
		"invisible";
		"w-full";
		"flex";
	] in
	let header_bar_classes = [
		"p-4";
		"bg-white";
		"w-full";
		"rounded-xl";
		"flex";
		"items-center";
		"space-x-4";
		"h-18";
	] in
	div ~a:[a_class header_bar_container_classes] [
		div ~a:[a_class header_bar_classes; a_style "view-transition-name: header-bar-placeholder"] [
			span ~a:[a_class ["text-[1.75rem]"; "font-bold"; "ml-4"; "mr-10"; "uppercase"]] [ txt title];
			secondary_button ("#", "Get Started");
			secondary_button ("#", "Get Started");
			secondary_button ("#", "Get Started");
			div ~a:[a_class ["flex-1"]] [ ];
			secondary_button ("#", "Get Started");
			primary_button ("#", "Get Started");
		];
	]

let goto_project_button project =
	let button_classes = button_classes_base @ [
		"block";
		"bg-red-600";
		"hover:bg-red-400";
		"text-gray-900";
	] in
	let project_url = Printf.sprintf "/project/%s" project in
	button ~a:[a_class button_classes; a_onclick (Printf.sprintf "gotoProject(event, '%s')" project_url)] [
		txt "View Project"
	]

let main_card (title, description) =
	div ~a:[a_class ["bg-white"; "w-full"; "md:w-[50%]"; "h-fit"; "flex-none"; "place-self-center"; "rounded-xl"; "px-8"; "pt-8"; "pb-8"; "flex"; "flex-col"; "align-center"]] [
		h1 ~a:[a_class ["text-6xl"; "text-black";]] [ txt title ];
		p ~a:[a_class ["font-semibold"; "leading-5"; "text-black"; "mb-6"; "mt-20"]] [
			txt description
		];
		div ~a:[a_class ["flex"; "space-x-4"]] [
			primary_button ("#", "Get Started");
			secondary_button ("#", "Learn More");
		];
	]

let blog_card (project, description) =
	let card_classes = [
		"bg-white";
		"w-[clamp(350px,50vw,65%)]";
		"md:w-full";
		"h-fit";
		"flex-none";
		"place-self-center";
		"rounded-xl";
		"p-4";
		"flex";
		"flex-col";
		"align-center";
		"text-black";
	] in
	div ~a:[a_id @@ Printf.sprintf "project-%s" project; a_class card_classes] [
		h1 ~a:[a_class ["text-2xl"]] [ txt project];
		p ~a:[a_class ["font-semibold"; "leading-5"; "mb-6"; "mt-4"]] [
			txt description
		];
		div ~a:[a_class ["flex"; "gap-x-4"; "ml-auto"]] [
			goto_project_button project;
		];
	]

let blog_card_container (blog_cards) =
	div ~a:[a_class ["md:w-[40%]"; "h-full"; "w-full"; "ml-auto"]; a_style "view-transition-name: projects"] [
		div ~a:[a_class ["h-full"; "w-full"; "rounded-xl"; "place-self-center"; "flex"; "md:flex-col"; "align-center"; "ml-auto"; "overflow-x-auto"; "md:overflow-x-none"; "md:overflow-y-auto"; "gap-4"]] blog_cards
	]

let content elts =
	div ~a:[a_class ["relative"; "h-screen"; "bg-gray-100"]; a_style "view-transition-name: content"] elts

let inset_rounding_elt =
	div ~a:[a_class ["absolute"; "inset-0"; "bg-inherit"; "h-7"; "w-full"; "rounded-t-3xl"; "-mt-6"]] []

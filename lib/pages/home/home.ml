open Tyxml.Html
open Lib.Types
open Components

let page = {
	page_title = Some "Home";

	head = Some [
		script ~a:[a_src "/dist/assets/home.js"] (txt "");
	];

	render =
		let header_title = "Sushy" in
		[
			main [
				header_bar header_title;

				header [
					canvas ~a:[a_id "background"; a_class ["absolute"; "inset-0"; "z-0"; "w-full"; "h-full"]] [];
					script ~a:[a_src "/dist/assets/plugins/webgl-background/index.js"] (txt "");

					header_bar_placeholder header_title;

					header_flex [
						main_card (
							"Lorem ipsum dolor sit amet lorem ipsum dolor",
							"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
						);

						blog_card_container [
							blog_card (
								"one",
								"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
							);
							blog_card (
								"two",
								"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
							);
							blog_card (
								"three",
								"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
							);
							blog_card (
								"four",
								"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
							);
						];
					];
				];

				content [
					inset_rounding_elt;
					(* secondary_button ("#", "Get Started") *)
				];
			]
		];
}

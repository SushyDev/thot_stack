open Tyxml.Html

let heading_title = "todo camlsa"

(* Not sure if this should be a function or a variable *)
let render = [
  main [
    h1 ~a:[a_class ["text-green-500"; "text-xl"]] [ txt "Todo List" ];
    form ~a:[
      Unsafe.string_attrib "hx-put" "/api/todo-add";
      Unsafe.string_attrib "hx-target" "#todo-list";
      Unsafe.string_attrib "hx-swap" "beforeend";
      Unsafe.string_attrib "hx-on::after-request" "this.reset()";
    ] [
        input ~a:[a_input_type `Text; a_placeholder "todo item"; a_name "todo_item"; a_class ["border"; "border-black"]] ();
        input ~a:[a_input_type `Submit; a_value "Add"; a_class ["border"; "border-black"]] ();
      ];
    ul ~a:[a_id "todo-list"] [];
  ];
]


let item request =
  let open Lwt.Syntax in
  let* body = Dream.body request in
  let stuff = Dream.from_form_urlencoded body in 
  let todo_item = List.assoc "todo_item" stuff in

  Lwt.return (li [ txt (todo_item) ])

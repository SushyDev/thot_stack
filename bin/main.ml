let port = 42069

let doc_to_string (page) = 
  let formatter = Tyxml.Html.pp () in
  let parser = Fmt.str "%a" formatter in 
  parser page

let () = Dream.run 
  ~port
  @@ Dream.router [
    Dream.get "/static/**" @@ Dream.static "./static";
    Dream.get "/" (fun _ ->
      Dream.html
      @@ doc_to_string
      @@ Layouts.Primary.render
      @@ Pages.About.render
    );
  ]

open Js_min
open Js

let page = by_id "buttonDiv"

let kButtonColors = [ "#3aa757"; "#e8453c"; "#f9bb2d"; "#4688f1" ]

class type color = object
  method color : js_string t prop
end

let () =
  List.iter (fun color ->
      let color_obj : color t  = Unsafe.obj [||] in
      color_obj##color <- string color;
      let callback _ = log_str ("color is " ^ color) in
      let onclick _ = Chrome.Storage.set ~callback Chrome.sync color_obj; true in
      let b = button ~styles:["background-color", color] ~listen:["click", onclick] [] in
      appendChild page b
    ) kButtonColors

open Js_min
open Js
open Chrome

class type color = object
  method color : js_string t prop
end


let () =
  Runtime.onInstalled (fun _details ->
      let color : color t = Unsafe.obj [||] in
      color##color <- string "#3aa757";
      Storage.set ~callback:(fun () -> log_str "color is green") sync color ;
      declarativeContent##onPageChanged##removeRules(
        undefined, wrap_callback (fun _ ->
            let url : Content.pageUrl t = Unsafe.obj [||] in
            url##hostEquals <- string "localhost";
            let state_matcher : Content.pageStateMatcher t = Unsafe.obj [||] in
            state_matcher##pageUrl <- url;
            let condition =
              jsnew (declarativeContent##_PageStateMatcher) (state_matcher) in
            let conditions = jsnew array_empty () in
            array_set conditions 0 condition;
            let action = jsnew (declarativeContent##_ShowPageAction) () in
            let actions = jsnew array_empty () in
            array_set actions 0 action;
            let rule : Content.rule t = Unsafe.obj [||] in
            rule##conditions <- conditions;
            rule##actions <- actions;
            let rules = jsnew array_empty () in
            Js.array_set rules 0 rule;
            declarativeContent##onPageChanged##addRules
              (rules, wrap_callback (fun _ -> ()))
          )
      )
    )

open Js_of_ocaml
open Js

class type condition = object end
class type action = object end

class type pageUrl = object
  method hostContains : js_string t prop
  method hostEquals : js_string t prop
  method hostPrefix : js_string t prop
  method hostSuffix : js_string t prop
  method pathContains : js_string t prop
  method pathPrefix : js_string t prop
  method pathSuffix : js_string t prop
  method queryContains : js_string t prop
  method queryEquals : js_string t prop
  method queryPrefix : js_string t prop
  method querySuffix : js_string t prop
  method urlContains : js_string t prop
  method urlEquals : js_string t prop
  method urlMatches : js_string t prop
  method originAndPathMatches : js_string t prop
  method urlPrefix : js_string t prop
  method urlSuffix : js_string t prop
  method schemes : js_string t js_array t prop
  method ports : int js_array t prop
end

class type pageStateMatcher = object
  method pageUrl : pageUrl t prop
  method css : js_string t js_array t prop
  method isBookmarked : bool t prop
end

class type rule = object
  method id : js_string t prop
  method priority : int prop
  method conditions : condition t js_array t prop
  method actions : action t js_array t prop
end

class type declarativeEvent = object
  method addRules : rule t js_array t -> ('a t -> unit) callback -> unit meth
  method removeRules : js_string t js_array t optdef -> ('a t -> unit) callback -> unit meth
  method getRules : js_string t js_array t -> ('a t -> unit) callback -> unit meth
end

class type declarativeContent = object
  method _ShowPageAction : action t constr prop
  method _SetIcon : (js_string t -> action t) constr prop
  method _RequestContentScript :
    (js_string t js_array t opt ->
     js_string t js_array t opt -> bool t opt -> bool t opt -> action t) constr prop
  method _PageStateMatcher : (pageStateMatcher t -> condition t) constr prop
  method onPageChanged : declarativeEvent t prop
end

let declarativeContent : declarativeContent t = Unsafe.variable "chrome.declarativeContent"

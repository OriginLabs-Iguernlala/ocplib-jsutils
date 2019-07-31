open Js_min
open Js
open Browser_utils
open Runtime_utils
open Tabs_utils

class type tabs = object
  method _TAB_ID_NONE : js_string t prop
  method captureTab : int opt -> imageDetails t opt -> js_string t promise t meth
  method captureVisibleTab : int opt -> imageDetails t opt -> js_string t promise t meth
  method connect : int -> 'a t opt -> port meth
  method create : 'a t -> tab t promise t meth
  method detectLanguage : int opt -> (js_string t -> unit) callback -> js_string t promise t meth
  method discard : int -> unit meth
  method discard_arr : int js_array t -> unit meth
  method duplicate : int -> tab t promise t meth
  method executeScript : int -> details t -> 'a t js_array t promise t meth
  method get : int -> tab t promise t meth
  method getAllInWindow : int opt -> tab t js_array t promise t meth
  method getCurrent : tab t promise t meth
  method getSelected : int opt -> tab t promise t meth
  method getZoom : int opt -> float t promise t meth
  method getZoomSettings : int opt -> 'a t promise t meth
  method hide : int -> js_string t js_array t promise t meth
  method hide_arr : int js_array t -> js_string t js_array t promise t meth
  method highlight : 'a t -> Dom_html.window t meth
  method insertCSS : int opt -> details t meth
  method move : int -> moveProperties -> tab t promise t meth
  method move_arr : int js_array t -> moveProperties -> tab t js_array t promise t meth
  method moveInSuccession : int js_array t -> int opt -> 'a t opt -> unit meth
  method print : unit meth
  method printPreview : unit promise t meth
  method query : tab t -> tab t js_array t promise t meth
  method reload : int opt -> 'a t opt -> unit promise t meth
  method remove : int -> unit promise t meth
  method remove_arr : int js_array t -> unit promise t meth
  method removeCSS : int opt -> details t -> unit promise t meth
  method saveAsPDF : pageSettings t -> js_string t promise t meth
  method sendMessage : int -> 'a t -> details t -> json t promise t meth
  method sendRequest : int -> 'a t -> json t promise t meth
  method setZoom : int opt -> int -> unit promise t meth
  method setZoomSettings : int opt -> zoomSettings t -> unit promise t meth
  method show : int -> unit promise t meth
  method show_arr : int js_array t -> unit promise t meth
  method toggleReaderMode : int opt -> unit promise t prop
  method update : int opt -> tab t -> tab t promise t meth
  method onActivated : 'a t event t prop
  method onActivateChanged : (int, 'a t) event2 t prop
  method onAttached : (int, 'a t) event2 t prop
  method onCreated : tab t event t prop
  method onDetached : (int, 'a t) event2 t prop
  method onHighlightChanged : 'a t event t prop
  method onHighlighted : 'a t event t prop
  method onMoved : (int, 'a t) event2 t prop
  method onRemoved : (int, 'a t) event2 t prop
  method onReplaced : (int, int) event2 t prop
  method onSelectionChanged : (int, 'a t) event2 t prop
  method onUpdated : (int, 'a t, tab t) event3 t prop
  method onZoomChanged : 'a t event t prop
end


(* this could be fixed, but we actually want to handle the first case
   differently for when there is only one case *)
let f x = function A -> x
                   + 2
                 | B -> y
                   + 3

(* consequence of the fix to the case above (from js-fun) *)
let _ =
  x
  >>= fun x ->
  try x with _ -> ()
             >>= fun x ->
             x

let f = fun x ->
  x

let f = (fun x ->
  x
)

let f g = g @@ fun x ->
    x

let f g = g @@ (fun x ->
    x
  )


(* the above should probably be consistent with: *)
let f x y = y + match x with A ->
    0

let f x y = y + (match x with A ->
    0
  )

(* wich means we may over-indent even when the block is non-closable *)

let f x y = y + match x with
  | A -> 0

let f x y = y + (match x with
  | A -> 0
  )

let f x y = y + match x with
  | A -> 0
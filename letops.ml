(* Copyright 2024 Yawar Amin

   This file is part of letops.

   letops is free software: you can redistribute it and/or modify it under the
   terms of the GNU General Public License as published by the Free Software
   Foundation, either version 3 of the License, or (at your option) any later
   version.

   letops is distributed in the hope that it will be useful, but WITHOUT ANY
   WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
   FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
   details.

   You should have received a copy of the GNU General Public License along with
   letops. If not, see <https://www.gnu.org/licenses/>. *)

module In_channel = struct
  let ( let& ) inc f =
    Fun.protect ~finally:(fun () -> In_channel.close inc) (fun () -> f inc)
end

module List = struct
  let ( let* ) l f = l |> List.map f |> List.flatten
  let ( let+ ) l f = List.map f l

  let ( and+ ) param1 param2 =
    let* val1 = param1 in
    let+ val2 = param2 in
    (val1, val2)
end

(*
module Mutex = struct
  let ( let& ) = Mutex.protect
end
*)

module Option = struct
  let ( let* ) = Option.bind
  let ( let+ ) o f = Option.map f o

  let ( and+ ) param1 param2 =
    let* val1 = param1 in
    let+ val2 = param2 in
    (val1, val2)
end

module Out_channel = struct
  let ( let& ) outc f =
    Fun.protect ~finally:(fun () -> Out_channel.close outc) (fun () -> f outc)
end

module Result = struct
  let ( let* ) = Result.bind
  let ( let+ ) r f = Result.map f r

  let ( and+ ) param1 param2 =
    let* val1 = param1 in
    let+ val2 = param2 in
    (val1, val2)
end

module Seq = struct
  let ( let* ) s f = Seq.flat_map f s
  let ( let+ ) s f = Seq.map f s

  let ( and+ ) param1 param2 =
    let* val1 = param1 in
    let+ val2 = param2 in
    (val1, val2)
end

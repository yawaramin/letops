## letops - let operators for OCaml standard library types and operations

Copyright 2024 Yawar Amin

This file is part of letops.

letops is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

letops is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
letops. If not, see <https://www.gnu.org/licenses/>.

## What

OCaml 4.08 introduced 'monadic let operators' into the language:
https://github.com/ocaml/ocaml/pull/1947

However they have not made it into the standard library yet:
https://github.com/ocaml/ocaml/pull/2170

This tiny library introduces a selection of let operators for standard library
types and operations where they make sense. The operators are:

- `let*`: monadic binding
- `let+`: map
- `and+`: applicative map (ie Cartesian join)
- `let&`: safe resource disposal

## Examples

Add optional numbers:

```
# let add_optional o1 o2 =
  Letops.Option.(let* x1 = o1 in
  let+ x2 = o2 in
  x1 + x2)
;;
val add_optional : int option -> int option -> int option = <fun>
# add_optional (Some 1) (Some 2);;
- : int option = Some 3
# add_optional (Some 1) None;;
- : int option = None
```

Cartesian production of two lists:

```
# let cartesian l1 l2 =
  Letops.List.(let+ x1 = l1
  and+ x2 = l2 in
  x1, x2);;
val cartesian : 'a list -> 'b list -> ('a * 'b) list = <fun>
# cartesian [1;2;3] [4;5;6];;
- : (int * int) list =
[(1, 4); (1, 5); (1, 6); (2, 4); (2, 5); (2, 6); (3, 4); (3, 5); (3, 6)]
```

Copying a file and safely closing both input and output files:

```
# let bufsize = 1028
let cp input_name output_name =
  let buf = Bytes.create bufsize in
  let loop = ref true in
  Letops.In_channel.(let& inc = In_channel.open_bin input_name in
  Letops.Out_channel.(let& outc = Out_channel.open_bin output_name in
  while !loop do
    match In_channel.input inc buf 0 bufsize with
    | 0 -> loop := false
    | len -> Out_channel.output outc buf 0 len
  done));;
val bufsize : int = 1028
val cp : string -> string -> unit = <fun>
# cp "README.md" "r2.md";;
- : unit = ()
```


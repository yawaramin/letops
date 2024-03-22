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

module In_channel : sig
  val ( let& ) : In_channel.t -> (In_channel.t -> 'a) -> 'a
  (** [let& inc = ... in f] ensures that [inc] is closed in the case that an
      exception is thrown from [f]. *)
end

module List : sig
  val ( let* ) : 'a list -> ('a -> 'b list) -> 'b list
  (** Monadic bind or flatmap operation on lists. *)

  val ( let+ ) : 'a list -> ('a -> 'b) -> 'b list
  (** Same as [List.map]. *)

  val ( and+ ) : 'a list -> 'b list -> ('a * 'b) list
  (** Cartesian product of two lists. *)
end

module Option : sig
  val ( let* ) : 'a option -> ('a -> 'b option) -> 'b option
  (** Same as [Option.bind]. *)

  val ( let+ ) : 'a option -> ('a -> 'b) -> 'b option
  (** Same as [Option.map]. *)

  val ( and+ ) : 'a option -> 'b option -> ('a * 'b) option
  (** Cartesian product of two options. *)
end

module Out_channel : sig
  val ( let& ) : Out_channel.t -> (Out_channel.t -> 'a) -> 'a
  (** [let& outc = ... in f] ensures that [outc] is closed in the case that an
      exception is thrown from [f]. *)
end

module Result : sig
  val ( let* ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
  (** Same as [Result.bind]. *)

  val ( let+ ) : ('a, 'b) result -> ('a -> 'c) -> ('c, 'b) result
  (** Same as [Result.map]. *)

  val ( and+ ) : ('a, 'b) result -> ('c, 'b) result -> ('a * 'c, 'b) result
  (** Cartesian product of two results. *)
end

module Seq : sig
  val ( let* ) : 'a Seq.t -> ('a -> 'b Seq.t) -> 'b Seq.t
  (** Same as [Seq.flat_map]. *)

  val ( let+ ) : 'a Seq.t -> ('a -> 'b) -> 'b Seq.t
  (** Same as [Seq.map]. *)

  val ( and+ ) : 'a Seq.t -> 'b Seq.t -> ('a * 'b) Seq.t
  (** Cartesian product of two seqs. *)
end

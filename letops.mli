module In_channel : sig
  val ( let& ) : In_channel.t -> (In_channel.t -> 'a) -> 'a
end

module List : sig
  val ( let* ) : 'a list -> ('a -> 'b list) -> 'b list
  val ( let+ ) : 'a list -> ('a -> 'b) -> 'b list
  val ( and+ ) : 'a list -> 'b list -> ('a * 'b) list
end

module Option : sig
  val ( let* ) : 'a option -> ('a -> 'b option) -> 'b option
  val ( let+ ) : 'a option -> ('a -> 'b) -> 'b option
  val ( and+ ) : 'a option -> 'b option -> ('a * 'b) option
end

module Out_channel : sig
  val ( let& ) : Out_channel.t -> (Out_channel.t -> 'a) -> 'a
end

module Result : sig
  val ( let* ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
  val ( let+ ) : ('a, 'b) result -> ('a -> 'c) -> ('c, 'b) result
  val ( and+ ) : ('a, 'b) result -> ('c, 'b) result -> ('a * 'c, 'b) result
end

module Seq : sig
  val ( let* ) : 'a Seq.t -> ('a -> 'b Seq.t) -> 'b Seq.t
  val ( let+ ) : 'a Seq.t -> ('a -> 'b) -> 'b Seq.t
  val ( and+ ) : 'a Seq.t -> 'b Seq.t -> ('a * 'b) Seq.t
end

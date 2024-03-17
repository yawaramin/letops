(lang dune 3.6)

(name letops)

(version v0.0.1)

(generate_opam_files true)

(license GPL-3.0-or-later)

(authors "Yawar Amin <yawar.amin@gmail.com>")

(maintainers "Yawar Amin <yawar.amin@gmail.com>")

(source
 (github yawaramin/letops))

(package
 (name letops)
 (synopsis "Let-operators for standard library types and operations")
 (description
  "OCaml 4.08+ let-operators like let* and friends for OCaml standard library types and operations.")
 (documentation "https://yawaramin.github.io/letops/")
 (tags (org:yawaramin))
 (depends
  (ocaml (>= 4.08))))

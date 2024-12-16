#import "utils.typ": *

#set list(spacing: 0.7em)
#set par(spacing: 0.7em, leading: 0.7em)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Nix],
    subtitle: [Reproducible development from theory to practice],
    author: [ners],
    date: "17 December 2024",
  ),
  config-page(numbering: "1"),
)

#set smartquote(quotes: "«»")

#set quote(block: true)

#title-slide()

== Table of contents <touying:hidden>
#outline(title: none, indent: 1em, depth: 1)

== Bibliography <touying:hidden>
#bibliography("bibliography.yml", style: "apa")

#include "sections/introduction.typ"

= Nix language

#include "sections/nix-language.typ"

= Nixpkgs

#include "sections/nixpkgs.typ"

= NixOS

#include "sections/nixos.typ"

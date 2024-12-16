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

#include "sections/title.typ"

== Table of contents <touying:hidden>
#outline(title: none, indent: 1em, depth: 1)

== Bibliography <touying:hidden>
#bibliography("bibliography.yml", style: "apa")

#include "sections/introduction.typ"

#include "sections/nix-store.typ"

#include "sections/nix-language.typ"

#include "sections/nixpkgs.typ"

#include "sections/nixos.typ"

#include "sections/intermezzo.typ"

#include "sections/construction.typ"

#include "sections/nix-cli.typ"

#include "sections/nix-files.typ"

#include "sections/building-c-project.typ"

#include "sections/python-shell.typ"

#include "sections/oci-images.typ"

#include "sections/nixos-tests.typ"

#include "sections/and-goodbye.typ"

#import "utils.typ": *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Nix],
    subtitle: [Reproducible development from theory to practice],
    author: [ners],
    date: "17 December 2024",
    institution: link("https://github.com/ners/nix-lecture")
  ),
  config-page(numbering: "1"),
)

#set smartquote(quotes: "«»")

#set quote(block: true)

#pdfpc.config(
  duration-minutes: 90,
  start-time: datetime(hour: 8, minute: 10, second: 0),
  end-time: datetime(hour: 9, minute: 40, second: 0),
  last-minutes: 5,
  note-font-size: 16,
  disable-markdown: false,
  default-transition: (
    type: "push",
    duration-seconds: 2,
    angle: ltr,
    alignment: "vertical",
    direction: "inward",
  ),
)

#include "sections/title.typ"

#include "sections/table-of-contents.typ"

#include "sections/bibliography.typ"

#set list(spacing: 0.7em)
#set par(spacing: 0.7em, leading: 0.7em)

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

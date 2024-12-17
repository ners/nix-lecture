#import "../utils.typ": *

== What is Nix?

- *Reproducible*
  - if a package works on one machine, it will also work on another
  - if it built yesterday it will still build today
#parspace
#pause
- *Declarative*
  - requirements must be specified completely and correctly
  - specifications can be composed
#parspace
#pause
- *Reliable*
  - packages do not interfere with each other
  - atomic: roll back to previous versions

#pagebreak()

#speaker-note[
]

- How do we ensure that a specification is complete and correct?
  #pause
  - Run the program in an isolated environment
  #pause
  - Only give it access to resources declared by the specification
  #pause
  - Do not give it access to the network or hardware


#pagebreak()

#set page(
  background: place(horizon + right, dx: -150pt, image(
    "../images/nix.svg",
    width: 180pt,
    height: 150pt,
  )),
)

#speaker-note[
  + As mentioned, Nix is not just one thing but an ecosystem
  + Parts of this ecosystem are named somewhat confusingly
  + Let's introduce the main characters
  + From now on, Nix shall refer to the package manager
]

- The Nix ecosystem is many things:
  #pause
  - Nix: the package manager
  #pause
  - Nix language: the functional language
  #pause
  - Nixpkgs: the software repository
  #pause
  - NixOS: the Linux distribution

#import "../utils.typ": *

== Nixpkgs

All software is built with The Pipeline™:

#parspace
Pipeline: fetch -> unpack -> patch -> configure -> build -> check -> install -> fixup


//- We don't want to reinvent the wheel
//
//- Let's have an abstraction around `derivation` that brings all of these in scope

#pagebreak()

- A human-curated collection of software

#parspace
#pause
- All of the software has to build together (usually at the latest version)

#parspace
#pause
- We can have multiple versions of the same software

#parspace
#pause
- The sources of packages are fetched deterministically

#parspace
#pause
- Updating the sources can be automated

#pagebreak()

Repology pic

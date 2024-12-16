#import "../utils.typ": *

== Nixpkgs

All software is built with The Pipeline™:

#pause
#parspace
#text(14pt,diagram( 
spacing: 2em,
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [
    `fetch`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((1,0), [
    `unpack`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((2,0), [
    `patch`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((3,0), [
    `configure`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((4,0), [
    `build`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((5,0), [
    `check`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((6,0), [
    `install`
  ], height: 3em, width:5em),
  edge("-|>"),
  node((7,0), [
    `fixup`
  ], height: 3em, width:5em),
))


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

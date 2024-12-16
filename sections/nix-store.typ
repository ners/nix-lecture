#import "../utils.typ": *

= Nix store

#speaker-note[
  + To understand how Nix works, we must introduce a central concept called the Nix store
  + To help illustrate the concept, I will draw a parallel with how programs interact with computer memory
]

== Nix store

- The *Nix store* is a filesystem tree analogous to heap memory

#pause
#parspace
- *Store objects* are files in the Nix store, analogous to allocated objects in memory

#pause
#parspace
- Each store object is referenced by a *store path*
  - filesystem path e.g. `/nix/store/0xk3r0njrijv434qim2lia11j3x9ivkc-hello`
  - analogous to pointers, or memory addresses

#pause
#parspace
- Store objects can reference each other via store paths

#pagebreak()

#let inputs = diagram(
  spacing: 2em,
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node(
    (0, 0),
    [
      build instructions
    ],
    height: 3em,
    width: 6em,
  ),
  edge((0, 0), (2, 1), "-|>"),
  node(
    (0, 1),
    [
      build input
    ],
    height: 3em,
    width: 6em,
  ),
  edge((0, 1), (2, 1), "-|>"),
  node(
    (0, 2),
    [
      build input
    ],
    height: 3em,
    width: 6em,
  ),
  edge((0, 2), (2, 1), "-|>"),
  node(
    (2, 1),
    [
      build task
    ],
    height: 3em,
    width: 6em,
  ),
  edge((2, 1), (3, 1), "-|>"),
  node(
    (3, 1),
    [
      build result
    ],
    height: 3em,
    width: 6em,
  ),
)

#align(center)[#inputs]

#pagebreak()

#align(center)[#diagram(
    spacing: 1.25em,
    node-stroke: 1pt,
    edge-stroke: 1pt,
    node(
      (0, 0),
      [
        build instructions
      ],
      height: 6em,
      width: 10em,
    ),
    edge((0, 0), (1, 1), "-|>"),
    node(
      (0, 1),
      [
        #text(
          8pt,
          [#inputs],
        )
      ],
      height: 6em,
      width: 10em,
    ),
    edge((0, 1), (1, 1), "-|>"),
    node(
      (0, 2),
      [
        #text(
          8pt,
          [#inputs],
        )
      ],
      height: 6em,
      width: 10em,
    ),
    edge((0, 2), (1, 1), "-|>"),
    node((1, 1), [build task], height: 3em, width: 6em),
    edge((1, 1), (2, 1), "-|>"),
    node((2, 1), [build result], height: 3em, width: 6em),
  )]

#pagebreak()

If the Nix store is "heap memory", which program populates and uses this memory?

#pause
#parspace
- The program would be written in a functional language
  #pause
  - the basic building block is a *function*
  #pause
  - functions can have *multiple inputs* and always produce *one output*
  #pause
  - a function called with the *same inputs* will produce the *same output*

#pause
#parspace
- The inputs and output are store objects

#pause
#parspace
- We can only create new store objects, not delete or update them

#pagebreak()

#speaker-note[
  + If store objects are produced by functions that take store objects as inputs, who created the first store objects?
]

What are the constants in our program?

#pause
#parspace
- We can copy files into the Nix store to turn them into store objects

#pagebreak()

What are the functions in our program?

#pause
#parspace
- Unix processes that run *in a sandbox* to behave like pure functions
  #pause

  - we only allow it read access to the inputs
  #pause
  - we only allow it write access to the output location
  #pause
  - the output of the process will become a new store object

#pause
#parspace
- Nix calls these functions *derivations*

#pause
#parspace
- Derivations are also store objects!

#pagebreak()

#text(size: 12pt, raw(read("../examples/hello/derivation.json"), lang: "JSON"))

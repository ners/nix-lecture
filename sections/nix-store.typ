#import "../utils.typ": *

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

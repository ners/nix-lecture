#import "../utils.typ": *

= Nix language

== Nix language

Why do we need a new language?

#pause
#parspace
- Writing derivations is a complex, mechanical task

#pause
#parspace
- The Nix language automates this process with a concise syntax

#pagebreak()

#speaker-note[
  + Precompute the output path from the hash of its inputs
  + Automatically copy referenced paths into the Nix store
]

#grid(
  columns: (1.5fr, 1fr),
  text(
    size: 14pt,
    raw(read("../examples/hello/derivation.json"), lang: "JSON"),
  ),
  [
    #pause
    #text(size: 14pt, raw(read("../examples/hello/default.nix"), lang: "Nix"))
  ],
)

#pagebreak()

#speaker-note[
+ Domain-specific as opposed to a general-purpose language
+ Purely functional because it has no side effects
+ With lazy evaluation we can do things like fix-point computation
+ Values are assigned types at runtime
]

Properties of the Nix language

#pause
- Domain-specific language

#pause
- Purely functional

#pause
- Lazily evaluated

#pause
- Dynamically typed

#pagebreak()

Names and values

#parspace
#grid(
  columns: (1fr, 1fr, 1fr),
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        b = a + 1;
        a = 1;
      in
      a + b
      ```,
    )],
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        attrset = { x = 1; };
      in
      attrset.x
      ```,
    )],
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        name = "Nix";
      in
      "Hello ${name}!"
      ```,
    )],
)

#pause
#parspace
Functions

#parspace
#grid(
  columns: (1fr, 1fr, 1fr),
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        f = x: x + 1;
      in
      f 5
      ```,
    )
  ],
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        f = x: y: x + y;
      in
      f 2 3
      ```,
    )],
  [
    #pause
    #text(
      size: 18pt,
      ```nix
      let
        f = { a, b }: a + b;
      in
      f { a = 2; b = 3; }
      ```,
    )],
)

#pagebreak()

Functional programming

#pause
#parspace

#raw(read("../examples/fib/default.nix"), lang: "Nix")

#pause
#parspace
#raw(read("../examples/fib/out.txt"))

#pagebreak()

The purpose of the Nix language is to easily *create* and *compose* derivations

#pause
#parspace
- *First-class filesystem paths*
  - a raw path resolves to a store path

#pause
#parspace
- *First-class string templating*
  - we can encode snippets of any language in the Nix language
  - we can interpolate Nix expressions

#pause
#parspace
- *String contexts*
  - a Nix string contains text and a set of dependencies
  - a string that refers to store objects contains their dependency closure

#pagebreak()
#speaker-note[
  + The builder does not have to be bash
]

#grid(
  columns: (1fr, 1.5fr),
  text(size: 14pt, raw(read("../examples/hello/default.nix"), lang: "Nix")),
  text(
    size: 14pt,
    raw(read("../examples/hello/derivation.json"), lang: "JSON"),
  ),
)

#pagebreak()
#speaker-note[
  +
]

#grid(
  columns: (1fr, 1.5fr),
  text(size: 14pt, raw(read("../examples/hello-c/default.nix"), lang: "Nix")),
  text(
    size: 14pt,
    raw(read("../examples/hello-c/derivation.json"), lang: "JSON"),
  ),
)

#pagebreak()
#speaker-note[
  +
]

#grid(
  columns: (1fr, 1.5fr),
  text(
    size: 14pt,
    raw(read("../examples/hello-c-multiple/default.nix"), lang: "Nix"),
  ),
  text(
    size: 14pt,
    raw(read("../examples/hello-c-multiple/builder.sh"), lang: "Bash"),
  ),
)

#pagebreak()

- Many real-world C projects are built with some standard utilities
  #pause
  - Bash, GCC, Make, awk, sed, ...
  #pause
  - These projects are built by running these tools in a sequence

#pause
#parspace
- We can write a Nix function that builds a derivation with many standard utilities provided
  #pause
  - This function is a template for how to build a platonic C project
  #pause
  - We fill in the template with function parameters

#pagebreak()
#speaker-note[
  +
]

#text(
  size: 14pt,
  raw(read("../examples/hello-c-make/default.nix"), lang: "Nix"),
)

#pagebreak()
#speaker-note[
  +
]

#text(
  size: 14pt,
  raw(read("../examples/hello-c-make-deps/default.nix"), lang: "Nix"),
)

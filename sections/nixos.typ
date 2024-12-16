#import "../utils.typ": *

== NixOS

- Software can also have environment requirements at run-time
    #pause
    - Configuration files
    #pause
    - Services such as databases
    #pause
    - Hardware state such as network configuration

#parspace
#pause
- How can we ensure that the environment meets the needs of our software?
    #pause
    - Construct the entire environment in a disciplined way

#pagebreak()

- NixOS is merely a derivation that creates all the files required to run an OS
    #pause
    - bootloader, kernel, init process, service manager, configuration files, ...

#parspace
#pause
- There are multiple choices for each of these components

#parspace
#pause
- How do we make sure they all work together?
    #pause
    - Model the choices as constraints, use constraint solving to find a solution

#pagebreak()
#speaker-note[
+ In NixOS we use a unique programming pattern called the module system
]

- The module system is a DSL embedded in the Nix language

#pause
#parspace
- Its purpose is to build a big data structure from multiple interdependent declarations

#pagebreak()

#speaker-note[
+ Fix-point computation is a feature of lazy evaluation that allows you to access a part of an incomplete value to compute more parts of the same value
]

- Features of the module system:
    #pause
    - Separate *declaration* and *definition* of configuration options
    #pause
    - A *type system* that constrains the values of options
    #pause
    - Multiple definitions of the same option are *merged* according to the type of that option

#pause
#parspace
- Configuration options can refer to each other via fix-point computation

#pagebreak()

#grid(
  columns: (1fr, 1fr, 1fr),
  [
    #text(size: 14pt, raw(read("../examples/example-module/options.nix"), lang: "Nix"))
  ],
  [
    #pause
    #text(size: 14pt, raw(read("../examples/example-module/config.nix"), lang: "Nix"))
  ],
  [
    #pause
    #text(size: 14pt, raw(read("../examples/example-module/default.nix"), lang: "Nix"))
  ],
)

#pagebreak()

- The collection of NixOS modules is a uniform interface for configuring an entire OS

#pause
#parspace
- The data structure produced by the module system is the final configuration for our OS

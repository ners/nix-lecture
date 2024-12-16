#import "../utils.typ": *

== Building a C project

#raw(read("../examples/hello-c-flake/hello.c"), lang: "C")

#pagebreak()

#raw(read("../examples/hello-c-flake/flake.nix"), lang: "Nix")

#pagebreak()

```bash
$ nix build
```
#pause
```
error: builder for '/nix/store/y4pwjdz73s1s1wmvsc5pnrx9va74d760-hello.drv' failed to produce output path for output 'out' at '/nix/store/y4pwjdz73s1s1wmvsc5pnrx9va74d760-hello.drv.chroot/root/nix/store/wpwvpa6m5gq1fghqzbf7n4s7zbrzafzy-hello'
```

#pagebreak()

C projects are usually built with a Makefile!

#parspace
#raw(read("../examples/hello-c-flake/Makefile"), lang: "Make")

#pagebreak()

```bash
$ nix build
```
#pause
```bash
$
```

#parspace
```bash
$ nix run
```
#pause
```
Hello world!
```

== Building a C project with dependencies

Let's add a depedency on TensorFlow

#parspace
#raw(read("../examples/c-tensorflow-flake/hello.c"), lang: "C")

#pagebreak()

#raw(read("../examples/c-tensorflow-flake/Makefile"), lang: "Make")

#pagebreak()

#raw(read("../examples/hello-c-flake/flake.nix"), lang: "Nix")

#pagebreak()

#raw(read("../examples/c-tensorflow-flake/flake.nix"), lang: "Nix")

#import "../utils.typ": *

== Python shell

#raw(read("../examples/python-torch-flake/hello.py"), lang: "Python")

#pagebreak()

#raw(read("../examples/python-torch-flake/flake.nix"), lang: "Nix")

#pagebreak()

```bash
$ nix develop --command python hello.py
```
#pause
```
2.9.1
tensor(42)
```

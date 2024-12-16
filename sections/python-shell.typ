#import "../utils.typ": *

== Python shell

#raw(read("../examples/python-tensorflow-flake/hello.py"), lang: "Python")

#pagebreak()

#raw(read("../examples/python-tensorflow-flake/flake.nix"), lang: "Nix")

#pagebreak()

```bash
$ nix develop --command python hello.py
```
#pause
```
TensorFlow Python library version: 2.13.0
```

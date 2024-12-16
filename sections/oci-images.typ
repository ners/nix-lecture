#import "../utils.typ": *

#include "oci-images-title.typ"

== Building OCI images

- If Nix can build a package, it can also build an OCI image with it!

#pause
#parspace
- Let's package a little Haskell server in Nix and Docker

== Building a Haskell project

#grid(
    columns: (1fr, 1.5fr),
    raw(read("../examples/haskell-server/hello.cabal"), lang: "Cabal"),
    raw(read("../examples/haskell-server/Main.hs"), lang: "Haskell"),
)

#pagebreak()

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      packages.${system}.default =
        pkgs.haskellPackages.callCabal2nix "hello" ./. { };
    };
}
```

#pagebreak()

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
    in
    {
      packages.${system}.default = hello;
    };
}
```

#pagebreak()

```bash
$ nix run
```

#pause
#parspace
```bash
$ curl localhost:3000
```
#pause
```
Hello Haskell!
```

== Building an OCI image

Let's inspect the runtime dependencies of our executable:

#text(12pt, [
```bash
$ nix build
$ ldd result/bin/server
```
#pause
#raw(read("../examples/haskell-server/ldd.txt"), lang: "Haskell")
])

#parspace
That’s a lot of dependencies! Sure would be a shame if we forgot some…

#pagebreak()

#text(14pt, [```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
    in
    {
      packages.${system}.default = hello;
    };
}
```])

#pagebreak()

#text(14pt, [```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
      image = pkgs.dockerTools.buildLayeredImage {
        name = hello.pname;
        config.Cmd = [ hello.meta.mainProgram ];
        contents = [ hello ];
        tag = "latest";
      };
    in
    {
      packages.${system} = {
        default = hello;
        image = image;
      };
    };
}
```])

#pagebreak()

```bash
$ nix build .#image
$ podman load -i result
$ podman run --publish 3000:3000 hello
```
#pause
#parspace
```bash
$ curl localhost:3000
```
#pause
```
Hello Haskell!
```

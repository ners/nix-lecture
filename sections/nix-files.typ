#import "../utils.typ": *

= Nix projects

== Nix files

- A project has Nix powers if it has one or more of these files in its root:
    - `flake.nix` (new: build and shell)
    - `default.nix` (old: just build)
    - `shell.nix` (old: just shell)

#pause
#parspace
- Ideally no other changes to the project are required!

== My first flake

```nix
{
    inputs = {};

    outputs = inputs: {};
}
```

#pagebreak()

```nix
{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-25.11";
        };
    };

    outputs = inputs: {};
}
```

#pagebreak()

```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs: {};
}
```

#pagebreak()

```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs: {
        hello = "world";
    };
}
```

#pagebreak()

```bash
$ nix flake show
```
#pause
```
git+file:/tmp/nix-lecture?dir=examples/flake-c
└───hello: unknown
```

#pause
#parspace
```bash
$ nix eval .#hello
```
#pause
```
"world"
```

#pagebreak()

```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs:
      let
        system = "x86_64-linux";
      in
      {
      };
}
```

Some other options for `system`:
    - `x86_64-darwin`
    - `aarch64-darwin`

#pagebreak()

```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs:
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs { inherit system; };
      in
      {
      };
}
```

#pagebreak()

```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs:
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs { inherit system; };
      in
      {
        devShells.${system}.default = pkgs.mkShell { ... };
      };
}
```

#pagebreak()

#text(size: 18pt, ```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs:
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs { inherit system; };
      in
      {
        devShells.${system}.default = pkgs.mkShell {
          packages = [
            pkgs.fortune
            pkgs.cowsay
            pkgs.lolcat
          ];
        };
      };
}
```)

#pagebreak()

#text(size: 18pt, ```nix
{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    outputs = inputs:
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs { inherit system; };
      in
      {
        devShells.${system}.default = pkgs.mkShell {
          packages = with pkgs; [
            fortune
            cowsay
            lolcat
          ];
        };
      };
}
```)

#pagebreak()

- If a project has a `flake.nix` file (new), enter its development shell with:
    #parspace
    ```bash
    $ nix develop
    ```

#parspace
#pause
- If a project has a `shell.nix` file (old), enter its development shell with:
    #parspace
    ```bash
    $ nix-shell
    ```

#pagebreak()

```bash
$ nix develop
$ fortune | cowsay | lolcat
```
#pause
#import "@preview/ansi-render:0.7.0": *
#ansi-render(read("../examples/my-first-flake/output.txt"), font: none)

== Lockfiles

- Online resources change over time

#parspace
#pause
- We wish to specify the exact version of flake inputs
    #pause
    - But we also still want to easily update them ...

#parspace
#pause
- A Nix flake locks its inputs with a lockfile
    #pause
    - Each input gets resolved to its current version and its contents are hashed
    #pause
    - The version and hash or each input are written into the lockfile
    #pause
    - Every subsequent interaction with the flake will use the lockfile

#pagebreak()

#text(
  size: 12pt,
  raw(read("../examples/my-first-flake/flake.lock"), lang: "JSON"),
)

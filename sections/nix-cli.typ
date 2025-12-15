#import "../utils.typ": *

= Nix CLI

== Nix shell

```bash
$ git --version
```
#pause
```
git version 2.51.2
```

#pause
#parspace

```bash
$ fortune
```
#pause
```
zsh: fortune: command not found
```

#pause
#parspace

```bash
$ nix run nixpkgs#fortune
```
#pause
```
A banker is a fellow who lends you his umbrella when the sun is shining and wants it back the minute it begins to rain.
  -- Mark Twain
```

#pagebreak()

```bash
$ nix run nixpkgs#fortune | nix run nixpkgs#cowsay
```
#pause
```
 _____________________________________
< Offer void where prohibited by law. >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

#pagebreak()

```bash
$ nix shell nixpkgs#fortune nixpkgs#cowsay
$ fortune | cowsay
```
#pause
```
 _________________________________________
/ He who has imagination without learning \
\ has wings but no feet.                  /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
#pause
```bash
$ exit
```

#pagebreak()

```bash
$ nix shell nixpkgs#{fortune,cowsay,lolcat}
$ fortune | cowsay | lolcat
```
#pause
#ansi-render(read("../examples/my-first-flake/output.txt"), font: none)
#pause
```bash
$ exit
```

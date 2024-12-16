#import "../utils.typ": *

== Intermezzo

#align(center)[#image("../images/crane.svg", width: 15%)]

Construction ahead! Flakes are still a work in progress, and small details of their design may change in the future.

#pagebreak()

*We'll return after these messages!*

#parspace
1. Install Nix \
  https://nixos.org/download.html

#parspace
2. Enable flakes \
  ```bash
  mkdir -p ~/.config/nix
  echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
  ```

#parspace
3. Test it out \
  ```bash
  nix run nixpkgs#hello
  ```

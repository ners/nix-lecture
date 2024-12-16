#import "../utils.typ": *

== Intermezzo

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

#import "../utils.typ": *

#focus-slide[
= Intermezzo

We'll return after these messages!
]

#set page(background: image("../images/nix-wallpaper-nineish.svg", width: 100%, height: 100%))
== Intermezzo

#parspace
1. Install Nix \
  #link("https://nixos.org/download.html")

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

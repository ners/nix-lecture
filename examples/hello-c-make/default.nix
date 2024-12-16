let
  make = import ./build-make.nix;
  mkDerivation = { src, ... }:
    builtins.toFile "builder.sh" ''
      cp -r ${src}/* .
      export PATH="${make}/bin:$PATH"
      make
      PREFIX=$out make install
    '';
in
derivation {
  name = "hello";
  builder = ./bash;
  args = [ (mkDerivation { src = ./.; }) ];
  system = builtins.currentSystem;
}

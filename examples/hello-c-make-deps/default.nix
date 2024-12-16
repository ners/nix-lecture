let
  make = import ./build-make.nix;
  glibc = import ./build-glibc.nix { inherit make; };
  mkDerivation = { src, buildInputs, ... }:
    let
      libraryPath = builtins.concatStringsSep ":" buildInputs;
    in
    builtins.toFile "builder.sh" ''
      cp -r ${src}/* .
      export PATH="${make}/bin:$PATH"
      export LD_LIBRARY_PATH="${libraryPath}:$LD_LIBRARY_PATH"
      make
      PREFIX=$out make install
    '';
in
derivation {
  name = "hello";
  builder = ./bash;
  args = [ (mkDerivation { src = ./.; buildInputs = [ glibc ]; }) ];
  system = builtins.currentSystem;
}

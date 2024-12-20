{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ libtensorflow ];
      };

      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "hello";
        src = ./.;
        buildInputs = [ pkgs.libtensorflow ];
      };
    };
}

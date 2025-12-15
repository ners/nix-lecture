{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ lua ];
      };

      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "hello";
        src = ./.;
        buildInputs = with pkgs; [ lua ];
      };
    };
}

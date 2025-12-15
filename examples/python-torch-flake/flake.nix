{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          (pkgs.python3.withPackages (ps: [ ps.torch ]))
        ];
      };
    };
}

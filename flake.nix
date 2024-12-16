{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = inputs:
    let
      inherit (inputs.nixpkgs) lib;
      foreach = xs: f: with lib; foldr recursiveUpdate { } (
        if isList xs then map f xs
        else if isAttrs xs then mapAttrsToList f xs
        else throw "foreach: expected list or attrset but got ${typeOf xs}"
      );
    in
    foreach inputs.nixpkgs.legacyPackages (system: pkgs: {
      formatter.${system} = pkgs.nixpkgs-fmt;

      packages.${system}.a4-flake = pkgs.runCommand "a4-flake"
        {
          src = ./.;
          buildInputs = with pkgs; [ typst ];
        }
        ''
          cd $src
          mkdir $out
          typst compile $name.typ $out/$name.pdf
        '';

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          pdfpc
          tinymist
          typst
        ];
      };
    });
}

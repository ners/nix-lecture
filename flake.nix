{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    with builtins;
    let
      inherit (inputs.nixpkgs) lib;
      foreach = xs: f: with lib; foldr recursiveUpdate { } (
        if isList xs then map f xs
        else if isAttrs xs then mapAttrsToList f xs
        else throw "foreach: expected list or attrset but got ${typeOf xs}"
      );
    in
    foreach inputs.nixpkgs.legacyPackages (system: pkgs:
      let
        typixLib = inputs.typix.lib.${system};
        src = ./.;
        commonArgs = {
          typstSource = "slides.typ";
          fontPaths = with pkgs; [
            "${fira}/share/fonts/opentype"
            "${fira-sans}/share/fonts/opentype"
            "${fira-math}/share/fonts/opentype"
            "${fira-code}/share/fonts/opentype"
            "${pkgs.excalifont}/share/fonts/ttf"
            "${pkgs.excalifont}/share/fonts/woff2"
          ];
          virtualPaths = [
            # Add paths that must be locally accessible to typst here
            {
              dest = "images";
              src = "${inputs.self}/images";
            }
            {
              dest = "sections";
              src = "${inputs.self}/sections";
            }
          ];
        };
        unstable_typstPackages = [
          {
            name = "touying";
            version = "0.6.1";
            hash = "sha256-bTDc32MU4GPbUbW5p4cRSxsl9ODR6qXinvQGeHu2psU=";
          }
          {
            name = "fletcher";
            version = "0.5.8";
            hash = "sha256-kKVp5WN/EbHEz2GCTkr8i8DRiAdqlr4R7EW6drElgWk=";
          }
          {
            name = "ansi-render";
            version = "0.7.0";
            hash = "sha256-3jZH1hwem9xHpIJMd0ZVzK9bQSMoBADh1Ud8A+Anans=";
          }
          {
            name = "ansi-render";
            version = "0.8.0";
            hash = "sha256-a4DNt7j79xPeEkw3RY1+MpLDjewsKpFxpJyJ6hSymPA=";
          }
          {
            name = "oxifmt";
            version = "0.2.1";
            hash = "sha256-8PNPa9TGFybMZ1uuJwb5ET0WGIInmIgg8h24BmdfxlU=";
          }
          {
            name = "cetz";
            version = "0.3.4";
            hash = "sha256-5w3UYRUSdi4hCvAjrp9HslzrUw7BhgDdeCiDRHGvqd4=";
          }
        ];

        # Compile a Typst project, *without* copying the result
        # to the current directory
        build-drv = typixLib.buildTypstProject (
          commonArgs
          // {
            inherit src unstable_typstPackages;
            postBuild = ''
              "${lib.getExe pkgs.polylux2pdfpc}" slides.typ
            '';
            postInstall = ''
              mv "$out" slides.pdf
              mkdir "$out"
              mv slides.pdf "$out"
              mv slides.pdfpc "$out"
            '';
          }
        );

        # Compile a Typst project, and then copy the result
        # to the current directory
        build-script = typixLib.buildTypstProjectLocal (
          commonArgs
          // {
            inherit src unstable_typstPackages;
          }
        );

        # Watch a project and recompile on changes
        watch-script = typixLib.watchTypstProject commonArgs;

        presentation = pkgs.writeShellApplication {
          name = "runPresentation";
          runtimeInputs = [
            pkgs.pdfpc
          ];
          text = ''
            cd "${build-drv}"
            pdfpc ./slides.pdf "$@"
          '';
        };
      in
      {
        checks.${system} = {
          inherit build-drv build-script watch-script;
        };

        formatter.${system} = pkgs.nixpkgs-fmt;

        packages.${system} = rec {
          default = present;
          present = presentation;
          slides = build-drv;
          inherit watch-script ;
        };

        devShells.${system}.default = pkgs.mkShell {
          buildInputs =
            with pkgs;
            [
              tinymist
              typst
              polylux2pdfpc
            ]
            ++ lib.optionals pkgs.stdenv.isLinux [
              pdfpc
            ];
        };
      });
}

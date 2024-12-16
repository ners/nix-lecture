let
  lib = import <nixpkgs/lib>;
  result = lib.evalModules {
    modules = [
      ./options.nix
      ./config.nix
    ];
  };
in
result.config

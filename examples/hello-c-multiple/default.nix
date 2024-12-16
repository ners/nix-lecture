let
  buildScript =
    builtins.toFile "builder.sh" ''
      src=${./.}
      gcc=${./gcc}
      for c in $src/*.c; do
        $gcc -I$src -c -o $c.o $c
      done
      $gcc -o $out *.o
    '';
in
derivation {
  name = "hello";
  builder = ./bash;
  args = [ buildScript ];
  system = builtins.currentSystem;
}

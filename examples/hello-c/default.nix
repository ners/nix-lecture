derivation {
  name = "hello";
  builder = ./gcc;
  args = [ "-o" "$out" ./hello.c ];
  system = builtins.currentSystem;
}

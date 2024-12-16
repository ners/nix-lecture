derivation {
  name = "hello";
  builder = ./bash;
  args = [ "-c" "echo hello > $out" ];
  system = builtins.currentSystem;
}

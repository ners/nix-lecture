#import "../utils.typ": *

= NixOS tests

== NixOS tests

- NixOS tests set up a network of NixOS-powered virtual machines

#pause
#parspace
- These virtual machines can run any program and communicate with each other over the network

#pause
#parspace
- This is especially useful for client-server tests!

#pagebreak()

Let's test our Haskell app

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
    in
    {
      packages.${system}.default = hello;
    };
}
```

#pagebreak()

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
    in
    {
      packages.${system}.default = hello;
      checks.${system}.nixosTest = pkgs.testers.nixosTest { ... };
    };
}
```

#pagebreak()

```nix
pkgs.testers.nixosTest {
    name = "hello-test";
    nodes = { ... };
    testScript = "...";
};
```

#pagebreak()

```nix
pkgs.testers.nixosTest {
  name = "hello-test";
  nodes = {
    server = { ... };
    client = { ... };
  };
  testScript = "...";
};
```

#pagebreak()

```nix
pkgs.testers.nixosTest {
  name = "hello-test";
  nodes = {
    server = {
      networking.firewall.allowedTCPPorts = [ 3000 ];
      systemd.services.server = {
        wantedBy = [ "multi-user.target" ];
        path = [ hello ];
        script = hello.meta.mainProgram;
      };
    };
    client = { ... };
  };
  testScript = "...";
};
```

#pagebreak()

#text(18pt, [```nix
pkgs.testers.nixosTest {
  name = "hello-test";
  nodes = {
    server = {
      networking.firewall.allowedTCPPorts = [ 3000 ];
      systemd.services.server = {
        wantedBy = [ "multi-user.target" ];
        path = [ hello ];
        script = hello.meta.mainProgram;
      };
    };
    client = {
      environment.systemPackages = [ pkgs.curl ];
    };
  };
  testScript = "...";
};
```])

#pagebreak()

#text(14pt, [```nix
pkgs.testers.nixosTest {
  name = "hello-test";
  nodes = {
    server = {
      networking.firewall.allowedTCPPorts = [ 3000 ];
      systemd.services.server = {
        wantedBy = [ "multi-user.target" ];
        path = [ hello ];
        script = hello.meta.mainProgram;
      };
    };
    client = {
      environment.systemPackages = [ pkgs.curl ];
    };
  };
  testScript = ''
    start_all()
    server.wait_for_open_port(3000)
    expected = "Hello Haskell!"
    actual = client.succeed("curl http://server:3000")
    assert expected == actual, "server says hello"
  '';
};
```])

#pagebreak()

```bash
$ nix build --print-build-logs .#checks.x86_64-linux.nixosTest
```
#pause
```
... lots of terminal output ...
```
#pause
```bash
$
```

#pause
#parspace
```bash
$ echo $?
```
#pause
```
0
```

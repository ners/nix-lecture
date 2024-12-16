{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
      hello = pkgs.haskellPackages.callCabal2nix "hello" ./. { };
      image = pkgs.dockerTools.buildLayeredImage {
        name = hello.pname;
        config.Cmd = [ hello.meta.mainProgram ];
        contents = [ hello ];
        tag = "latest";
      };
    in
    {
      packages.${system} = {
        default = hello;
        image = image;
      };

      checks.${system}.nixosTest = pkgs.nixosTest {
        name = "hello-test";
        nodes = {
          server = {
            networking.firewall.allowedTCPPorts = [ 3000 ];
            systemd.services.server = {
              wantedBy = [ "multi-user.target" ];
              script = "${hello}/bin/hello";
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
    };
}

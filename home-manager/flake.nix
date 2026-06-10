{
  description = "Home-Manager flake thingy";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    programs.home-manager.users.tristan = {
      inherit ( ./home.nix ) {};
    };
  };
}

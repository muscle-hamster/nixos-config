{
  description = "NixOS configuration by BrockM";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  inputs.home-manager = {
    url = "github:nix-community/home-manager/release-21.11";

    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem
    {
      system = "aarch64-linux";
      modules = [
       ./system/configuration.nix
       ./users/brockm/nixos.nix
       home-manager.nixosModules.home-manager
       {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.brockm = import ./users/brockm/default.nix;
       }
      ];

    };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}

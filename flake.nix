{
  description = "NixOS & Home-Manager Standalone Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {

      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/laptop/configuration.nix
          inputs.sops-nix.nixosModules.sops
        ];
      };

      homeConfigurations."lele" =
        let
          lib = nixpkgs.lib;
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config = {
              allowUnfree = true;
              allowInsecurePredicate = pkg: lib.hasPrefix "electron" (lib.getName pkg);
            };
          };
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home/lele.nix
          ];
        };
    };
}

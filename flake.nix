{
  description = "NixOS + Home Manager standalone configuration";

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
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      inherit (nixpkgs) lib;

      # Single source of truth for package set policies, shared by NixOS and Home Manager.
      nixpkgsConfig = {
        allowUnfree = true;
        # Electron apps ship unpatched binaries and are therefore flagged insecure.
        allowInsecurePredicate = pkg: lib.hasPrefix "electron" (lib.getName pkg);
      };
    in
    {
      nixosConfigurations.laptop = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/laptop/configuration.nix
          inputs.sops-nix.nixosModules.sops
          { nixpkgs.config = nixpkgsConfig; }
        ];
      };

      homeConfigurations.lele = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config = nixpkgsConfig;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/lele.nix ];
      };

      formatter = nixpkgs.legacyPackages.${system}.alejandra;
    };
}

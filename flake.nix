{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, nixos-hardware, ... }@inputs: {
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        nixos-wsl.nixosModules.default
        ./wsl.nix
        ./shared.nix
        home-manager.nixosModules.home-manager
      ];
    };

    nixosConfigurations.framework12 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./framework12.nix
        ./shared.nix
        ./graphical.nix
        nixos-hardware.nixosModules.framework-12-13th-gen-intel
        home-manager.nixosModules.home-manager
      ];
    };
  };
}

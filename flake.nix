{
    description = "Borealis nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixpkgs-chrjabs.url = "github:chrjabs/nixpkgs/texlive";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ nixpkgs, nixpkgs-chrjabs, home-manager, ... }:
    let
        system = "aarch64-darwin";
    in 
    {
        homeConfigurations."ben" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            extraSpecialArgs = {
                inherit inputs;

                pkgs-chrjabs = import nixpkgs-chrjabs {
                    inherit system;
                    config.allowUnfree = true;
                };
            };
            modules = [ ./home.nix ];
        };
    };
}

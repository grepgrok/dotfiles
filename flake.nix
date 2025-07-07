{
    description = "Borealis nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        nixpkgs-texlive.url = "github:nixos/nixpkgs/master"; # uber unstable and untested

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        stylix.url = "github:danth/stylix";
        stylix.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        nixpkgs,
        home-manager,
        stylix,
        ...
    } @ inputs:
    let
        system = "aarch64-darwin";
    in 
    {
        homeConfigurations."ben" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            extraSpecialArgs = {
                inherit inputs;

                pkgs-texlive = import inputs.nixpkgs-texlive {
                    inherit system;
                    config.allowUnfree = true;
                };
            };
            modules = [
                stylix.homeModules.stylix
                ./home.nix
            ];
        };
    };
}

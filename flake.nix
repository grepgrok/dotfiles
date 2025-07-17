{
    description = "Borealis nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        # nixpkgs-texlive.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # texlive has a tendency to get unstable

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        stylix.url = "github:danth/stylix";
        stylix.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        stylix,
        ...
    } @ inputs:
    let
        inherit (self) outputs;
        system = "aarch64-darwin";
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        mkLib = (import ./lib).mkLib home-manager;
        lib = mkLib pkgs;
    in
    rec {
        homeConfigurations."ben" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
                inherit inputs outputs lib;

                pkgs-texlive = pkgs; # import inputs.nixpkgs-texlive { inherit system; };
            };
            modules = [
                stylix.homeModules.stylix
                ./home.nix
            ];
        };
    };
}

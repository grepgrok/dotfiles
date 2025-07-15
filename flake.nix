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
        nixpkgs,
        home-manager,
        stylix,
        ...
    } @ inputs:
    let
        system = "aarch64-darwin";
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        lib = pkgs.lib.extend
            (final: prev: home-manager.lib // (import ./lib final pkgs ));
    in
    {
        homeConfigurations."ben" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
                inherit inputs lib;

                pkgs-texlive = pkgs; # import inputs.nixpkgs-texlive { inherit system; };
            };
            modules = [
                stylix.homeModules.stylix
                ./home.nix
            ];
        };
    };
}

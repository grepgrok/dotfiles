{
    description = "Borealis nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

        darwin.url = "github:nix-darwin/nix-darwin/master";
        darwin.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, darwin, nixpkgs, home-manager, ... }: {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#Borealis
        darwinConfigurations."Borealis" = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            pkgs = import nixpkgs { 
                system = "aarch64-darwin";
                config.allowUnfree = true; 
            };
            modules = [
                ./modules/darwin

                home-manager.darwinModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.ben = ./modules/home-manager;
                    };
                }
            ];
        };
    };
}

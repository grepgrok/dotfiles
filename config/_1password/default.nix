{ lib, pkgs, ... }:
{
    # Enable the unfree 1Password packages
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "_1password-gui"
    ];

    home.packages = with pkgs; [ _1password-gui ];
}

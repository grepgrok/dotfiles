{ config, lib, pkgs, ... }:
{
    config.stylix.enable = true;
    config.stylix.base16Scheme = ./swamp-light.yaml;

    imports = [
        ./neovim
        ./starship
    ];
}

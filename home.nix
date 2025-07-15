# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{
    inputs,
    pkgs,
    lib,
    ...
} @ args:
let
    colors = import ./aesthetics/colors/swamp.nix { };
in {
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11"; # no touchy
        username = "ben";
        homeDirectory = "/Users/ben";
        # map `./modules/config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };

    home.packages = with pkgs; [
        luarocks # Lua
        wget
        lazygit
        curl
        fzf
        element-desktop
        qbittorrent
    ];

    xdg.enable = true; # Tell programs to use ~/.config

    programs.home-manager.enable = true; # let home-manager manager itself

    imports = [
        ./config/git
        ./config/nvim
        ./config/tex
        ./config/wezterm
        ./config/zsh

        ./aesthetics/colors/swamp

        ./pkgs/subs2cia.nix
    ];
}

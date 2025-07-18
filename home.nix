# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{
    inputs,
    outputs,
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

    nixpkgs.overlays = [
        outputs.overlays.additions
        outputs.overlays.stable
    ];

    home.packages = with pkgs; [
        curl
        element-desktop
        fzf
        lazygit
        luarocks # Lua
        mkvtoolnix
        qbittorrent
        wget
    ];

    xdg.enable = true; # Tell programs to use ~/.config

    programs.home-manager.enable = true; # let home-manager manager itself

    imports = [
        ./config/git
        ./config/nh
        ./config/nvim
        ./config/starship
        ./config/tex
        ./config/wezterm
        ./config/zsh

        ./aesthetics/colors/swamp/light
        ./aesthetics/eyecandy/colorscripts.nix
    ];
}

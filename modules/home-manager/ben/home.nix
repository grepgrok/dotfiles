# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{ pkgs, lib, ... }:
let
    isMac = (pkgs.system == "aarch64-darwin");
    colors = import ./aesthetics/colors/swamp.nix { };
in {
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11"; # no touchy
        username = "ben";
        homeDirectory = "/Users/ben";
        # map `./config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };

    home.packages = with pkgs; [
            luarocks # Lua
            wget
            wezterm
            git
            lazygit
            curl
            fzf

            ## Tex
            # lib.mkIf (!isMac) zathura
            #texlive.combined.scheme-full
            skimpdf
            dbus
        ];

    xdg.enable = true; # Tell programs to use ~/.config

    programs.home-manager.enable = true; # let home-manager manager itself

    imports = [
        # (import ./config/alacritty/default.nix { inherit pkgs; })
        (import ./config/git/default.nix { inherit pkgs lib; })
        (import ./config/nvim/default.nix { inherit pkgs lib; })
        (import ./config/wezterm/default.nix { inherit pkgs colors; })
        (import ./config/zsh/default.nix { inherit pkgs; })
    ];
}

# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{
    inputs,
    pkgs,
    pkgs-texlive,
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
        # map `./config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };

    home.packages = with pkgs; [
        luarocks # Lua
        wget
        git
        lazygit
        curl
        fzf
    ];

    xdg.enable = true; # Tell programs to use ~/.config

    programs.home-manager.enable = true; # let home-manager manager itself

    programs.wezterm.enable = true;
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    imports = [
        # (import ./config/alacritty/default.nix { inherit pkgs; })
        (import ./config/git/default.nix { inherit pkgs lib; })
        (import ./config/nvim/default.nix { inherit pkgs lib colors; })
        (import ./config/tex/default.nix { inherit pkgs pkgs-texlive; })
        # (import ./config/wezterm/default.nix { inherit pkgs colors; })
        (import ./config/zsh/default.nix { inherit pkgs; })
    ];
}

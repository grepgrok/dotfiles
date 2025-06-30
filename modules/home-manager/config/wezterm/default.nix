{ pkgs, colors, ... }:

with colors; {
    programs.wezterm = {
        enable = true;
        colorSchemes = import ./colors.nix { inherit colors; };
    };
}

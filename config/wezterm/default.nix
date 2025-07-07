{ pkgs, colors, ... }:
with colors; {
    home.packages = [ pkgs.nerd-fonts._0xproto ];
    programs.wezterm = {
        enable = true;
        # colorSchemes = import ./colors.nix { inherit colors; };
    };
}

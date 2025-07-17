{ pkgs, lib, config, inputs, ... }:
{
    programs.starship.enable = true;
    programs.starship.settings = (lib.my.mergeTOML [
        ./nerd-font-symbols.toml
        ./gruvbox-rainbow.toml
        ./starship.toml
    ]) // {
        palettes.base16 = with config.lib.stylix.colors.withHashtag; {
            color_fg0 = base05;
            color_bg1 = base01;
            color_bg3 = base02;
            color_blue = blue;
            color_aqua = cyan;
            color_green = green;
            color_orange = orange;
            color_purple = magenta;
            color_red = red;
            color_yellow = yellow;
        };
    };
}

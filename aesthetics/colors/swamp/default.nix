{ config, lib, pkgs, ... }:
{
    config.stylix.enable = true;
    config.stylix.base16Scheme = ./swamp-light.yaml;

    config.programs.neovim.plugins = [
        {
            plugin = pkgs.vimPlugins.mini-nvim;
            type = "lua";
            config = lib.mkAfter (builtins.readFile (lib.my.replace {
                src = ./neovim.lua;
                replacements = {
                    "palette." = config.lib.stylix.colors.withHashtag;
                };
            }));
        }
    ];

    config.programs.starship.settings = lib.mapAttrsRecursive (_: lib.mkForce) {
        os.style = "bg:color_orange fg:color_bg1";
        username.style_user = "bg:color_orange fg:color_bg1";
        username.style_root = "bg:color_orange fg:color_bg1";
        directory.style = "fg:color_bg1 bg:color_yellow";
    };
}

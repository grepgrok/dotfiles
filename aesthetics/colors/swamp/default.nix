{ config, lib, pkgs, ... }:
{
    config.stylix.enable = true;
    config.stylix.base16Scheme = ./swamp-light.yaml;

    config.programs.neovim.plugins = [
        {
            plugin = pkgs.vimPlugins.mini-nvim;
            type = "lua";
            config = lib.mkAfter (builtins.readFile (lib.replace {
                src = ./neovim.lua;
                replacements = {
                    "palette." = config.lib.stylix.colors.withHashtag;
                };
            }));
        }
    ];
}

{ pkgs, lib, colors, ... }:
let
    linterLanguages = packages: with packages; [
        c
        nix
        haskell
        markdown
        json
        rust
        tex
        toml
    ];

    dependencies = with pkgs; [
        git
        nerd-fonts._0xproto
        lazygit
        curl
        fzf
        ripgrep
        fd

        (pkgs.vimPlugins.nvim-treesitter.withPlugins linterLanguages)
    ];
in
{
    home.packages = dependencies;
    ## Get LazyVim to work with Nix and home-manager
    # https://github.com/LazyVim/LazyVim/discussions/1972#discussion-5826338
    programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
            lua-language-server
            stylua
            ripgrep
        ];

        plugins = with pkgs.vimPlugins; [
            lazy-nvim
        ];

        extraLuaConfig = builtins.readFile ./hm-init.init.lua;
    };

    imports = [
        # (import ./colors/base16.nix { inherit colors; })
    ];
}

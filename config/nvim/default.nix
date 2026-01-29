{
    lib,
    pkgs,
# stable,
    ...
}:
let
    # https://github.com/LazyVim/LazyVim/discussions/1972
    # This creates ~/.config/nvim/parser/treesitter-parsers/${language}/parser
    # xdg.configFile."nvim/parser".source =
    # let
    #   parsers = pkgs.symlinkJoin {
    #     name = "treesitter-parsers";
    #     paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
    #       c
    #       lua
    #     ])).dependencies;
    #   };
    # in
    # "${parsers}/parser";
    linterLanguages = packages: with packages; [
        c
        haskell
        json
        lua
        markdown
        markdown_inline
        nix
        rust
        toml
        yaml
    ];

    dependencies = with pkgs; [
        curl
        fd
        fzf
        git
        lazygit
        nerd-fonts._0xproto
        ripgrep

        (pkgs.vimPlugins.nvim-treesitter.withPlugins linterLanguages)
    ];
in
{
    home.packages = dependencies;

    programs.neovim = {
        # TODO: enable should control the WHOLE nvim config, that includes porting the files to .config
        enable = true;
        # package = stable.neovim-unwrapped;

        # Packages available to nvim
        # i.e. can require()
        extraPackages = with pkgs; [
            # LazyVim
            lua-language-server
            stylua

            # Telescope
            ripgrep

            # image.nvim
            imagemagick
        ];
        extraLuaPackages = p: with p; [
            # image.nvim
            magick
        ];

        plugins = with pkgs.vimPlugins; [
            lazy-nvim
        ];

        initLua = builtins.readFile ./hm-init.init.lua;
    };
}

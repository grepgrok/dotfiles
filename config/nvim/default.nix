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

    nvimPlugins = with pkgs.vimPlugins; [
        # LazyVim
        LazyVim
        bufferline-nvim
        cmp-buffer
        cmp-nvim-lsp
        cmp-path
        cmp_luasnip
        conform-nvim
        dashboard-nvim
        dressing-nvim
        flash-nvim
        friendly-snippets
        gitsigns-nvim
        indent-blankline-nvim
        lualine-nvim
        neo-tree-nvim
        neoconf-nvim
        neodev-nvim
        noice-nvim
        nui-nvim
        nvim-cmp
        nvim-lint
        nvim-lspconfig
        nvim-notify
        nvim-spectre
        nvim-treesitter
        nvim-treesitter-context
        nvim-treesitter-textobjects
        nvim-ts-autotag
        nvim-ts-context-commentstring
        nvim-web-devicons
        persistence-nvim
        plenary-nvim
        telescope-fzf-native-nvim
        telescope-nvim
        todo-comments-nvim
        tokyonight-nvim
        trouble-nvim
        vim-illuminate
        vim-startuptime
        which-key-nvim
        { name = "LuaSnip"; path = luasnip; }
        { name = "catppuccin"; path = catppuccin-nvim; }
        { name = "mini.ai"; path = mini-nvim; }
        { name = "mini.bufremove"; path = mini-nvim; }
        { name = "mini.comment"; path = mini-nvim; }
        { name = "mini.indentscope"; path = mini-nvim; }
        { name = "mini.pairs"; path = mini-nvim; }
        { name = "mini.surround"; path = mini-nvim; }
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

        extraLuaConfig =
            let
                mkEntryFromDrv = drv:
                    if lib.isDerivation drv then
                        { name = "${lib.getName drv}"; path = drv; }
                    else
                        drv;
                lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv nvimPlugins);
            in
            ''
            require("lazy").setup({
                defaults = { lazy = true, },
                dev = {
                    -- reuse files from pkgs.vimPlugins.*
                    path = "${lazyPath}",
                    patterns = { "" },
                    -- fallback to download
                    fallback = true,
                },
                spec = {
                    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
                    { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
                    { "williamboman/mason-lspconfig.nvim", enabled = false },
                    { "williamboman/mason.nvim", enabled = false },
                    { import = "plugins" },
                    { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
                },
            })
            '';
    };

    imports = [
        # (import ./colors/base16.nix { inherit colors; })
    ];
}

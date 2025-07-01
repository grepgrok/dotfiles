{ pkgs, lib, ... }:
<<<<<<<< HEAD:modules/home-manager/ben/config/nvim/default.nix
{
    home.packages = with pkgs; [
        git
        nerd-fonts._0xproto
        lazygit
        curl
        fzf
        ripgrep
        fd

        # Linter Languages
        (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
            c
            nix
            haskell
            markdown
            json
            rust
            tex
            toml
        ]))
    ];
    ## Get LazyVim to work with Nix and home-manager
    # https://github.com/LazyVim/LazyVim/discussions/1972#discussion-5826338
    programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
            # LazyVim
            lua-language-server
            stylua
            # Telescope
            ripgrep
        ];

        plugins = with pkgs.vimPlugins; [
            lazy-nvim
        ];

        extraLuaConfig =
            let
                plugins = with pkgs.vimPlugins; [
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
                mkEntryFromDrv = drv:
                    if lib.isDerivation drv then
                        { name = "${lib.getName drv}"; path = drv; }
                    else
                        drv;
                lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
            in
            ''
                require("lazy").setup({
                    defaults = {
                        lazy = true,
                    },
                    dev = {
                        -- reuse files from pkgs.vimPlugins.*
                        path = "${lazyPath}",
                        patterns = { "" },
                        -- fallback to download
                        fallback = true,
                    },
                    spec = {
                        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
                        -- The following configs are needed for fixing lazyvim on nix
                        -- force enable telescope-fzf-native.nvim
                        { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
                        -- disable mason.nvim, use programs.neovim.extraPackages
                        { "williamboman/mason-lspconfig.nvim", enabled = false },
                        { "williamboman/mason.nvim", enabled = false },
                        -- import/override with your plugins
                        { import = "plugins" },
                        -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
                        { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
                    },
                })
            '';
    };
========
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
            hello
            brave

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
>>>>>>>> f90c662 (testing):home.nix
}

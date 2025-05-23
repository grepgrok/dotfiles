# If home-manager as a shell command disappears, use this:
# nix run github:nix-community/home-manager -- switch --flake .
#
# Hint: you need `programs.home-manager.enable = true;`
# Hint: run `nix eval --impure --expr '(import <nixpkgs>{}).system'` to check current system for pkgs.system
{ pkgs, lib, ... }:
let
    isMac = (pkgs.system == "aarch64-darwin");
in {
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11";
        username = "ben";
        homeDirectory = "/Users/ben";
        packages = with pkgs; [
            luarocks

            texlive.combined.scheme-full

            # LazyVim 
            neovim
            nerd-fonts._0xproto
            git
            lazygit
            curl
            fzf
            ripgrep
            fd
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
            # wezterm

            wget

            ## Tex
            # lib.mkIf (!isMac) zathura
            skimpdf
            dbus
        ];

        # map `./config` dir to `~/.config` dir
        file.".config" = { source = ./config; recursive = true; };
    };
    xdg.enable = true; # Tell programs to use ~/.config

    programs.home-manager.enable = true; # let home-manager manager itself
    programs.zsh.enable = true;

    programs.git = {
        enable = true;
        userName = "Ben Olson";
        userEmail = "ben.k.olson@gmail.com";
        extraConfig = {
            credential.helper = lib.mkIf (pkgs.system == "aarch64-darwin") "osxkeychain";
        };
    };

    ## Get LazyVim to work with Nix and home-manager
    # https://github.com/LazyVim/LazyVim/discussions/1972#discussion-5826338
    programs.neovim = {
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

    # https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
    xdg.configFile."nvim/parser".source =
        let
            parsers = pkgs.symlinkJoin {
                name = "treesitter-parsers";
                paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
                    c
                    lua
                ])).dependencies;
            };
        in
        "${parsers}/parser";

    # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
    xdg.configFile."nvim/lua".source = ./config/nvim/lua;
}

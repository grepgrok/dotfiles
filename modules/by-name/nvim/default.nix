{
    pkgs,
    lib,
    config,
    configBasePath,
    ...
}:
let
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
    options.programs.nvim.lazy-nvim.enable = lib.mkEnableOption "LazyVim";

    config = lib.mkIf config.programs.neovim.enable {
        file.".config/nvim" = { source = ${configBasePath}/nvim; recursive = true; };

        home.packages = dependencies;

        ## Get LazyVim to work with Nix and home-manager
        #
        # TODO: check these versions
        #
        # LazyVim requirements:
        # - Neovim >= 0.11.2 (built with LuaJIT) # neovim.enable installs the latest nvim
        # - Git >= 2.19.0
        # - a Nerd Font >= v3.0
        # - lazygit
        # - tree-sitter-cli and C compiler for nvim-treesitter
        # - curl
        # - fzf-lua
        #   - fzf >= 0.25.1
        #   - ripgrep
        #   - fd
        # - terminal with true color and undercurl
        #   - wezterm
        # https://github.com/LazyVim/LazyVim/discussions/1972#discussion-5826338
        programs.neovim = {
            extraPackages = with pkgs; [
                lua-language-server
                stylua
                ripgrep

                imagemagick # image.nvim
            ];

            extraLuaPackages = ps: with ps; [
                ps.magick # image.nvim
            ];

            plugins = with pkgs.vimPlugins; [
                lazy-nvim
            ];

            extraLuaConfig = builtins.readFile ./hm-init.init.lua;
        };
    };
}

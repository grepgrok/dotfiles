-- TODO: do... something for making sure lazy.nvim exists when not using nix

----- lazy.nvim  Setup -----
---NOTE: dependencies: github.com:folke/lazy.nvim.git
-- TODO: consider just switching away from LazyVim to custom (with nix?)
-- One of the nice things about having NeoVim stuff seperate is that I can
-- (should be able to) still use the same config even if I can't use Nix
require("lazy").setup({
    spec = {
        -- lazy.nvim requires the order: lazyvim.plugins, lazyvim.plugins.extras, (other) plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- { "LazyVim/LazyVim", import = "lazyvim.plugins.extras"}
        { import = "plugins" },
    },

    defaults = {
        -- Lazy load plugins; only if you know what you're doing
        -- TODO: find out, do this
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },

    -- automatically check for plugin updates --
    checker = {
        -- TODO: sort out the actual update flow with nix...
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    },

    -- LazyVim expects to be able to mutate lazyvim.json ater you read the NEWS.md
    -- but nix fucks that up
    -- TODO: get it to identify a different location for the news/lazyvim.json. Namely, here in .nix
    -- or... that might be a terrible idea to permit programs to mutate nix config
    --news = {
    --  lazyvim = false,
    --},

    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

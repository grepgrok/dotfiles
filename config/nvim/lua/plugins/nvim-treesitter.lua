return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        return vim.list_extend(opts.ensure_installed, { "latex", "nix", "lua" })
    end,
}

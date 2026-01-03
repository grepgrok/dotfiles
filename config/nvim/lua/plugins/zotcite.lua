return {
    "jalvesaq/zotcite",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    -- TODO: Add menu title under [leader]
    config = function()
        require("zotcite").setup({
            key_type = "better-bibtex",
        })
    end,
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
        vim.list_extend(opts.filesystem, {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
            },
        })
    end,
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    -- TODO: neo-tree can actually do some cool stuff. check it out
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_by_name = {
                    ".git",
                    ".DS_Store",
                },
            },
        },
    },
}

return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            -- add <Tab> to confirm text-completion selection
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),

            -- override <CR> (enter) to abort and perform fallback (newline)
            ["<CR>"] = function(fallback)
                cmp.abort()
                fallback()
            end,
        })
    end,
}

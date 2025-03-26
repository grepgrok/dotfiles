return {
    "lervag/vimtex",
    -- TODO: the `' tex quote problem is a vimtex problem
    -- check on texLigature
    -- maybe make `' a buffer mapping in mini.pairs
    config = function()
        -- MacOS
        -- vim.g.vimtex_view_method = "skim"
        -- Linux
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }
    end,
}

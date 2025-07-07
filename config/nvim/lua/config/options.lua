-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- provided by rust-analyzer.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        --NVIM_ENTER=1
        vim.cmd([[call chansend(v:stderr, "\033]1337;SetUserVar=NVIM_ENTER=MQ==\007")]])
    end,
})

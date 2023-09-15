vim.g.db_ui_use_nerd_fonts = 1

vim.keymap.set("n", "<leader>db", function()
    vim.cmd("DBUIToggle")
end)

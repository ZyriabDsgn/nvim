vim.keymap.set("n", "<leader>td", function()
    vim.cmd("TodoQuickFix")
end)

vim.keymap.set("n", "<leader>tq", function()
    vim.cmd("TodoTelescope")
end)

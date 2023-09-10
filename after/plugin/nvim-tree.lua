local nvim_tree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>ft", vim.cmd.NvimTreeToggle)

nvim_tree.setup({
    update_focused_file = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

vim.g.mapleader = " "

-- Opens file explorer -- See nvim-tree.lua
-- vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

-- Toggles quickfix
vim.keymap.set("n", "<leader>qf", function()
        if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1
        then
            vim.cmd("copen")
        else
            vim.cmd("cclose")
        end
    end,
    { silent = true })

-- Heavenly switcharoo
vim.keymap.set("n", "0", "^", {noremap = true})
vim.keymap.set("n", "^", "0", {noremap = true})

-- Moving lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Cursor centering
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over selection without losing buffer contents
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank into OS clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>yy", "\"+yy")

-- Delete without losing buffer content
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Automagically calls `/%s` with currently hovered word pre-entered
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Automagically calls `/` with currently hovered workd pre-enterd
vim.keymap.set("n", "<leader>/", [[/<C-r><C-w>/gi]])

-- `chmod +x` current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

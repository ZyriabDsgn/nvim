local todo_comments = require("todo-comments")

vim.keymap.set("n", "]t", function()
    todo_comments.jump_next()
end)

vim.keymap.set("n", "[t", function()
    todo_comments.jump_prev()
end)

vim.keymap.set("n", "<leader>td", function()
    vim.cmd("TodoTrouble")
end)

todo_comments.setup({
    highlight = {
        pattern = [[.*<(KEYWORDS)\s*]]
    },
    search = {
        pattern = [[\b(KEYWORDS)]]
    }
})

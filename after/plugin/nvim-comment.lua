local nvim_comment = require("nvim_comment")

vim.keymap.set("n", "<C-/>", function()
    vim.cmd("CommentToggle")
end)

nvim_comment.setup({
    comment_empty = false,
    create_mappings = false,
    -- Visual mode support
    operator_mapping = "<C-/>"
})

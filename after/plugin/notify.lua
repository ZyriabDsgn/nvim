local notify = require("notify")

vim.keymap.set("n", "<leader><leader>", function()
    notify.dismiss()
end)

notify.setup({
    background_colour = "#000000",
    render = "compact"
})

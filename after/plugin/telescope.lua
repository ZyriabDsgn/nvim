local telescope = require("telescope")
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

vim.keymap.set("n", "<leader>gs", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<leader>lg", function()
    -- See `ripgrep`
    -- Grep client in all files under src, ignore tsx files: "client" --iglob src/** --iglob !*.tsx
    -- Grep client in all files under src, ignore components: "client" --iglob src/** --iglob !**/components/**
    -- Grep client in all files under any components directory: "client" --iglob **/components/**

    telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", "<leader>nt", function()
    telescope.extensions.notify.notify()
end)

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
        }
    }
})
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
-- telescope.load_extension("fzf")
-- telescope.load_extension("zf-native")

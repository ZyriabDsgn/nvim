local formatter = require("formatter")
-- local util = require("formatter.util")

local function fallback()
    vim.lsp.buf.format()
end

local function prettier()
    return {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
        stdin = true
    }
end

vim.keymap.set("n", "<leader>fm", function() vim.cmd("Format") end)

-- Format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], false)

formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,

    filetype = {
        typescript = {
            prettier
        },
        ['typescript.tsx'] = {
            prettier
        },
        javascript = {
            prettier
        },
        ["*"] = {
            fallback
        }
    }
})

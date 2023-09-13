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

local function organize_imports()
    local filetype = vim.bo.filetype

    if filetype == "typescript" or filetype == "typescriptreact"
    then
        local params = {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = ""
        }
        vim.lsp.buf.execute_command(params)
    end
end

vim.keymap.set("n", "<leader>fm", function() vim.cmd("Format") end)
vim.keymap.set("n", "<leader>imp", organize_imports)

-- Format on save
-- TODO: replace this with nvim API (lua)
-- also, if TS/JS/TSX/JSX sort imports
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
        typescriptreact = {
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

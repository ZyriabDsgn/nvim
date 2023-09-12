vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix"))
local empty = vim.fn.empty
local filter = vim.fn.filter
local getwininfo = vim.fn.getwininfo

function Toggle_quickfix()
    if empty(filter(getwininfo(), "v:val.quickfix")) == 1
    then
        vim.cmd("copen")
    else
        print(empty(filter(getwininfo(), "v:val.quickfix")))
        vim.cmd("cclose")
    end
end

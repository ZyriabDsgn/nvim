if vim.loop.os_uname().sysname == "Linux" then
    -- xiyaowong/transparent.nvim
    vim.cmd("TransparentEnable")
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
end

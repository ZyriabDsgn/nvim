 function ColorsAreNice()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

     -- xiyaowong/transparent.nvim
     vim.cmd("TransparentEnable")

     vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
 end

 ColorsAreNice()

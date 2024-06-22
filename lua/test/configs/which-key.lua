
local status, wh = pcall(require, "which-key")
if not status then
    return
end

vim.o.timeout = true
vim.o.timeoutlen = 300
wh.setup({

})

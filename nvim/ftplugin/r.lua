local vim = vim
local ts_r = require('ts_r')
vim.keymap.set('n', '<leader>r', function() ts_r.open_term() end)
vim.keymap.set('n', '<leader>q', function() ts_r.close_term() end)
vim.keymap.set('n', '<leader>l', function() ts_r.send_line() end)
vim.keymap.set('v', '<leader>s', function() ts_r.send_selection() end)
vim.api.nvim_create_autocmd({'VimEnter'}, {
    --pattern = {"*.r", "*.rmd"},
    callback = function() ts_r.open_term() end,
})

vim.keymap.set('i', ';a', ' <- ')
vim.keymap.set('i', ';s', ' %>% ')

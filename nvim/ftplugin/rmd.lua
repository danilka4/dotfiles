local ts_r = require('ts_r')
vim.cmd.source("~/.config/nvim/ftplugin/r.lua")
vim.keymap.set('n', '<leader>c', function() ts_r.send_chunk() end)

local nnoremap = require("keymap").nnoremap
local silent = { silent = true }

local vim = vim

-- sets leader to comma
vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>fF', '<Cmd>lua require("telescope.builtin").find_files({cwd="/home/lizzy"})<cr>')

nnoremap("<leader>`", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>q", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>1", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>2", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>3", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>4", function() require("harpoon.ui").nav_file(4) end, silent)
nnoremap("<leader>5", function() require("harpoon.ui").nav_file(5) end, silent)
nnoremap("<leader>6", function() require("harpoon.ui").nav_file(6) end, silent)

--nnoremap("<leader>r", function() require("ts_r").open_term()end, silent)
--nnoremap("<leader>q", function() require("ts_r").close_term()end, silent)
--nnoremap("<leader>l", function() require("ts_r").send_line()end, silent)
--nnoremap("<leader>c", function() require("ts_r").send_chunk()end, silent)

local ts_r = require('ts_r')
vim.api.nvim_create_autocmd({'VimEnter'}, {
    pattern = {"*.r", "*.rmd"},
    callback = function() ts_r.open_term() end,
})

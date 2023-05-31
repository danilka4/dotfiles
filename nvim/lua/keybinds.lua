local nnoremap = require("keymap").nnoremap
local silent = { silent = true }

local vim = vim

-- sets leader to space
vim.g.mapleader = " "

-- Saves in insert mode
vim.keymap.set('i', '<c-s>', '<esc>:w<cr>a')

-- Records tea in insert mode
vim.keymap.set('i', '<c-t>', '<esc>:!tea<cr>a')

-- Opens vimrc
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')

-- <c-vim arrows> switches screen
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- <c-vim arrows> switches screen in terminal mode
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')

vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>fF', '<Cmd>lua require("telescope.builtin").find_files({cwd="/home/lizzy"})<cr>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").live_grep({cwd="/home/lizzy/Documents/latex/", glob_pattern="sources.bib", disable_coordinates=true, use_regex=true, default_text="@.*\\\\{",path_display = function() return "" end})<cr>')

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

require'toggleterm'.setup{}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = "float"})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
vim.keymap.set("i", "]]", "a<Esc>r'a")

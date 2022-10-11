vim.cmd("let g:everforest_transparent_background=2")
vim.cmd("let g:everforest_ui_contrast = 'high'")
vim.cmd("let g:everforest_better_performance = 1")
vim.cmd("colorscheme everforest")

require('colorizer').setup({ '*' }, {
    RRGGBBAA = true,
})

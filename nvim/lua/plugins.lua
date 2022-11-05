local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugins/plugged')
--Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'karoliskoncevicius/vim-sendtowindow' -- Sends input to another window
Plug 'tpope/vim-fugitive' -- OP git stuff

-- Color
Plug 'sainnhe/everforest'
Plug 'norcalli/nvim-colorizer.lua'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug 'unblevable/quick-scope' -- Makes f/t better

-- Auto-completion engine
Plug 'neovim/nvim-lspconfig' -- LSP installation
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'uga-rosa/cmp-dictionary'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

Plug 'SirVer/ultisnips' -- Snippets
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- Discord integration
Plug 'andweeb/presence.nvim'

-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })
Plug 'jvgrootveld/telescope-zoxide'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- Harpoon
Plug 'ThePrimeagen/harpoon'

Plug 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

-- Snips
--Plug 'honza/vim-snippets'

-- Tests startup time
Plug 'dstein64/vim-startuptime'
vim.call('plug#end')


" autocomplete settings


"Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="'"
let g:UltiSnipsJumpBackwardTrigger="//"


"
" general stuff
"

" starts up vim at last known position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" removes whitespace upon saving a file ~~and then returns to last seen location~~
" autocmd BufWritePre * :%s/\s\+$//e

" sets :Q to quit
command! Q q

" sets :W to quit
command! W w

" sets path to be everything
set path+=**

" allows for the opening and closing of init.vim from other files
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" autocmd! bufwritepost init.vim source %

" nohlsearch remap
nnoremap <leader><space> :nohlsearch<CR>

" sets <c-j> to make a new line instead of split line in half
inoremap <c-j> <Esc>o

" sets up better searching
set incsearch   " highlight all as you type
set ignorecase  " ignore case
set smartcase   " don't ignore uppercase

" uses <C-vim arrows> to switch screens
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

inoremap <C-s> <Esc>:w<CR>a
inoremap <C-a> <Esc>A

" Git related things
nnoremap <Leader>ga :Git add %<CR>
nnoremap <Leader>gA :Git add -A<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gp :Git push<CR>


nnoremap <Leader>n :UltiSnipsEdit<CR>

set splitright splitbelow " sets splitting priorities

" Goes to next area of snippet
"inoremap ;; <esc>:call search('<++>', 'zW')<CR>"_c4l
"vnoremap ;; <esc>:call search('<++>', 'zW')<CR>"_c4l

" Discord shit
let g:presence_neovim_image_text   = "The One True Text Editor"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"
" all presets for R/R-adjacent
"

let g:sendtowindow_use_defaults=0 " prevents window setting from using defaults

tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-l> <C-\><C-n><C-w>l


autocmd FileType r source ~/.config/nvim/lua/r.vim
autocmd FileType rmd source ~/.config/nvim/lua/rmd.vim
autocmd FileType rmd source ~/.config/nvim/lua/r.vim


"
" presets for tex stuff
"
let g:tex_flavor = "tex"
autocmd FileType tex call SetTexOptions()
function SetTexOptions()
        "nnoremap <Leader>p :w<CR>:silent !latexmk -pdf -xelatex %<CR>
        "au VimEnter * silent !zathura $(echo % | sed 's/tex$/pdf/') & disown
        "nnoremap <Leader>p :w<CR>:silent !latexmk -quiet -pv "%"<CR>:redraw!<CR>
        nnoremap <Leader>o :!latexmk -pdf -pv "%"<CR>
        nnoremap <Leader>x :w<CR>:!latexmk -xelatex "%"<CR>
        au BufWritePost * call jobstart('latexmk -shell-escape -pdf '.expand('%'))
        nnoremap <Leader>v :!zathura $(echo % \| sed 's/tex$/pdf/') --config-dir=~/.config/zathura/texrc --fork<CR><CR>
        nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
        inoremap ]] =<Esc>r'a
        au VimLeave * !latexmk -c %
        au VimLeave * !rm *.bbl
        au VimLeave * !rm *.xdv
        au VimEnter * call jobstart("grep '^@' $HOME/Documents/latex/sources.bib | cut -d '{' -f2 | cut -d ',' -f1 > $HOME/Documents/latex/authors.dic")
    nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/tex.snippets<CR>
    nnoremap <leader>ek :split ~/.local/share/nvim/plugins/plugged/vim-snippets/UltiSnips/tex.snippets<CR><CR>
    nnoremap <Leader>w :call Word_count()<CR>
    set spell spelllang=en_us,uk
    "inoremap <expr><buffer> <CR> CR()
        "set dictionary+=$HOME/Documents/latex/authors.dic
        "set complete+=k
endfunction

function Word_count()
    let l:words = str2nr(system('detex ' . expand('%') . ' | wc -w'))
    let l:paren = str2nr(substitute(Count('parencite'), '\n', '', ''))
    let l:c = words - paren
    echo 'word count: ' . c
endfunction

function! Count( word )
  redir => cnt
    silent exe '%s/' . a:word . '//gn'
  redir END

  let res = strpart(cnt, 0, stridx(cnt, " "))
  return res
endfunction

function CR()
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '') || searchpair('\\begin{enumarate}', '', '\\end{enumerate}', '')
        return "\r\\item"
    endif
    return "\r"
endfunction

" presets for md

autocmd FileType markdown,text lua require("cmp").setup.buffer { enabled = false}

autocmd FileType markdown call SetMdOptions()
function SetMdOptions()
    nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
    set spell
    "nnoremap <leader>v 
endfunction

" presets for bibliography

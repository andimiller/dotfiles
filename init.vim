set nocompatible              " be iMproved, required
filetype off                  " required


" Let's go to vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Main plugins
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
"Plug 'davidhalter/jedi-vim'
Plug 'derekwyatt/vim-scala'
"Plug 'Valloric/YouCompleteMe'
Plug 'oblitum/rainbow'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'elmcast/elm-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'tbastos/vim-lua'
Plug 'unisonweb/unison', { 'branch': 'trunk', 'rtp': 'editor-support/vim' }
Plug 'LnL7/vim-nix'

" nvim plugins
Plug 'junegunn/fzf'
Plug 'Shougo/echodoc.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system
call plug#end()

" Configure vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Allow comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+


" Required:
filetype plugin indent on

set nocp

set smartindent
"set tabstop=4
"set shiftwidth=4
"set expandtab

filetype on
syntax on

" Colour Schemes
set t_Co=256
set number
set backspace=indent,eol,start
colorscheme desert
hi LineNr ctermfg=grey

" Encodings
autocmd BufWritePre * :%s/\s\+$//e
set encoding=utf-8

" Status Bar
set laststatus=2
let g:airline_powerline_fonts = 1

" Rainbow brackets
let g:rainbow_active = 1

" Keymaps
nnoremap <F2> :set nu!<CR>
nnoremap <F3> :set paste!<CR>
nnoremap <F4> :GitGutterToggle<CR>

au FileType tex map <F5> :w<CR> :exec "!pdflatex %"<CR> :exec "!pdflatex %"<CR><CR>
au FileType python map <F5> :w<CR> :exec "!python %"<CR>
nmap <F8> :TagbarToggle<CR>

autocmd BufRead,BufNewFile *.csdl set filetype=csdl
autocmd BufRead,BufNewFile *.yml set filetype=ansible
autocmd BufRead,BufNewFile *.elm set filetype=elm

nnoremap gb :e #<CR>

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab


" and all the stuff for metals

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

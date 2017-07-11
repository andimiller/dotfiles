set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add or remove your Bundles here:
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'Valloric/YouCompleteMe'
Plugin 'oblitum/rainbow'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ensime/ensime-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
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
nnoremap <F5> :EnTypeCheck<CR>

au FileType tex map <F5> :w<CR> :exec "!pdflatex %"<CR> :exec "!pdflatex %"<CR><CR>
au FileType python map <F5> :w<CR> :exec "!python %"<CR>
nmap <F8> :TagbarToggle<CR>

autocmd BufRead,BufNewFile *.csdl set filetype=csdl
autocmd BufWritePost *.scala :EnTypeCheck

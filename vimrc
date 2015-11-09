"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/andi/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/andi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'oblitum/rainbow'
NeoBundle 'fatih/vim-go'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'airblade/vim-gitgutter'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set nocp

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

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

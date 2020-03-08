" -- Vim Plug ------------------------------------------

if empty(glob('~/.local/share/nvim/site/autoload//plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Install Oceanic-Next Theme
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/vim-color-forest-night'
Plug 'rhysd/vim-color-spring-night'
Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-sensible'

" File Tree explorer with icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Bottom tab bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git Status
Plug 'tpope/vim-fugitive'

" js and jsx syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Linting
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['css'] = ['eslint']

" Code Intellisense (node dependency)
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" File support
" .plist
Plug 'darfink/vim-plist'
let g:plist_display_format = 'xml'

call plug#end()

" Open NerdTree at Start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"-- General Settings -------------------------------------

set nocompatible
set encoding=utf8
set nolazyredraw

set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
filetype on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set cursorline
set number
set rnu
set mouse=a
set nowrap
set background=dark

" highlight chars exceeding 80 char line limit blue
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

"-- Keybindings ------------------------------------------
let mapleader = ","

nnoremap ; :
nnoremap : ;

:imap jj <Esc>
nmap o o<Esc>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap U <C-r>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>r :so $MYVIMRC<CR>

nmap <F4> ;NERDTreeToggle<CR>

"-- Commands ---------------------------------------
command! RemoveWhite %s/\s\+$//e

"-- Theming ----------------------------------------------
syntax enable
colorscheme nord

highlight Normal ctermbg=NONE guibg=NONE
highlight SignColumn guibg=#FFFFFF
highlight VertSplit cterm=NONE ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermfg=darkblue
highlight clear LineNr
highlight LineNr ctermfg=darkgrey
set fillchars=vert:\|

" Airline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%2l:%L'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ale
let g:ale_change_sign_column_color=1
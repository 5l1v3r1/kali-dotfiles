""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc - vim configuration file
"
" Version: 0.31_kali - wed 31 jan 2018, 16.07.33
" Author: Brainfuck
"
""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""
" Don't try to be vi compatible
set nocompatible

" Enable filetype plugins
filetype on
filetype plugin indent on

" Load plugins with Pathogen
execute pathogen#infect()

" vimwiki plugin settings
let g:vimwiki_list = [{'path': '~/documents/vimwiki/index.wiki'}]


""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
syntax on

" Set ctermbg to none
highlight NonText ctermbg=none

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1

" Show line number
set number

" Folding settings
set foldmethod=marker
set foldmarker={{,}}

" Highlight current line
"set cursorline

" Highlight matching parenthesis
set showmatch

" Show command in bottom bar
set showcmd

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal settings
set t_Co=256
set termguicolors

" Colorscheme
colorscheme iceberg
set background=dark

" Extend background color to the whole screen (xfce4-terminal fix)
set t_ut=

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Fonts (if not set, use default terminal fonts)
"set gfn=Monospace\ 11

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, swap file off
set nobackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""
" => Memory, CPU
""""""""""""""""""""""""""""""""""""""""""""
" Keep more info in memory to speed thing up
set hidden
set history=100


""""""""""""""""""""""""""""""""""""""""""""
" => Text, tabs, indent
""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" indentLine plugin settings: indent lines style
let g:indentLine_char = '│'


""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion, linting
""""""""""""""""""""""""""""""""""""""""""""
" Completion popup settings (:help 'completeopt')
set completeopt-=preview
set completeopt+=menuone,noinsert,noselect

" MUComplete plugin settings:
let g:mucomplete#enable_auto_at_startup = 1

" Shut off completion messages
set shortmess+=c

" If Vim beeps during completion
set belloff+=ctrlg

" Ale plugin settings
let g:ale_enabled = 1

" Run linter only after save the file
let g:ale_lint_on_text_changed = 'never'

" Don't run linter after open a file
let g:ale_lint_on_enter = 0

" Navigate between errors
nmap <silent> <C-k> <Plug>
nmap <silent> <C-j> <Plug>


""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" lightline plugin settings
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }


""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
""""""""""""""""""""""""""""""""""""""""""""
" Reload vim config without restart
map \r :source ~/.vimrc<CR>

" Cancel a search with Ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" NerdTree plugin settings:
" Open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden=1


" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim
" ^ was all here from install. caused issues with solarized when reloading
" .vimrc

set nocompatible

call pathogen#infect()
call pathogen#helptags()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Enable syntax highlighting
syntax on

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on

set cursorline
set exrc        " enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files

set showmode
set showcmd     " Show (partial) command in status line.
set autowrite   " Automatically save before commands like :next and :make

" Searching
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set hlsearch  " Highlight matching search terms
set showmatch   " Show matching brackets.
nmap <silent> ,/ :nohlsearch<CR>

set hidden
set title
set scrolloff=3
set encoding=utf8
set nowrap

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent

set pastetoggle=<F2>

" Makefile uses real tabs
autocmd FileType make set noexpandtab

set spell

" Set extra filetype extensions
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.hamlc,*.hamlc.erb set ft=haml
autocmd FileType markdown setlocal spell textwidth=80
autocmd FileType liquid setlocal spell textwidth=80
autocmd FileType vimwiki setlocal spell textwidth=80
autocmd Filetype cucumber setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype apiblueprint setlocal spell textwidth=80 tabstop=4 softtabstop=4 shiftwidth=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Line numbers
set ruler
set number
set numberwidth=4
let mapleader = ","
nmap <Leader>n :set number! :set number?<CR>
nmap <Leader>rn :set relativenumber<CR>

" Switch between last buffer
nnoremap <leader><leader> <c-^>

" Fold settings
set foldmethod=indent
set foldnestmax=10
set foldcolumn=4
set nofoldenable

set autoread

set term=screen-256color
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

"colorscheme railscasts2
"colorscheme osx_like

set guifont=Ubuntu\ Mono\ 9

highlight ExtraWhitespace ctermbg=red guibg=purple
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Visualize tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" Mark column widths
set colorcolumn=80,120

" Status bar
set laststatus=2

set mouse=a   " Enable mouse usage (all modes)

" Window scrolling
nmap <Right> z<Right>
nmap <Left> z<Left>
nmap <Up> <C-y>
nmap <Down> <C-e>

" tag navigation
nmap <Leader>j :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <C-\> :pop<CR>

" Gist Options
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Start CtrlP like Command-T
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\cache|\tmp$'
let g:ctrlp_extensions = ['tag', 'buffertag']

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" vimwiki settings
let main_wiki = {
  \ 'path':   '~/Documents/sync/wiki/',
  \ 'syntax': 'markdown',
  \ 'ext':    '.md' }

let culturalist_wiki = {
  \ 'path':   '~/Documents/sync/culturalist_wiki/',
  \ 'syntax': 'markdown',
  \ 'ext':    '.md' }

let g:vimwiki_list = [main_wiki, culturalist_wiki]
let g:vimwiki_ext2syntax = {}
let g:vimwiki_global_ext = 0


" Ack.vim
let g:ackhighlight = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

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

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin on

set cursorline
set exrc        " enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files

set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set autowrite   " Automatically save before commands like :next and :make

" Searching
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set hlsearch  " Highlight matching search terms

"set hidden     " Hide buffers when they are abandoned
set title
set scrolloff=3
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Makefile uses real tabs
au FileType make set noexpandtab

" Set extra filetype extensions
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.md set ft=markdown

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Line numbers
set ruler
set number
set numberwidth=4
let mapleader = ","
nmap <Leader>n :set number! :set number?<CR>
nnoremap <leader><leader> <c-^>


set guifont=Ubuntu\ Mono\ 9

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
map <C-MiddleMouse> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <Leader>j :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <C-\> :pop<CR>

" Fold settings
"set foldmethod=indent
"set foldnestmax=20
"set foldenable
"set foldlevel=10
"set foldcolumn=0

set autoread

"Tab Navigation
map <C-t> :tabnew<CR>


set background=dark
if $COLORTERM == 'gnome-terminal'
    set term=screen-256color
    colorscheme railscasts2
    colorscheme wombat
else
    colorscheme default
endif


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
hi ColorColumn                guibg=#333435
set colorcolumn=80,120

" Status bar
set laststatus=2

" Always show the tabs and make inactive tab text easier to see
set showtabline=2
hi TabLine guifg=black

set mouse=a   " Enable mouse usage (all modes)

" Experiment w/ disabled arrow keys
inoremap  <Up>     gk
inoremap  <Down>   gj
noremap   <Up>     gk
noremap   <Down>   gj
"
" Gist Options
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Powerline
let g:Powerline_symbols='fancy'

" Start CtrlP like Command-T
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'


set nocompatible

"#########
" Plugins
"#########

so ~/.vim/plugins.vim

"#########
" General
"#########

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

let mapleader = ","
syntax on
filetype plugin indent on
set autoread
set autowrite   " Automatically save before commands like :next and :make
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set colorcolumn=80,120 " Mark column widths
set conceallevel=2 " allows syntax files to hide formatting characters
set cursorline
set encoding=utf8
set exrc " enable per-directory .vimrc files
set guifont=Ubuntu\ Mono\ 9
set hidden
set iskeyword+=-
set laststatus=2 " Status bar
set mouse=a " Enable mouse usage (all modes)
set nowrap
set pastetoggle=<F2>
set scrolloff=3
set secure " disable unsafe commands in local .vimrc files
set showcmd " Show (partial) command in status line.
set showmode
set spell
set title
set omnifunc=syntaxcomplete#Complete

" Searching
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set hlsearch   " Highlight matching search terms
set showmatch   " Show matching brackets.
nmap <silent> ,/ :nohlsearch<CR>

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent
autocmd FileType make set noexpandtab " Makefile uses real tabs

" Extra filetype options
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.hamlc,*.hamlc.erb set ft=haml
autocmd FileType markdown setlocal spell textwidth=80
autocmd FileType liquid setlocal spell textwidth=80
autocmd Filetype cucumber setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72

" Line numbers
set ruler
set number
set relativenumber
set numberwidth=4
nmap <Leader>rn :set relativenumber<CR>
nmap <Leader>nr :set norelativenumber<CR>

" Fold settings
set foldmethod=indent
set nofoldenable

" Colorscheme
set t_Co=16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Visualize tabs and trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=purple
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tag navigation
nmap <Leader>j :tab split<CR>:exec("tjump ".expand("<cword>"))<CR>
nmap <C-\> :pop<CR>

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Switch between last buffer
nnoremap <leader><leader> <c-^>

" Map `:w!!` to save with sudo when file is 'readonly'
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"############
" netrw settings
"############

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_winsize=30
nnoremap <leader>f :Vexplore<CR>

"############
" Gist Options
"############

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"############
" tagbar settings
"############

let g:tagbar_usearrows = 1
let g:tagbar_sort = 0
nnoremap <leader>l :TagbarToggle<CR>

"############
" Notes / Simple Markdown Wiki helpers
" I should really learn some vimscript
"############
"
nnoremap <leader>1ww :e ~/sync/Documents/notes/wiki/index.md<CR> :lcd %:p:h<CR>
nnoremap <leader>1wt :tabnew ~/sync/Documents/notes/wiki/index.md<CR> :lcd %:p:h<CR>
nnoremap <leader>2ww :e ~/sync/Documents/notes/contactually_wiki/index.md<CR> :lcd %:p:h<CR>
nnoremap <leader>2wt :tabnew ~/sync/Documents/notes/contactually_wiki/index.md<CR> :lcd %:p:h<CR>
" allow space as valid filename character. Allows use of `gf` type commands
" when cursor is over a markdown link like [This link](Link to a file.md)
set isfname+=32
nnoremap <leader>dp "=strftime("%Y-%m-%d")<CR>p
nnoremap <leader>dP "=strftime("%Y-%m-%d")<CR>P

"############
" vim-markdown
"############

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

"############
" Ack.vim
"############

let g:ackhighlight = 1
" use faster silversearcher-ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'


"############
" vim-javascript
"############

let g:javascript_plugin_jsdoc = 1

"############
" vim-jsx
"############

let g:jsx_ext_required = 0

"############
" vim-airline
"############

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#warning_symbol = '⚠'
let g:airline#extensions#ale#error_symbol = '✗'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

"############
" fzf
"############

nmap <leader>b :Buffers<CR>
nmap <leader>t :GFiles<CR>

"############
" ale
"############

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_error_str = '✗ Error'
let g:ale_echo_msg_format = '[%linter% %severity%] %s'
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters = {
\   'ruby': ['rubocop', 'ruby'],
\}

"############
" indentLines
"############

let g:indentLine_enabled = 0

"############
" incsearch
"############

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"##########
" deoplete
"##########

let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 50000000

"############
" neosnippet
"############

let g:neosnippet#snippets_directory='~/.vim/snippets'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

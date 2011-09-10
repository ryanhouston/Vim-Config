" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible

call pathogen#infect()

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set exrc        " enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files

set showcmd		  " Show (partial) command in status line.
set showmatch	  " Show matching brackets.
set autowrite	  " Automatically save before commands like :next and :make

" Searching
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set hlsearch  " Highlight matching search terms

"set hidden     " Hide buffers when they are abandoned
set title
set scrolloff=3
set tabstop=2
set expandtab

" make uses real tabs
au FileType make set noexpandtab

set ruler
set number
set numberwidth=4
let mapleader = ","
nmap <Leader>n :set number! :set number?<CR>

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
map <C-MiddleMouse> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <Leader>j :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

set foldmethod=indent
set foldnestmax=20
set foldenable
set foldlevel=10
set foldcolumn=0

set guifont=Monaco\ 8
set statusline=%{fugitive#statusline()}:\ %F\ %=[%c,%l]\ (%P)
set autoread

"Cut'n'Paste to system clipboard
noremap <C-S-c> "+y<CR>
"map <C-S-v> "+p


"Tab Navigation
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
map <C-t> :tabnew<CR>

"NERDTree Options
nmap <Leader>f :NERDTreeToggle<CR>
nmap <F3> :NERDTreeMirror<CR>
nmap ntf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=25
" Start NERDTree with VIM automagically
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
" Do not leave cursor in NERDTree buffer
autocmd VimEnter * wincmd p


"ConqueTerm
nmap <F9> :bel :sp<CR>:ConqueTerm bash<CR>
let ConqueTerm_CloseOnEnd=1
"let ConqueTerm_InsertOnEnter=1

if $COLORTERM == 'gnome-terminal' 
    set term=xterm-256color 
    colorscheme railscasts2
else 
    colorscheme default 
endif 

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set colorcolumn=80,120
"hi ColorColumn ctermbg=black
"hi ColorColumn guibg=black

set mouse=a		" Enable mouse usage (all modes)

" Quit if NERDTree is the only buffer open
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" Command-T Options
let g:CommandTAcceptSelectionSplitMap='<C-o>'
let g:CommandTMaxHeight=20

" Gist Options
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Status bar
set laststatus=2

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

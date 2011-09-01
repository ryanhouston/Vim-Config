" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

call pathogen#infect()

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set exrc        " enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files
set showcmd		" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set ruler
"set hidden     " Hide buffers when they are abandoned
set title
set scrolloff=3
set tabstop=2
set expandtab
set number
set numberwidth=4
let mapleader = ","
nmap <Leader>n :set number! :set number?<CR>

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
map <C-MiddleMouse> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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
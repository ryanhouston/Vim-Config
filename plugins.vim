call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'danchoi/ri.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
"Plug 'fatih/vim-go', { 'tag': 'v1.21', 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rbong/vim-flog'
Plug 'sebdah/vim-delve'
Plug 'sheerun/vim-yardoc'
Plug 'solarnz/thrift.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'tpope/vim-dadbod/'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

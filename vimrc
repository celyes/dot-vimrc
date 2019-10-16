"vimrc file By celyes
"GitHub: @celyes

" NOTE: you need to create 'backup', 'swap', 'undo' and undodir folders inside ~/.vim
" NOTE: in order for airline to look good, you need to install and select powerline fonts pack
" NOTE: markonm/traces.vim is incompatible with neovim - to make it work, turn off inccommand
" NOTE: in order to make language client work, you need to execute:
"      yarn global add javascript-typescript-langserver
" That will install javascript-typescript-stdio

if empty(glob('~/.vim/tmp'))
    silent !mkdir -p ~/.vim/tmp
endif
set directory=$HOME/.vim/tmp


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Vim-Plug auto installation                "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Plugins area                        "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

""""""" Vim appearance """""""

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""""""""""""""""""""""""""""""""""""""

""""""" Search """""""
" File fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" AMAZING plugin for searching text inside project
Plug 'mhinz/vim-grepper'

""""""""""""""""""""""

""""""" Syntax highlighters/indents """""""

Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
" Language pack for many languages
Plug 'sheerun/vim-polyglot'

"""""""""""""""""""""""""""""""""""""""""""

""""""" Utility """""""

" Project tree explorer
" Easy commenting plugin, press gc to comment a line in visual mode or gcc in normal mode
Plug 'tpope/vim-commentary'
" autoclosing brackets
Plug 'Raimondi/delimitMate'
" autoclosing html tags
Plug 'alvan/vim-closetag'
" changing surroundings of the selection, cs"' changes " to ', ds" deletes ", cst" adds "
Plug 'tpope/vim-surround'

" To make tsuguyomi work
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Async intellisense for typescript (as well as error highlighting
Plug 'Quramy/tsuquyomi'
" Async linter
Plug 'w0rp/ale'
" Dispatching actions
Plug 'tpope/vim-dispatch'
" Changing root to project dir on every file open
Plug 'airblade/vim-rooter'
" Tmuxline
Plug 'edkolev/tmuxline.vim'
" Git integration for vim (installed to see branch name on vim-airline), useful for :GitBlame
Plug 'tpope/vim-fugitive'
" For testing integration
Plug 'janko-m/vim-test'
" For integrating tmux with vim (for janko-m/vim-test)
Plug 'benmills/vimux'
" An amazing plugin for live preview when executing substitute command
Plug 'markonm/traces.vim'
" Highlights new/mofified/deleted lines in the "gutter"
Plug 'mhinz/vim-signify'
" If you prefer Ctrl+h/j/k/l for navigating across vim/tmux splits,
" this plugin will integrate Vim and Tmux, so that you can seamlessly
" Jump across the border of a vim/tmux split
Plug 'christoomey/vim-tmux-navigator'

"""""""""""""""""""""""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Settings area                       "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype indent plugin on
syntax on
 
"solarized color scheme
syntax enable

" To make colors work, note that you need to change ^[ to actual esc, so do
" <C-v><ESC>
" set t_8f=[38;2;%lu;%lu;%lum
" set t_8b=[48;2;%lu;%lu;%lum

set termguicolors "to enable true colors
set background=dark

" set t_Co=256     "needed to work in ubuntu terminal

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set completeopt-=preview

"Must have options, highly recommended by community
set hidden
set wildmenu

set showcmd

set hlsearch
set incsearch

set nocursorcolumn

"Smart options, good for programming
set ignorecase
set smartcase

set backspace=indent,eol,start
set smarttab autoindent

set ruler

set laststatus=2
set confirm

set cmdheight=2
set shortmess=a
"show line numbers
set number

" fzf
set rtp+=/usr/local/opt/fzf

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"for webpack to catch all writes
set backupcopy=yes

" disable auto break long lines
set textwidth=0
set nowrap

"Indentation options
set expandtab
set shiftwidth=4
set softtabstop=4
"Vim will store undo externally, so after closing and reopening file you can undo changes
set undofile

"Setting .swp files to be centralized, not clutter the edit folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set pastetoggle=<F5>

""Display a faint line at 150 chars
"set colorcolumn=150

" More natural splits
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Plugins settings area               "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" arcticicestudio/nord-vim """""""


""""""" vim-airline/vim-airline """""""
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""""""" pangloss/vim-javascript """""""
let g:javascript_plugin_jsdoc = 1

""""""" othree/javascript-libraries-syntax.vim """""""
let g:used_javascript_libs = 'underscore,jquery,react'

""""""" ternjs/tern_for_vim """""""
" enable keyboard shortcuts
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

""""""" junegunn/fzf """""""


""""""" alvan/vim-closetag """""""
let g:closetag_filenames = '*.html,*.jsx,*.js'

""""""" Raimondi/delimitMate """""""
let delimitMate_matchpairs = "(:),[:],{:}"

""""""" w0rp/ale """""""
let g:ale_lint_on_text_changed = 'never'

""""""" Quramy/tsuquyomi """""""
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_disable_quickfix = 1

""""""" mhinz/vim-grepper """""""
let g:grepper = {}
let g:grepper.ag = {}
" let g:grepper.ag.grepprg = 'ag --vimgrep $* 'FindProjectRoot('.git')

""""""" mxw/vim-jsx """""""
let g:jsx_ext_required = 0

""""""" edkolev/tmuxline """""""

" For tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1
" Start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" To make it nice
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}


""""""" janko-m/vim-test """""""
let test#strategy = "vimux"
let g:test#javascript#jest#file_pattern = '.*\.spec\.js'


""""""" mhinz/vim-signify """""""
let g:signify_vcs_list = [ 'git' ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Remaps area                         "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I said write it!
cmap w!! w !sudo tee > /dev/null %

" Used for mhinz/vim-grepper
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" remap ctrl+p to :FZF
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <silent> <C-h> <c-w>h
noremap <silent> <C-l> <c-W>l
noremap <silent> <C-k> <c-w>k
noremap <silent> <C-j> <c-w>j

cnoremap tabnew :tabnew<cr>:Vexplore<cr>
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>

" This is a quick way to call search-and-replace on a current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" To make  n to always search forward and N backward
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

if executable('javascript-typescript-stdio')
  " <leader>ld to go to definition
  autocmd FileType javascript nnoremap <buffer>
    \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
  " <leader>lh for type info under cursor
  autocmd FileType javascript nnoremap <buffer>
    \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
  " <leader>lr to rename variable under cursor
  autocmd FileType javascript nnoremap <buffer>
    \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Groups area                         "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup general
    autocmd!
    " autocmd VimEnter * :Vexplore
    " autocmd vimenter * NERDTree
    " autocmd FileType netrw setl bufhidden=delete
augroup END

augroup js_files
    autocmd!
    autocmd FileType javascript let maplocalleader = ";"
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript setlocal commentstring=//%s
augroup END

"Suffixes for 'gf' command to associate filetypes with extensions (for files jumping)
augroup suffixes
    autocmd!
    let associations = [
        \["javascript", ".js,.jsx"],
        \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END

"set termguicolors
"syntax on
"color molokai


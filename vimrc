call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-syntastic/syntastic'
Plug 'wenlongche/SrcExpl', {'on': 'SrcExplToggle'}
Plug 'wenlongche/Trinity', {'on': ['TrinityToggleAll', 'TrinityToggleSourceExplorer', 'TrinityToggleTagList', 'TrinityToggleNERDTree']} 
Plug 'cstrahan/vim-capnp', {'for': 'capnp'}
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle' }
" Plug 'ghifarit53/tokyonight-vim'
Plug 'rhysd/vim-clang-format', {'on': 'ClangFormat'}
Plug 'yegappan/taglist', {'on': 'TlistToggle'}

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

colorscheme onedark

set laststatus=2
syntax on
set number
set termguicolors
set scrolloff=5
set foldmethod=indent
set cursorline
let mapleader="-"
set list listchars=tab:»-,trail:·,extends:»,precedes:«

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

let g:clang_format#code_style = 'google'

"let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_c_remove_include_errors = 1
"let g:airline#extensions#syntastic#stl_format_err = "[%E{Err: %fe #%e}]"
"let g:airline#extensions#syntastic#stl_format_warn = "[%W{Warn: %fw #%w}]"


nnoremap <F8> :TrinityToggleAll<CR>
nnoremap <F9> :TrinityToggleTagList<CR>
nnoremap <F10> :TrinityToggleSourceExplorer<CR>
nnoremap <F11> :TrinityToggleNERDTree<CR>


set clipboard=unnamed
" set timeoutlen=300

" Key map for c sources
autocmd FileType c,cpp,h nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,h vnoremap <buffer><Leader>cf :ClangFormat<CR>
" autocmd FileType c,cpp,h ClangFormatAutoEnable
autocmd FileType c,cpp,h setlocal colorcolumn=80
autocmd FileType python setlocal equalprg=yapf\ --style='{based_on_style:pep8,column_limit:100}'
" Set capnp as a file type to enable syntax highlighting
autocmd BufRead,BufNewFile *.capnp		setfiletype capnp
autocmd BufRead,BufNewFile *.dbc		setfiletype dbc

cnoremap %% <C-R>=expand("%:h")."/"<CR>

" Key for Taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window =1

" Custom keymaps
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap {<Cr> {<Cr>}<Esc>O
inoremap {{ {}<Esc>i

inoremap kj <Esc>
nnoremap <Enter> o<Esc>

vnoremap < <gv
vnoremap > >gv

nnoremap j gj
nnoremap k gk

nnoremap gj :bnext<CR>
nnoremap gk :bprevious<CR>
nnoremap gd :bdelete<CR>

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

nnoremap Y y$

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap U <C-r>

nnoremap ' `
nnoremap ` '

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap ; :
nnoremap , ;

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p

nnoremap <Leader>ev :vsplit ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Space> viw

inoremap <C-u> <Esc>viwUea

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"nnoremap <C-up> <C-w>-
"nnoremap <C-down> <C-w>+
"nnoremap <C-left> <C-w><
"nnoremap <C-right> <C-w>>
nnoremap <up> <C-w>-
nnoremap <down> <C-w>+
nnoremap <left> <C-w><
nnoremap <right> <C-w>>

nnoremap zm zM
nnoremap zM zm
nnoremap zr zR
nnoremap zR zr
nnoremap za zA
nnoremap zA za

command IncreaseNumber s/\(\d\+\)/\=submatch(1)+1/g
command DecreaseNumber s/\(\d\+\)/\=submatch(1)-1/g
command Recomment %s# *//\(.*\)$#/* \1 */#
command CleanTrail %s/\s\+$//g

" ============================================================================ "
" ========================   V I M   C O N F I G U R A T I O N   F I L E   === "

" ----------------------------------------------------------- fuck off, vi --- "
set nocompatible
" vim: et:ts=4:sw=4

" ============================================================================ "
" ============================================================================ "




" ============================================================================ "
" ======================================================   P L U G I N S   === "
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ---------------------------------------------------------------------------- "

" ----------------------------------------------------------------- Vundle --- "
Plugin 'VundleVim/Vundle.vim'

" ------------------------------------------------------------ vim-airline --- "
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" --------------------------------------------------------------- NERDtree --- "
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" ---------------------------------------------------------------- tabular --- "
Plugin 'godlygeek/tabular'

" ----------------------------------------------------------------- tagbar --- "
Plugin 'majutsushi/tagbar'

" ---------------------------------------------------------- indent-guides --- "
Plugin 'nathanaelkane/vim-indent-guides'

" ---------------------------------------------------------- smooth-scroll --- "
Plugin 'Smooth-Scroll'

" ---------------------------------------------------------- vim-gitgutter --- "
Plugin 'airblade/vim-gitgutter'

" ------------------------------------------------------------ vim-easygit --- "
Plugin 'chemzqm/vim-easygit'

" -------------------------------------------------------- camelCaseMotion --- "
Plugin 'bkad/camelcasemotion'

" ------------------------------------------------- vim-operator-highlight --- "
Plugin 'Valloric/vim-operator-highlight'

" ------------------------------------------------------------------ Gundo --- "
Plugin 'sjl/gundo.vim'

" ------------------------------------------------------------open-pdf.vim --- "
Plugin 'rhysd/open-pdf.vim'

" ---------------------------------------------------------- validator.vim --- "
Plugin 'maralla/validator.vim'

" ---------------------------------------------------------- completor.vim --- "
Plugin 'maralla/completor.vim'

" ----------------------------------------------------------- Conque Shell --- "
"Plugin 'Conque-Shell'

" ------------------------------------------------------------------ ctrlP --- "
"Plugin 'kien/ctrlp.vim'

" ---------------------------------------------------- gruvbox colorscheme --- "
"Plugin 'morhetz/gruvbox'

" ----------------------------------------------------------- vimshell.vim --- "
"Plugin 'shougo/vimshell.vim'

" --------------------------------------------------------- promptline.vim --- "
"Plugin 'edkolev/promptline.vim'

" ---------------------------------------------------------- VimCompletesMe --- "
"Plugin 'ajh17/vimcompletesme'

" ---------------------------------------------------------------------------- "
call vundle#end()
filetype plugin indent on
" ============================================================================ "
" ============================================================================ "




" ============================================================================ "
" =================================================   F U N C T I O N S   ==== "

" ------------------------------------------------ RestoreCursorPosition() --- "
function! RestoreCursorPosition()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" ------------------------------------------------------------- ToSpaces() --- "
function! ToSpaces()
    set expandtab
    retab!
endfunction

" --------------------------------------------------------------- ToTabs() --- "
function! ToTabs()
    set noexpandtab
    retab!
endfunction

" ----------------------------------------------------- StripWhiteSpaces() --- "
function! StripWhiteSpaces()
    run %s/\s\+$//ec
endfunction

" ------------------------------------------------------ StripBlankLines() --- "
function! StripBlankLines()
    run global/^$/d
endfunction

" ------------------------------------------------------- create undo file --- "
if !isdirectory($HOME."/.dotfiles/vim/undodir")
    call mkdir($HOME."/.dotfiles/vim/undodir", "p")
endif

" ------------------------------------------------------------- ugh... gui --- "
if has('gui_running')
    set encoding=utf-8
    set guioptions-=T
    set guioptions-=m
end

" ------------------------------------------------------------ local vimrc --- "
if $PWD != system("pwd")
    if $PWD != $HOME
        if filereadable($PWD . "/.vimrc")
            source $PWD . "/.vimrc"
        endif
    endif
endif

" ============================================================================ "
" ============================================================================ "




" ============================================================================ "
" ====================================================   S E T T I N G S   === "

" ------------------------------------------------------------- secure vim --- "
set exrc
set secure

" --------------------------------------------------------------- encoding --- "
set encoding=utf-8

" ----------------------------------------------------- set terminal title --- "
set title

" ------------------------------------------------------------ color theme --- "
colo jellybeans

" ------------------------------------------------- highlight current line --- "
set cursorline

" -------------------------------------------------- highlight whitespaces --- "
set nolist
set listchars=tab:>-,trail:·,eol:$,extends:#,nbsp:.
"autocmd filetype html,xml set listchars-=tab:>.

" ------------------------------------------------- file-type highlighting --- "
syntax on
filetype on
filetype plugin on
filetype indent on

" ------------------------------------------------------- force 256 colors --- "
set t_Co=256

" ------------------------------------------------------------------- bell --- "
set visualbell
set noerrorbells
set t_vb=
set gcr=a:blinkon0

" --------------------------------------------------------------- printing --- "
set printoptions=paper:letter

" ----------------------------------------------------------- enable mouse --- "
set mouse=a

" ------------------------------------------------------------- spellcheck --- "
"set spell
"set spelllang=en,pl

" ------------------------------------------------------------- text width --- "
set textwidth=80
set colorcolumn=+1
set virtualedit=onemore

" ---------------------------------------------------------- line wrapping --- "
set wrap
set linebreak
set display+=lastline
set showbreak="↳ "

" ----------------------------------------------------------- text folding --- "
set foldmethod=indent
set foldmethod=syntax
set foldnestmax=10

" ------------------------------------------------------- indentation help --- "
" tabs are eight columns wide, each identation level is one tab (linx kernel):
" vim: set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
"
" tabs are four columns wide, each identation level is one tab (visual studio):
" vim: set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
"
" each indentation level is four spaces tabs are not used (java)
" vim: set softtabstop=4 shiftwidth=4 expandtab

" ------------------------------------------------------------ indentation --- "
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" -------------------------------------------------------------- searching --- "
set incsearch
set ignorecase
set smartcase
set hlsearch

" --------------------------------------------------------------- wildmenu --- "
set path=**
set wildmenu
set wildchar=<Tab>
set wildmode=full
set wildignore=*.o,*.fasl
hi WildMenu ctermfg=2 ctermbg=235

" ---------------------------------------------------------- swap & backup --- "
set noswapfile
set backup
set wb
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" ------------------------------------------------------------------- undo --- "
set undodir=~/.vim/undodir
set undofile
set undolevels=10000
set undoreload=10000

" --------------------------------------------------------- longer history --- "
set history=1000

" ------------------------------------------------ store last session info --- "
set viminfo='10,\"100,:20,%,n~/.viminfo

" -------------------------------------------- jump to last modified place --- "
autocmd BufWinEnter * call RestoreCursorPosition()

" -------------------------------------------------- diff refresh on write --- "
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" ----------------------------------- autoreload files changed outside vim --- "
set autoread

" --------------------------------------- turn off expandtab for makefiles --- "
autocmd FileType make setlocal noexpandtab

autocmd Filetype html setlocal tw=0

set shiftwidth=4
set softtabstop=4
set tabstop=4
" ---------------------------------------------------------- fix backspace --- "
set backspace=indent,eol,start

" -------------------------------------------------- minimum window height --- "
set winminheight=1
set winheight=1

" ----------------------------------------------------------- line numbers --- "
set number
set numberwidth=5

" ----------------------------------------- more context around the cursor --- "
set scrolloff=3
set sidescroll=1
set sidescrolloff=1

" -------------------------------------- not needed, vim-airline is better --- "
set noruler
set noshowcmd
set noshowmode
" ----------------------------------------------- tab line and status line --- "
set showtabline=1
set laststatus=2

" ---------------------------------------------------------- default split --- "
set splitright splitbelow

" ----------------------------------------- copy/paste to system clipboard --- "
set clipboard=unnamed

" ------------------------------------ manage multiple buffers effectively --- "
set hidden

" ------------------------------------------------------ redraw everything --- "
set nolazyredraw

" ------------------------------------------ turn off interruptive prompts --- "
set shortmess=astTI

" ----------------------------------------------------- leader key timeout --- "
set timeoutlen=500

" -------------------------------------------------- show matching bracket --- "
set showmatch
set matchtime=1

" ------------------------------------------------ you gonna love this one --- "
set relativenumber

" ============================================================================ "
" ============================================================================ "




" ============================================================================ "
" ===========================================   K E Y   M A P P I N G S   ==== "

map <C-S> <nop>
imap <C-S> <nop>
nnoremap <C-S> <nop>
inoremap <C-S> <nop>

inoremap <C-CR> <Esc><Esc>
nnoremap <C-CR> i
map <C-C>  <Esc><Esc>

" -------------------------------------------- clearing highlighted search --- "
nmap <silent> // :nohlsearch<CR>

" -------------------------------------------------------- regex searching --- "
nnoremap <leader>/ /\v
nnoremap <leader>? ?\v

" --------------------------------------------------- save files with sudo --- "
cmap w!! w !sudo tee > /dev/null %

" ------------------------------------------------------ current file diff --- "
cmap diffw exec 'w !git diff --no-index -- - ' . shellescape(expand('%'))

" ------------------------------ map key to toggle whitespace highlighting --- "
nmap <silent> <leader>w :set nolist!<CR>

" ------------------------------------------- turn off man search key bind --- "
nnoremap <S-K> <NOP>

" -------------------------------------------------- make your life easier --- "
nmap ; :

" ------------------------------------------------ build script on keybind --- "
nnoremap <F8> :!./build.sh<CR>

" ------------------------------ run compiled program by calling :!./thing --- "
let out_program = "./" . system("basename `pwd`")
nnoremap <F9> :exe ":!clear; " . out_program <CR>

" -------------------------------------------------- open shell on keybind --- "
let out_shell = system("echo $SHELL")
nnoremap <F12> :exe "!" . out_shell <CR>

" ------------------------------------------------- bind functions to keys --- "
nnoremap <silent> <Leader>tt call ToTabs()<CR>
nnoremap <silent> <Leader>ts call ToSpaces()<CR>
nnoremap <silent> <Leader>sw call StripWhiteSpaces()<CR>
nnoremap <silent> <Leader>sb call StripBlankLines()<CR>

" --------------------------------------- better movement in wrapped lines --- "
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" ---------------------------------- line-scrolling working in insert mode --- "
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

" ---------------------------------------------------- fix visual shifting --- "
vnoremap < <gv
vnoremap > >gv 
vmap <Tab> >gv
vmap <S-Tab> <gv

" ------------------------------------------------------ window management --- "
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" --------------------------------------------------- map keys for tooltip --- "
inoremap <expr> J pumvisible() ? "<Down>" : "J"
inoremap <expr> K pumvisible() ? "<Up>" : "K"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" --------------------------- map Ctrl-Space to enter and quit INSERT mode --- "
"nnoremap <C-@> i
"imap <C-@> <Esc><Esc>

" ------------------------------------------------ auto indent pasted text --- "
noremap p p=`]<C-o>
noremap P P=`]<C-o>

" ------------------------------------------------------------- safer undo --- "
inoremap <C-U> <C-G>u<C-U>

" --------------------------------------- consistent yanking with deleting --- "
nnoremap Y y$

" ------------------------------------------------ swap ` and ' characters --- "
"nnoremap ' `
"nnoremap ` '

" ------------------------------------------------------- remap leader key --- "
"let mapleader = ","

" ============================================================================ "
" ============================================================================ "




" ============================================================================ "
" ======================================   P L U G I N   S E T T I N G S  ==== "


" ------------------------------------------------------------ vim-airline --- "
let g:airline_detect_modified     = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme               = 'jellybeans'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep              = ''
let g:airline_right_sep             = ''
let g:airline_symbols.branch        = '⎇'
let g:airline_symbols.crypt         = '*'
let g:airline_symbols.linenr        = ''
let g:airline_symbols.maxlinenr     = ''
let g:airline_symbols.notexists     = ''
let g:airline_symbols.paste         = ''
let g:airline_symbols.spell         = ''
let g:airline_symbols.whitespace    = ''

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#whitespace#enabled      = 0
let g:airline#extensions#whitespace#symbol       = '!'
let g:airline#extensions#whitespace#show_message = 1

let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#show_tab_type   = 0
let g:airline#extensions#tabline#buffers_label   = 'B'
let g:airline#extensions#tabline#tabs_label      = 'T'
let g:airline#extensions#tabline#buffer_nr_show  = 0
let g:airline#extensions#tabline#fnamecollapse   = 0
let g:airline#extensions#tabline#fnametruncate   = 0

"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9
"nmap <leader>- <Plug>AirlineSelectPrevTab
"nmap <leader>= <Plug>AirlineSelectNextTab

" --------------------------------------------------------------- NERDtree --- "
map <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

" ---------------------------------------------------------------- tabular --- "
nmap <Leader>t= :Tab /=<CR>
vmap <Leader>t: :Tab /=<CR>
nmap <Leader>t: :Tab /:\zs<CR>
vmap <Leader>t: :Tab /:\zs<CR>

" ------------------------------------------------------------------tagbar --- "
nmap <F5> :TagbarToggle<CR>

" ---------------------------------------------------------- indent-guides --- "
let g:indent_guides_tab_guides = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_space_guides = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'txt', 'vimrc']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" ---------------------------------------------------------- smooth-scroll --- "
let g:scroll_factor = 300

" ---------------------------------------------------------- vim-gitgutter --- "
let g:gitgutter_sign_column_always = 0

" ------------------------------------------------------------ vim-easygit --- "
let g:easygit_enable_command = 1

" -------------------------------------------------------- camelcasemotion --- "
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" ------------------------------------------------- vim-operator-highlight --- "
let g:ophigh_color = 215

" ------------------------------------------------------------------ Gundo --- "
nnoremap <F3> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_height = 40
let g:gundo_right = 1
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" ------------------------------------------------------------open-pdf.vim --- "
let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

" ---------------------------------------------------------- validator.vim --- "
let g:validator_c_checkers = [ 'clang-tidy' ]
let g:validator_sh_checkers = [ 'shellcheck' ]

let g:validator_auto_open_quickfix = 0
let g:validator_permament_sign = 0

" ---------------------------------------------------------- completor.vim --- "

" ----------------------------------------------------------- Conque Shell --- "
"let g:ConqueTerm_PyVersion  = 3
"let g:ConqueTerm_FastMode   = 0
"let g:ConqueTerm_Color      = 1
"let g:ConqueTerm_ReadUnfocused = 1
"let g:ConqueTerm_InsertOnEnter = 1
"let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_StartMessages = 1
"let g:ConqueTerm_ToggleKey = '<NUL>'
"let g:ConqueTerm_SendVisKey = '<NUL>'

" ------------------------------------------------------------ color theme --- "
set background=dark
colo jellybeans
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = { 'background': { 'guibg': '000000' } }
hi CursorLine   ctermbg=235
hi ColorColumn  ctermbg=235
hi Folded       ctermbg=233
hi FoldColumn   ctermbg=233

" ============================================================================ "
" ============================================================================ "

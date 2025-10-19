" nocompatible is usually the default
" set nocompatible " Disable compatibility with vi which can cause unexpected issues.

" ── Security for modelines ────────────────────────────────────────────
set modelines=1
set modeline
set secure              " Secure external commands in modelines

" ── Additional performance improvements ───────────────────────────────
set timeoutlen=500          " Faster key mappings
set ttimeoutlen=10          " Very fast escape sequences
set regexpengine=1          " Old regex engine (often faster)
set complete-=i             " No includes in autocomplete

" ── Lazy loading for faster startup ───────────────────────────────────
set lazyredraw              " Redraw only when needed
set ttyfast                 " Assume fast terminal connection
set synmaxcol=200           " Syntax highlighting only up to column 200

" ── Backup configuration ──────────────────────────────────────────────
if !isdirectory(expand('~/.vim/backup'))
  call mkdir(expand('~/.vim/backup'), 'p')
endif

set backup                    " Enable backups
set writebackup               " Save before overwriting
set backupcopy=yes            " Direct copying
set backupext=.bak            " Use .bak suffix
set backupdir=~/.vim/backup   " Double slash -> NO %home% encoding

set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

" set textwidth=80
" set colorcolumn=+1

" ── Filetype handling ─────────────────────────────────────────────────
filetype on           " Enable file type detection
filetype plugin on    " Enable filetype-specific plugins
filetype indent on    " Enable filetype-specific indent file
filetype plugin indent on

syntax on

" ── FZF ───────────────────────────────────────────────────────────────
let $FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500"'

" ── NERDTree (disabled examples kept) ─────────────────────────────────
" let g:NERDTreeWinSize = 40 " Window width

" Sync NERDTree with current working directory
" let g:NERDTreeChDirMode = 2
" let g:NERDTreeRespectWildIgnore = 1

" autocmd FileType nerdtree setlocal relativenumber " Show relative numbers in NERDTree
" autocmd FileType nerdtree setlocal norelativenumber relativenumber

" let g:NERDTreeHighlightCursorline = 1 " Highlight current cursor line in the tree

" Replace netrw directory opening with NERDTree
" let g:NERDTreeHijackNetrw = 1

" nnoremap <C-n><C-n> :NERDTreeToggle<CR> " Toggle NERDTree

" Open NERDTree on start if a directory was passed
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | exe 'NERDTree' argv()[0] | wincmd p | endif

" ── NERDTree Git plugin (examples) ───────────────────────────────────
" let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
" let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusShowClean = 1 " default: 0

" ── Webdevicons ───────────────────────────────────────────────────────
let g:webdevicons_enable = 1 " load plugin
let g:devicons_enable = 1    " load plugin
let g:webdevicons_enable_ctrlp = 0 " ctrlp glyphs
let g:webdevicons_enable_startify = 1 " add to vim-startify
let g:devicons_enable_startify = 1    " add to vim-startify
let g:devicons_enable_flagship_statusline = 1 " add to flagship statusline
let g:webdevicons_enable_flagship_statusline = 1 " add to flagship statusline

" ── Disable beeping ───────────────────────────────────────────────────
set noerrorbells 
set visualbell
let &t_vb = ""

" ── Startify plugin ───────────────────────────────────────────────────
let g:startify_lists = [
\ { 'type': 'files',	'header': ['    last modified:'] },
\ { 'type': 'bookmarks', 'header': ['    bookmarks:'] },
\ ]

let g:startify_bookmarks = [
   \ {'v': '~/my_conf/vimrc'},
   \ {'f': '~/my_conf/vifmrc'},
   \ {'g': '~/my_conf/git.wiki'},
   \ {'n': '~/my_conf/Notizen.wiki'},
   \ {'b': '~/my_conf/bashrc'},
   \ {'b': '~/my_conf/bashr_aliases'},
   \ {'tm': '~/my_conf/tmux.conf'},
   \ {'p': '~/Programmierung/Python/python.py'},
   \ {'c': '~/.conkyrc'},
   \ {'gc': '~/Programmierung/projektXYZ/.git/config'},
   \ {'t': '~/.TB.txt'},
   \ {'cpp': '~/.vim/Co-Pilot.txt'},
   \]

set termguicolors

" Automatically jump cursor to last change position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

autocmd BufNewFile,BufRead *.jsonc set filetype=jsonc
autocmd FileType jsonc set syntax=json

" ── Plugin: Yggdroot/indentline ───────────────────────────────────────
let g:indentLine_char = '┊'
let g:indentLine_color_gui = '#626262'
let g:indentLine_color_term = 240
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 0

" Ensure no filetypes are excluded
let g:indentLine_fileTypeExclude = []
let g:indentLine_bufTypeExclude = []

" ── Cursor shapes ─────────────────────────────────────────────────────
let &t_SI = "\e[6 q"   " Insert = beam
let &t_SR = "\e[4 q"   " Replace = underline
let &t_EI = "\e[2 q"   " Normal = block

" Set cursor to block at startup (Normal mode)
silent! !printf "\033[2 q"
autocmd VimLeave * silent! !printf "\033[ q"

" ── NERDCommenter ────────────────────────────────────────────────────
" [count]<leader>cc = Comment
" [count]<leader>cs = Comment (aligned)
" [count]<leader>c<space> = Toggle comment
" [count]<leader>cu = Uncomment
let mapleader = ","
inoremap ,c :call NERDComment(0,"toggle")<CR>
let NERDSpaceDelims = 1

set tags=./tags;,tags

" ── Sessions ──────────────────────────────────────────────────────────
" Save session -> :mksession ~/.vim/session.vim
" Load session -> :source ~/.vim/session.vim
set sessionoptions=blank,buffers,curdir,folds,globals,help,tabpages,winsize,terminal

set number
" map <C-N><C-N> :set inrelativenumber<CR> " Toggle relative line number
nnoremap <silent> <C-n> :set relativenumber!<CR>

" Controls the number of columns used to display line numbers
set numberwidth=4

" set spell spelllang=de,en
" autocmd FileType markdown,text,gitcommit setlocal spell spelllang=de

autocmd BufNewFile,BufRead *.conkyrc,conky.conf set filetype=lua

" ── Disable Copilot for all filetypes except … ────────────────────────
let g:copilot_filetypes = {
    \'*': v:false,
    \'php': v:true,
    \'javascript': v:true,
    \'html': v:true,
    \'css': v:true,
\}

set display+=lastline   " Prettier display of long wrapped lines
set nowrap              " Do not wrap lines
set showmatch           " Briefly jump to matching bracket
set matchtime=2

set path+=**            " Use 'find' to search in subdirectories as well

" ── Completion UI ─────────────────────────────────────────────────────
set wildmenu
set wildmode=list:longest,full

set laststatus=2

" ── Insert blank lines without entering insert mode ───────────────────
" Shift+Enter
nnoremap <S-CR> O<Esc>S<Esc>j
" Ctrl+Enter
nnoremap <C-CR> o<Esc>S<Esc>k

" Disable automatic insertion of the current comment leader after
" pressing 'o' or 'O' in Normal mode, or <Enter> in Insert mode.
autocmd FileType * setlocal formatoptions-=ro

" ── Manage plugins with vim-plug ──────────────────────────────────────
" PlugInstall  | Install the plugins 
" PlugUpdate   | Install or update the plugins
" PlugDiff     | Review changes from the last update
" PlugClean    | Remove plugins not listed
" PlugStatus   |
" PlugUpgrade  | Update vim-plug
" , {'on':[]}  | Disable plugin without uninstall

call plug#begin()
    Plug 'itspriddle/vim-shellcheck'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go development
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion' " Better movement commands (,,w or ,,b)
    Plug 'github/copilot.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-plug' " To show vim-plug help
    Plug 'kshenoy/vim-signature' " Show marks
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox' " Colorscheme
    Plug 'pangloss/vim-javascript' " Extra JS highlighting
    Plug 'rstacruz/vim-closer'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdcommenter' " Easy commenting
    Plug 'SirVer/ultisnips' " Snippets
    Plug 'tpope/vim-fugitive', { 'on': 'Git' }
    Plug 'vifm/vifm.vim' " Integration with Vifm
    Plug 'vim-scripts/vimwiki'
    Plug 'yggdroot/indentline' " Show indent guides
call plug#end()

let g:rainbow_active = 1 " set to 0 to enable later via :RainbowToggle

" ── Go settings ───────────────────────────────────────────────────────
" go_fmt_command='gopls' is not a valid formatter for vim-go.
" Use goimports (or gofumpt) and keep gopls for LSP only:
let g:go_fmt_command = 'goimports'
let g:go_gopls_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
nnoremap <leader>r :GoRun<CR>

au BufRead,BufNewFile *.go set filetype=go

" ── Google Calendar (examples) ────────────────────────────────────────
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" let g:calendar_diary = '~/.vim/calendar'
" source ~/.cache/calendar.vim/credentials.vim

" ── Statusline plugin 'lightline' ─────────────────────────────────────
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [
      \     ['alien', 'mode', 'paste'],
      \     ['readonly', 'filename', 'modified']
      \   ]
      \ },
      \ 'component': {
      \   'alien': '👽'
      \ }
      \ }

" ── Enable UltiSnips ─────────────────────────────────────────────────
let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<c-b>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
" Jump forward (next placeholder)

" ── Split navigation ─────────────────────────────────────────────────
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sensible?
set showtabline=2

" No blinking cursor
set gcr=a:blinkon0 

set shellslash

" ── Colorschemes ─────────────────────────────────────────────────────
silent! colorscheme gruvbox 
set background=dark

" Matching parentheses
highlight MatchParen cterm=bold ctermfg=0 ctermbg=208 gui=bold guifg=black guibg=white

set tabstop=4    " Number of spaces inserted for a <Tab>
set shiftwidth=4 " Indentation width
set expandtab    " Insert spaces instead of tabs

" For shell scripts (sh, bash, zsh …) set tabstop and indentation to 2
augroup sh_indent
  autocmd!
  autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

set backspace=2  " Normal backspace behavior

" Show fileencoding and BOM in the status line
if has("statusline")
" set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" ── Encoding ─────────────────────────────────────────────────────────
set encoding=utf-8        " Vim internal encoding is UTF-8
set fileencoding=utf-8    " New files are saved as UTF-8
" Detection order when opening files
set fileencodings=utf-8,latin1 " Helps detect files accidentally saved as latin1

set noshowmode     " Lightline shows the current mode
set ruler          " Show current cursor position
set nojoinspaces   " Only one space after ., ?, ! when joining lines
set pastetoggle=<F8> " Prevent stair-step effect on copy & paste

set hlsearch       " Highlight search matches
" Disable search highlighting with Ctrl+L
nnoremap <C-l> :nohlsearch<CR><C-l>

set incsearch      " Jump to matches while typing
set ignorecase     " Case-insensitive search …
set smartcase      " … unless the pattern contains uppercase
set showcmd        " Show typed command in the status line
set title          " Show current file in the window title

" ── Useful UI fine-tuning ────────────────────────────────────────────
" set signcolumn=yes           " Avoid layout jumping with lint/VC signs
set signcolumn=auto
set scrolloff=3             
set sidescrolloff=0
set splitright | set splitbelow
set updatetime=300           " Faster CursorHold (e.g., for LSP/Lightline)
set confirm                  " :q with unsaved buffers → confirmation instead of error

set equalalways
autocmd VimResized * wincmd =
" optional, if it ever “sticks”:
" autocmd VimResized * redraw!

" ── VisualCopyToClipboard (function) ─────────────────────────────────
function! VisualCopyToClipboard()
  if executable('wl-copy') && $XDG_SESSION_TYPE ==# 'wayland'
    execute ":'<,'>w !wl-copy"
    redraw | echomsg "✅ Kopiert mit wl-copy"
  elseif executable('xclip')
    execute ":'<,'>w !xclip -selection clipboard"
    redraw | echomsg "✅ Kopiert mit xclip"
  else
    redraw | echomsg "❌ Kein Clipboard-Tool gefunden"
  endif
endfunction

" Visual-mode mapping
vnoremap <Leader>y :<C-u>call VisualCopyToClipboard()<CR>

" ── PasteFromClipboard (function) ────────────────────────────────────
function! PasteFromClipboard()
  if executable('wl-paste') && $XDG_SESSION_TYPE ==# 'wayland'
    execute "normal! a\<Esc>\"=system('wl-paste')\<CR>p"
    echomsg "📥 Eingefügt mit wl-paste"
  elseif executable('xclip')
    execute "normal! a\<Esc>\"=system('xclip -o -selection clipboard')\<CR>p"
    echomsg "📥 Eingefügt mit xclip"
  else
    echomsg "❌ Kein Paste-Tool gefunden"
  endif
endfunction

nnoremap <Leader>p :call PasteFromClipboard()<CR>

" Your functions are fine; using the built-in clipboard would be more modern:
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif

" ── Bugfix: Vim + Kitty + italics ────────────────────────────────────
if &term =~ "kitty"
    let &t_ZH = "\e[3m"
    let &t_ZR = "\e[23m"
endif

highlight Comment        cterm=italic gui=italic
highlight Todo           cterm=italic gui=italic
highlight SpecialComment cterm=italic gui=italic

augroup ItalicConfComments
    autocmd!
    autocmd BufRead,BufNewFile *.conf setlocal filetype=conf
    autocmd FileType conf highlight Comment cterm=italic gui=italic
augroup END

" ── Mappings ─────────────────────────────────────────────────────────
" Toggle cursorline highlighting with F3
" Broken
" map <F3> :set cursorline!<CR><Bar>:echo 'Highlight active cursor line: ' . strpart('OffOn', 3 * &cursorline, 3)<CR>

" Keep normal Enter behavior
" inoremap <CR> <CR>

" Shift+Enter removes comment leader at start of line
" inoremap <S-CR> <C-o>:set formatoptions-=r<CR><CR><C-o>:set formatoptions+=r<CR>

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

noremap <F4> <Esc>:w<CR>:!clear;python3 %<CR>

" Select all text
nnoremap <leader>a ggVG

" sudo write
cnoremap w!! %!sudo tee > /dev/null %

" Reload vimrc
cnoremap s$ w \| source $MYVIMRC<CR>

" ── Vim-Plug (command-line helpers) ──────────────────────────────────
" Install the plugins 
cmap PI <bar> PlugInstall<CR>
" Install or update the plugins
cmap PU <bar> PlugUpdate  <CR>
" Review changes from the last update
cmap PD <bar> PlugDiff<CR>
" Remove plugins no longer in the list
cmap PC <bar> PlugClean<CR>
cmap PS <bar> PlugStatus<CR>
" Update vim-plug
cmap PUg <bar>PlugUpgrade<CR>

cnoremap cop <bar> :Copilot panel<CR>
cnoremap  cpp <bar>:vsplit ~/.vim/Co-Pilot.txt<CR>

" Switch to Normal-Mode
inoremap jj <Esc>

" ── Abbreviations ────────────────────────────────────────────────────
" Timestamp - e.g. Sat 13 Jun 09
iab  mdyl  <C-r>=strftime("%a %d %b %y")

iab sb <C-r>="#!/bin/bash"<CR>

iab tsu <C-v>u30c4

" ── Macros (reserved) ────────────────────────────────────────────────



" ── KITTY terminal capabilities ──────────────────────────────────────
" Mouse support
 set mouse=a
 set balloonevalterm
 " Styled and colored underline support
 let &t_AU = "\e[58:5:%dm"
 let &t_8u = "\e[58:2:%lu:%lu:%lum"
 let &t_Us = "\e[4:2m"
 let &t_Cs = "\e[4:3m"
 let &t_ds = "\e[4:4m"
 let &t_Ds = "\e[4:5m"
 let &t_Ce = "\e[4:0m"
 " Strikethrough
 let &t_Ts = "\e[9m"
 let &t_Te = "\e[29m"
 " Truecolor support
 let &t_8f = "\e[38:2:%lu:%lu:%lum"
 let &t_8b = "\e[48:2:%lu:%lu:%lum"
 let &t_RF = "\e]10;?\e\\"
 let &t_RB = "\e]11;?\e\\"
 " Bracketed paste
 let &t_BE = "\e[?2004h"
 let &t_BD = "\e[?2004l"
 let &t_PS = "\e[200~"
 let &t_PE = "\e[201~"
 " Cursor control
 let &t_RC = "\e[?12$p"
 let &t_SH = "\e[%d q"
 let &t_RS = "\eP$q q\e\\"
 let &t_SI = "\e[5 q"
 let &t_SR = "\e[3 q"
 let &t_EI = "\e[1 q"
 let &t_VS = "\e[?12l"
 " Focus tracking
 let &t_fe = "\e[?1004h"
 let &t_fd = "\e[?1004l"
 execute "set <FocusGained>=\<Esc>[I"
 execute "set <FocusLost>=\<Esc>[O"
 " Window title
 let &t_ST = "\e[22;2t"
 let &t_RT = "\e[23;2t"

 " vim hardcodes background color erase even if the terminfo file does
 " not contain bce. This causes incorrect background rendering when
 " using a color theme with a background color in terminals such as
 " kitty that do not support background color erase.
 let &t_ut=''
" ── Folding ──────────────────────────────────────────────────────────
hi Folded guifg=#F4A460 guibg=NONE " Sand-brown

set foldmethod=marker
set foldtext=MyFoldText()
set fillchars=fold:\ 

  " return '⮀ ' . l:text
  " return '⮁ ' . l:text
  " return '⮕ ' . l:text
  " return '⮞ ' . l:text
  " return '🠊 ' . l:text
  " return '🡲  ' . l:text

function! MyFoldText()
  let l:text = getline(v:foldstart)

  " Explicitly remove only the '{{' marker and everything after it
  let l:text = substitute(l:text, '{{{.*$', '', '')

  " Remove comment markers, whether at the start or after code
  let l:text = substitute(l:text, '\v^\s*(["#;/]{1,2}|//|--)\s*', '', '')
  let l:text = substitute(l:text, '\v\s*(["#;/]{1,2}|//|--)\s*$', '', '')

  return 'ᐅ ' . l:text
  " return '⮀ ' . l:text
endfunction

" nocompatibel ist meist Standard
" set nocompatible " Disable compatibility with vi which can cause unexpected issues.

" Sicherheit bei modelines
set modelines=1
set modeline
set secure              " Sichere externe Befehle in modelines

" Zusätzliche Performance-Verbesserungen
set timeoutlen=500          " Schnellere Tastenkombinationen
set ttimeoutlen=10          " Sehr schnelle Escape-Sequenzen
set regexpengine=1          " Alte regex-Engine (oft schneller)
set complete-=i             " Keine includes beim Autocomplete

" Lazy Loading für bessere Startzeit
set lazyredraw         " Redraw nur wenn nötig
set ttyfast            " Schnellere Terminal-Verbindung annehmen
set synmaxcol=200      " Syntax highlighting nur bis Spalte 200

" Backup-Konfiguration{{{

if !isdirectory(expand('~/.vim/backup'))
  call mkdir(expand('~/.vim/backup'), 'p')
endif

set backup                    " Backups einschalten
set writebackup               " Vor dem Überschreiben sichern
set backupcopy=yes            " Direktes Kopieren
set backupext=.bak            " .bak am Ende
set backupdir=~/.vim/backup " Doppelslash -> KEINE %home%-Kodierung

"}}}

set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

" set textwidth=80
" set colorcolumn=+1

" Filetype{{{

filetype on " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on " Enable plugins and load plugin for the detected file type.
filetype indent on " Load an indent file for the detected file type.
filetype plugin indent on
"}}}

syntax on

" FZF
let $FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500"'

" NERDTree {{{

" let g:NERDTreeWinSize = 40 " Fensterbreite

" NERDTree mit aktuellem Arbeitsverzeichnis synchronisieren
" let g:NERDTreeChDirMode = 2
" let g:NERDTreeRespectWildIgnore = 1

" autocmd FileType nerdtree setlocal relativenumber " Zeilennummern (relativ) in NERDTree anzeigen
" autocmd FileType nerdtree setlocal norelativenumber relativenumber

" let g:NERDTreeHighlightCursorline = 1 " Hebt die aktuelle Cursorzeile im Baum hervor. 

" Ersetzt das Standardverhalten von netrw beim Öffnen von Verzeichnissen durch NERDTree.
" let g:NERDTreeHijackNetrw = 1

" nnoremap <C-n><C-n> :NERDTreeToggle<CR> " NERDTree ein- oder ausblenden

" NERDTree beim Start Öffnen, wenn ein Verzeichnis übergeben wird.
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | exe 'NERDTree' argv()[0] | wincmd p | endif

" NERDTree Git-Plugin{{{
" let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0dd
" let g:NERDTreeGitStatusUseNerdFonts = 1 
" let g:NERDTreeGitStatusShowClean = 1 " default: 0
"}}}

let g:webdevicons_enable = 1 " loading the plugin
let g:devicons_enable = 1 " loading the plugin
let g:webdevicons_enable_ctrlp = 0 " ctrlp glyphs
let g:webdevicons_enable_startify = 1 " adding to vim-startify screen
let g:devicons_enable_startify = 1 " adding to vim-startify screen
let g:devicons_enable_flagship_statusline = 1 " adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1 " adding to flagship's statusline

"}}}

" Disable beeping {{{

set noerrorbells 
set visualbell
let &t_vb = ""

"}}}

" Plugin 'Startify' {{{

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

"}}}

set termguicolors

" Cursor automatisch zur letzten Änderungsposition
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

autocmd BufNewFile,BufRead *.jsonc set filetype=jsonc
autocmd FileType jsonc set syntax=json

" Plugin »Yggdroot/indentline« {{{

let g:indentLine_char = '┊'
let g:indentLine_color_gui = '#626262'
let g:indentLine_color_term = 240
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 0

" Sicherstellen, dass keine Dateitypen ausgeschlossen sind
let g:indentLine_fileTypeExclude = []
let g:indentLine_bufTypeExclude = []

"}}}

" Cursorformen setzen{{{
let &t_SI = "\e[6 q"   " Insert = Beam
let &t_SR = "\e[4 q"   " Replace = Unterstrich
let &t_EI = "\e[2 q"   " Normal = Block

" Beim Start Cursor auf Block setzen (Normal Mode)
silent! !printf "\033[2 q"
autocmd VimLeave * silent! !printf "\033[ q"
"}}}

" Plugin NERDCommenter {{{
" [count]<leader>cc = Comment
" [count]<leader>cs = Comment sexy
" [count]<leader>c<space> = Comment toggle
" [count]<leader>cu = Uncomment
let mapleader = ","
inoremap ,c :call NERDComment(0,"toggle")<CR>
let NERDSpaceDelims = 1

"}}}

set tags=./tags;,tags

" Sessions {{{

" Session speichern -> :mksession ~/.vim/session.vim
" Session laden -> :source ~/.vim/session.vim
set sessionoptions=blank,buffers,curdir,folds,globals,help,tabpages,winsize,terminal

"}}}

set number
" map <C-N><C-N> :set inrelativenumber<CR> " Tollge relative line number
nnoremap <silent> <C-n> :set relativenumber!<CR>

" Steuert die Anzahl von Zeichen, die Vim zum Darstellen der Zeilennummern nutzt
set numberwidth=4

" set spell spelllang=de,en
" autocmd FileType markdown,text,gitcommit setlocal spell spelllang=de

autocmd BufNewFile,BufRead *.conkyrc,conky.conf set filetype=lua

" Disable Copilot for all filetypes except ...{{{
let g:copilot_filetypes = {
    \'*': v:false,
    \'php': v:true,
    \'javascript': v:true,
    \'html': v:true,
    \'css': v:true,
\}
"}}}

set display+=lastline "Pettier display of ling lines of text

set nowrap " Dont wrap lines

set showmatch " Show matching bracket (briefly jump)
set matchtime=2

set path+=** " Dateien mit 'find' auch in Unterverzeichnissen suchen

" Completion with menu
set wildmenu
set wildmode=list:longest,full

set laststatus=2

" Inserting blank lines without going into insert mode
" Shift+Enter
nnoremap <S-CR> O<Esc>S<Esc>j
" Strg+Enter
nnoremap <C-CR> o<Esc>S<Esc>k

" Disable automatically insert the current comment leader after hitting
" 'o' or " 'O' in Normal mode. Or after hitting <Enter> in Insert mode.
autocmd FileType * setlocal formatoptions-=ro

" Manage plugins with vim-plug {{{
" --------------------------------
" PlugInstall  | Install the plugins 
" PlugUpdate   | Install or update the plugins
" PlugDiff     | Review the changes from the last update
" PlugClean    | Remove plugins no longer in the list
" PlugStatus   |
" PlugUpgrade  | Update vim-plug
" , {'on':[]} | Disable Plugin without uninstall

call plug#begin()
    Plug 'itspriddle/vim-shellcheck'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go Entwicklung
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'             
    Plug 'easymotion/vim-easymotion' " Better move commands (,,w oder ,,b)
    Plug 'github/copilot.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-plug' " To show help vim-plug
    Plug 'kshenoy/vim-signature' " Show marks
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox' " Colorscheme
    Plug 'pangloss/vim-javascript' " Pretty colours
    Plug 'rstacruz/vim-closer'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdcommenter' " Easy commenting
    Plug 'SirVer/ultisnips' " Snippets
    Plug 'tpope/vim-fugitive', { 'on': 'Git' }
    Plug 'vifm/vifm.vim' " Provides integration with Vifm
    Plug 'vim-scripts/vimwiki'
    Plug 'yggdroot/indentline' " Show Indentlines
call plug#end()

"}}}

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Einstellungen für Go {{{

" ── Go / vim-go ─────────────────────────────────────────────
" go_fmt_command='gopls' ist kein gültiger Formatter für vim-go.
" Nimm goimports (oder gofumpt) und lass gopls nur für LSP:
let g:go_fmt_command = 'goimports'
let g:go_gopls_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
nnoremap <leader>r :GoRun<CR>

au BufRead,BufNewFile *.go set filetype=go

"}}}

" Google Calendar{{{

" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" let g:calendar_diary = '~/.vim/calendar'

" source ~/.cache/calendar.vim/credentials.vim

"}}}

" Statusline Plugin 'lightline'{{{

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

"}}}

" Aktiviert UltiSnips{{{
let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<c-b>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
" Vorwärts springen (next placeholder)

"}}}

" Split navigations{{{

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"}}}

" Sinnvoll?
set showtabline=2

" Kein blinkender Cursor
set gcr=a:blinkon0 

set shellslash

" Colorschemes
silent! colorscheme gruvbox 
set background=dark

" Schließende Klammer
highlight MatchParen cterm=bold ctermfg=0 ctermbg=208 gui=bold guifg=black guibg=white

set tabstop=4 " The number of space characters that will be inserted when the tab key is pressed

set shiftwidth=4 " Einrücktiefe

set expandtab " To insert space characters whenever the tab key is pressed.

" Für Shell-Skripte (sh, bash, zsh ...) Tabstop und Einrückung auf 2 setzen
augroup sh_indent
  autocmd!
  autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

set backspace=2 " Normales Verhalten der Backspace-Taste

" Show fileencoding and bomb in the status line
if has("statusline")
" set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Encoding{{{

set encoding=utf-8 " Vim intern arbeitet mit UTF-8
set fileencoding=utf-8 " Neue Dateien werden in UTF-8 gespeichert
" Reihenfolge beim Erkennen beim Öffnen von Dateien
set fileencodings=utf-8,latin1 " Falls z.B. eine Datei fälschlich als latin1 gespeichert wurde, erkennt Vim das besser

"}}}

set noshowmode " Lightline zeigt den aktuellen Modus an

set ruler " Zeigt die aktuelle Cursorposition

set nojoinspaces " Ein Leerzeichen nach .,?,! beim Zusammenfügen von zwei Zeilen

set pastetoggle=<F8> " Treppeneffekt beim Copy & Paste verhindern

set hlsearch " Suchtreffer farblich hervorheben 
" Suche-Hervorhebung mit Ctrl+L ausschalten
nnoremap <C-l> :nohlsearch<CR><C-l>

set incsearch " Während der Eingabe zum entsprechenden Text springen

set ignorecase " Größe und Kleinschreibung bei der Suche ignorieren 

set smartcase " ignorecase abschalten, wenn Muster Großbuchstaben enthält

set showcmd " show typed command in status bar 

set title " Name der aktuellen Datei in Fenster-Titel-Leiste

" ── Nützliches UI-Feintuning ────────────────────────────────
" set signcolumn=yes           " Verhindert Layout-Jumping bei Lint/VC-Signs
set signcolumn=auto
set scrolloff=3             
set sidescrolloff=0
set splitright | set splitbelow
set updatetime=300           " Schnellere CursorHold-Events (z.B. LSP/Lightline)
set confirm                  " :q bei unsaved → Confirm statt Fehlermeldung

set equalalways
autocmd VimResized * wincmd =
" optional, falls es mal „klebt“:
" autocmd VimResized * redraw!

" Funktion 'VisualCopyToClipboard' {{{
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


" Visual-Mode Mapping
vnoremap <Leader>y :<C-u>call VisualCopyToClipboard()<CR>

"}}}

" Funktion 'PasteFromClipboard' {{{

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

" Ihre Funktionen sind gut, aber moderner wäre:
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif
"}}}

" Bugfix: Vim+Kitty+Italic{{{

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
"}}}

" Mappings{{{

" Highlight cursorline ein- ausschalten mit F3
" Defekt
" map <F3> :set cursorline!<CR><Bar>:echo 'Highlight active cursor line: ' . strpart('OffOn', 3 * &cursorline, 3)<CR>

" Normales Enter bleibt wie gewohnt
" inoremap <CR> <CR>

" Shift+Enter entfernt Kommentarzeichen am Zeilenanfang
" inoremap <S-CR> <C-o>:set formatoptions-=r<CR><CR><C-o>:set formatoptions+=r<CR>

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

noremap <F4> <Esc>:w<CR>:!clear;python3 %<CR>

" sudo write
cnoremap w!! %!sudo tee > /dev/null %

" vimrc neu laden
cnoremap s$ w \| source $MYVIMRC<CR>

" Vim-Plug{{{

" Install the plugins 
cmap PI <bar> PlugInstall<CR>

" Install or update the plugins
cmap PU <bar> PlugUpdate  <CR>

" Review the changes from the last update
cmap PD <bar> PlugDiff<CR>

" Remove plugins no longer in the list
cmap PC <bar> PlugClean<CR>

cmap PS <bar> PlugStatus<CR>

" Update vim-plug
cmap PUg <bar>PlugUpgrade<CR>

"}}}

cnoremap cop <bar> :Copilot panel<CR>

cnoremap  cpp <bar>:vsplit ~/.vim/Co-Pilot.txt<CR>

inoremap fj <Esc>

"}}}

" Abkürzungen{{{

" Zeitstempel - Sa 13 Jun 09
iab  mdyl  <C-r>=strftime("%a %d %b %y")

iab dzo <C-r>="darkstar.zapto.org"<CR>

iab sb <C-r>="#!/bin/bash"<CR>

iab tsu <C-v>u30c4

"}}}

" Makros{{{



"}}}

" KITTY {{{

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
 "}}}

" Folding{{{

hi Folded guifg=#F4A460 guibg=NONE " Sandbraun

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

  " explizit nur den Marker '{{' und alles danach entfernen
  let l:text = substitute(l:text, '{{{.*$', '', '')

  " Kommentarzeichen entfernen, egal ob am Anfang oder nach Code
  let l:text = substitute(l:text, '\v^\s*(["#;/]{1,2}|//|--)\s*', '', '')
  let l:text = substitute(l:text, '\v\s*(["#;/]{1,2}|//|--)\s*$', '', '')

  return 'ᐅ ' . l:text
  " return '⮀ ' . l:text
endfunction

"}}}


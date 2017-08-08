"---------
" Vundle
"---------
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Bundle 'Vundle.vim'
Bundle 'troydm/easytree.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'jiangmiao/auto-pairs'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rhysd/vim-clang-format'
Bundle 'SirVer/ultisnips'
Bundle 'morhetz/gruvbox'
Bundle 'maxbrunsfeld/vim-emacs-bindings'
call vundle#end()

imap <C-n> <Down>
imap <C-p> <Up>

"---------
" General
"---------
" hightlight current line/column
"set cursorline
"set cursorcolumn
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn

" mouse operation avalible
set mouse=a
" Sets how many lines of history VIM has to remember
set history=500

" set folding
set nofoldenable
set fdm=indent

" Enable filetype plugins
filetype plugin on
filetype indent on

set autoread

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"----
" UI
"----
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1

"------------------
" Colors and Fonts
"------------------
" Enable syntax highlighting
syntax enable

colorscheme gruvbox

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"-------------------------
" Files, backups and undo
"-------------------------
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"------------------------------
" Text, tab and indent related
"------------------------------
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"------------------------------------------
" Moving around, windows and buffers
"------------------------------------------
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap H gT
nnoremap L gt

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"-------------
" Status line
"-------------
" Always show the status line
set laststatus=2

set statusline=%<%1*\ [%n]\ \%*
set statusline+=%2*\ %F
set statusline+=%=%3*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-8.(%l:%c%V%)%*
set statusline+=%4*\ %P\ %*
"default bg for statusline is 236 in space-vim-dark
hi User1 cterm=None ctermfg=214 ctermbg=242
"hi User2 cterm=None ctermfg=251 ctermbg=240
hi User3 cterm=bold ctermfg=100 ctermbg=236
hi User4 cterm=None ctermfg=250 ctermbg=238
"hi User5 cterm=None ctermfg=249 ctermbg=240

"------------------
" Editing mappings
"------------------
" paste
map <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
map <leader>y :w !pbcopy<CR><CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" fast leader
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" fast comment
nmap <C-\> <leader>ci
vmap <C-\> <leader>ci
imap <C-\> <ESC><leader>ci

"format the code
map <C-x>l <ESC>:ClangFormat<CR>
imap <C-x>l <ESC>:ClangFormat<CR>

nnoremap <space> za

"-----
" Misc
"------
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" strip all trailing whitespace in the current file
autocmd BufWritePre <buffer> :%s/\s\+$//e

"---------------------
" Compile, Run, Debug
"---------------------
nmap <F7> :call DoOneFileMake()<CR>
nmap <F8> :call RunFile()<CR>
nmap <F9> :call DebugFile()<CR>
function DebugFile()
    call DoOneFileMake()
    if len(getqflist()) == 0
        if &filetype=='c' || &filetype=='cpp'
            exec "!lldb ./%.o"
        endif
    endif
endfunction

function RunFile()
    call DoOneFileMake()
    if len(getqflist()) == 0
        exec "!./%.o"
    endif
endfunction

function DoOneFileMake()
    " if(expand("%:p:h")!=getcwd())
    " echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
    " endif
    exec "w"
    "call SetCompilation()

    if &filetype=='c'
        set makeprg=gcc\ %\ -o\ %.o\ -g\ -lstdc++\ -Wall
    elseif &filetype=='cpp'
        set makeprg=g++\ %\ -o\ %.o\ -g\ -lstdc++\ -Wall
    endif

    exec "silent make\|redraw!"
    if len(getqflist()) == 0
        exec "cclose"
    else
        exec "copen"
    endif
endfunction

"------------------
" Plugin Settings
"------------------
map <F1> :EasyTreeToggle<cr>
imap <F1> <C-o>:EasyTreeToggle<cr>

" Undotree
map <F2> :UndotreeToggle<cr>
imap <F2> <C-o>:UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile

" rainbow_parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Easy Motion
map \ <Plug>(easymotion-s)

"---------
" Tabline
"---------
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
    let s = '' " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        " set page number string
        let s .= t + 1 . ' '
        " get buffer names and statuses
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '[' . m . '+]'
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#%999Xclose'
    endif
    return s
endfunction

:hi TabLineSel ctermfg=white

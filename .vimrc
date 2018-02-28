"---------
" Vundle
"---------
set nocompatible
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'

    Plug 'troydm/easytree.vim', {'on': 'EasyTreeToggle'}
    Plug 'scrooloose/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kana/vim-textobj-user'
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    Plug 'tpope/vim-surround'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'maxbrunsfeld/vim-emacs-bindings'
    Plug 'kien/ctrlp.vim', {'on': 'CtrlP'}
    Plug 'terryma/vim-expand-region'
    Plug 'w0rp/ale'
    Plug 'ap/vim-buftabline'

    Plug 'glts/vim-textobj-comment'
    Plug 'jceb/vim-textobj-uri'

call plug#end()

"---------
" General
"---------
" hightlight current line/column
set cursorline
au WinLeave * set nocursorline
au WinEnter * set cursorline

" mouse operation avalible
set mouse=a
" Sets how many lines of history VIM has to remember
set history=500

set nu

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
set so=6

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
set hlsearch
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic
set showmatch
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
" Be smart when using tabs
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
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-h> <C-W>h
map <c-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

au BufNewFile *.cpp 0r ~/.vim/template/cpp-oi.cpp

"-------------
" Status line
"-------------
" Always show the status line
set laststatus=2

set statusline=%<%1*[%n]\%*
set statusline+=%2*\ %F
set statusline+=%=%3*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-8.(%l:%c%V%)%*
set statusline+=%4*\ %P\ %*
hi User1 cterm=None ctermfg=214 ctermbg=242
"hi User2 cterm=None ctermfg=251 ctermbg=240
hi User3 cterm=bold ctermfg=100 ctermbg=236
hi User4 cterm=None ctermfg=250 ctermbg=238
"hi User5 cterm=None ctermfg=249 ctermbg=240

"------------------
" Editing mappings
"------------------
"Emacs +
imap <C-n> <Down>
imap <C-p> <Up>

" paste
map <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
map <leader>y :w !pbcopy<CR><CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" fast comment
nmap <C-\> <leader>ci
vmap <C-\> <leader>ci
imap <C-\> <ESC><leader>ci

nmap <leader>, :ls

"format the code
"map <C-x>l <ESC>:ClangFormat<CR>
"imap <C-x>l <ESC>:ClangFormat<CR>

imap <C-i> <ESC>:bn<CR>i
nmap <C-i> :bn<CR>

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
" errors
nmap ] <ESC>:cn<CR>
nmap [ <ESC>:cp<CR>

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
set undodir=~/.vim/undodir/
set undofile

" rainbow_parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Easy Motion
map , <Plug>(easymotion-s)

"ctrlp
map <F3> :CtrlP<cr>
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>

" expand
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✹'
let g:ale_sign_warning = '✹'
let g:ale_lint_on_enter = 0


" Text objects
" line
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction


call textobj#user#plugin('entire', {
\      '-': {
\        'select-a': 'ae',  'select-a-function': 'EntireI',
\        'select-i': 'ie',  'select-i-function': 'EntireA'
\      },
\    })

function! EntireA()
  normal! m'
  keepjumps normal! gg0
  let start_pos = getpos('.')
  keepjumps normal! G$
  let end_pos = getpos('.')
  return ['V', start_pos, end_pos]
endfunction


function! EntireI()  "{{{2
  normal! m'
  keepjumps normal! gg0
  call search('^.', 'cW')
  let start_pos = getpos('.')
  keepjumps normal! G$
  call search('^.', 'bcW')
  normal! $
  let end_pos = getpos('.')
  return ['V', start_pos, end_pos]
endfunction


call textobj#user#plugin('latex', {
\   'environment': {
\     '*pattern*': ['\\begin{[^}]\+}.*\n\s*', '\n^\s*\\end{[^}]\+}.*$'],
\     'select-a': 'ae',
\     'select-i': 'ie',
\   },
\  'bracket-math': {
\     '*pattern*': ['\\\[', '\\\]'],
\     'select-a': 'ab',
\     'select-i': 'ib',
\   },
\  'paren-math': {
\     '*pattern*': ['\\(', '\\)'],
\     'select-a': 'a\',
\     'select-i': 'i\',
\   },
\  'dollar-math-a': {
\     '*pattern*': '[$][^$]*[$]',
\     'select': 'a$',
\   },
\  'dollar-math-i': {
\     '*pattern*': '[$]\zs[^$]*\ze[$]',
\     'select': 'i$',
\   },
\  'quote': {
\     '*pattern*': ['`', "'"],
\     'select-a': 'aq',
\     'select-i': 'iq',
\   },
\  'double-quote': {
\     '*pattern*': ['``', "''"],
\     'select-a': 'aQ',
\     'select-i': 'iQ',
\   },
\ })


" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ 'iu'  :0,
      \ 'ic'  :0,
      \ }

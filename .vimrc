
set langmenu=en_US.utf8

map <C-l> :call SwitchLineBreakingMode()<CR>
map! <C-l> <Esc>:call SwitchLineBreakingMode()<CR>
function SwitchLineBreakingMode()
    if (&wrap == 0)
        set wrap
        echo "Wrap"
    else
        set nowrap
        echo "No wrap"
    endif
endfunction


let g:rainbow_active = 1

"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  ('.l:branchname.') ':''
"endfunction


set statusline=
set statusline+=%#statuslinemodehilight#
set statusline+=%{StatuslineMode()}
set statusline+=\ %n\ 
set statusline+=%#statuslinemodehilight2#
set statusline+=\ %3p%%\ ┊
set statusline+=\%4l:%3c\ ┊
set statusline+=\ %{&modified?'⬢':&readonly&&&modifiable?'⬡':&modifiable?'\ ':&readonly?'⨯':'!'}
set statusline+=\ %f
"set statusline+=%{StatuslineGit()}
set statusline+=%=
set statusline+=\ %Y
if(has('nvim'))
    set statusline+=\ ┊\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\ ┊\ %{&fileformat}
endif
set statusline+=\ \ \ \ \ 

function! StatuslineMode()
    let l:mode=mode()
    if l:mode=="n"
        hi statuslinemodehilight cterm=NONE ctermfg=255 ctermbg=106
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156
        "return "NORMAL   "
        "return "n"
    elseif l:mode=="v"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238
        "return "VISUAL   "
        "return "v"
    elseif l:mode=="i"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159
        "return "INSERT   "
        "return "i"
    elseif l:mode=="R"
        hi statuslinemodehilight cterm=NONE ctermfg=225 ctermbg=196
        hi statuslinemodehilight2 cterm=NONE ctermfg=255 ctermbg=238
        "return "REPLACE  "
        "return "R"
    elseif l:mode=="c"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=106
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156
        "return "COMMAND  "
        "return "c"
    elseif l:mode==""
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238
        "return "V-BLOCK  "
        "return "^"
    elseif l:mode=="V"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238
        "return "V-LINE   "
        "return "V"
    elseif l:mode=="t"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159
        "return "terminal "
        "return "t"
    else
    endif
    "return bufnr('%')
    return ""
endfunction


set showtabline=1  " 1 to show tabline only when more than one tab is present

set laststatus=2
let lc1='tab:\|\ ,trail:×,nbsp:×,eol:↵,space:·'
let lc2='tab:→,trail:X,nbsp:_,eol:/'
let &listchars = g:lc1
set list

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

nmap <F2> :CocCommand explorer<CR>

nmap <F8> :TagbarToggle<CR>

let g:mouseMode=0
set mouse=
function MouseMode()
    if (g:mouseMode==1)
        set mouse=
        let g:mouseMode=0
        echo "mouse mode disabled"
    else
        set mouse=a
        let g:mouseMode=1
        echo "mouse mode enabled"
    endif
endfunction
nmap <F3> :call MouseMode() <CR>
imap <F3> :call MouseMode()a



let mapleader = ","
map <leader>s <esc>:w<CR>
map <leader>l l
map <leader>k k
map <leader>j j
map <leader>h h
imap <M-u> 
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-h> <Left>
imap <M-l> <Right>
imap <M-i> 
imap <M-d> <Del>




call plug#begin('~/vimfiles/plugged')
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'justincampbell/vim-eighties'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
call plug#end()

" Plugins setting

" yggdroot/indentline{
let g:indentLine_char = '┊'
"}

let g:coc_global_extensions = ['coc-python','coc-css', 'coc-html', 'coc-pairs', 'coc-yank']
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set colorcolumn=80
set nu
set ruler
syntax enable
set nocompatible
set cursorline
set cursorcolumn
set smartcase
set hlsearch
set incsearch
set cindent
set expandtab
set tabstop=4
set nu rnu
set softtabstop=4
set shiftwidth=4
set smarttab
set confirm
set backspace=indent,eol,start
set history=200
set showcmd
set noshowmode
set nowrap
set noautowrite
"set t_co=256
set encoding=utf8
colo seoul256
colo onedark
set background=dark
set undofile


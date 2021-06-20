" My config for neovim/vim
" by yic95


"set language
set langmenu=en_US.utf8

"custom status line {
"   setup status line{
set statusline=
set statusline+=%#statuslinemodehilight#
set statusline+=%{StatuslineMode()}
set statusline+=\ %n
set statusline+=\ %#statuslinemodehilight2#
set statusline+=\ %{&modified?'⬢':&readonly&&&modifiable?'⬡':&modifiable?'\ ':&readonly?'⨯':'!'}
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %Y
if(has('nvim'))
    set statusline+=\ /\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\ /\ %{&fileformat}
endif
if has('gui_running')
    set statusline+=%#statuslinemodehilight3#
    set statusline+=\ 
else
    set statusline+=\ /
endif
set statusline+=\ %3p%%\ /
set statusline+=\ %l:%2c\ 
"   }
"   statusline require function {
function! StatuslineMode()
    let l:mode=mode()
    " normal
    if l:mode=="n"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#87af00
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156 guifg=#000000 guibg=#afff87
        hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#82ff43
    " visual
    elseif l:mode=="v"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " insert
    elseif l:mode=="i"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69 guifg=#000000 guibg=#5f87ff
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#afffff
        hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#74f3f3
    " replace
    elseif l:mode=="R"
        hi statuslinemodehilight cterm=NONE ctermfg=225 ctermbg=196 guifg=#ffffff guibg=#ff0000
        hi statuslinemodehilight2 cterm=NONE ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#000000
        hi statuslinemodehilight3 cterm=NONE ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#000000
    " command-line
    elseif l:mode=="c"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#87af00
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156 guifg=#000000 guibg=#afff87
        hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#82ff43
    " visual blobk
    elseif l:mode==""
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " visual line
    elseif l:mode=="V"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " terminal
    elseif l:mode=="t"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69 guifg=#000000 guibg=#5f87ff
        hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#afffff
        hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#74f3f3
    endif
    return ""
endfunction
"   }
"}


"maps {
"   toggle mouse mode {
let g:mouseMode=1
set mouse=a
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
nmap <F2> :call MouseMode() <CR>
imap <F2> :call MouseMode()a
"   }
"   open nerd tree {
nmap <F3> :NERDTree <CR>
imap <F3> :NERDTree <CR>
"   }

"   toggle Tagbar{
nmap <F4> :TagbarToggle<CR>
imap <F4> :TagbarToggle<CR>
"   }
"   toggle wrap{
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
"   }

let mapleader = ","
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-h> <Left>
imap <M-l> <Right>
imap <M-d> <Del>
"}



call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'justincampbell/vim-eighties'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'luochen1990/rainbow'
Plug 'yggdroot/indentline'
Plug 'neomake/neomake'
if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
endif
"Plug 'lucasprag/simpleblack'
"Plug 'sickill/vim-monokai'
"Plug 'itchyny/vim-cursorword'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf'
Plug 'sainnhe/gruvbox-material'
Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'rust-lang/rust.vim'
call plug#end()

"Plugins setting{
"   yggdroot/indentline{
let g:indentLine_char = '|'
"   }

"   neomake/neomake{
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('inrw', 50)
"   }

"   luochen1990/rainbow {
let g:rainbow_active = 1
"   }

"   neoclide/coc.nvim{
let g:coc_global_extensions = ['coc-python','coc-css', 'coc-pairs', 'coc-yank']
"   }
"}

"other settings

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set termguicolors
set colorcolumn=80
set ruler
syntax enable
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
colo gruvbox-material
set background=dark
set undofile
set showtabline=1  " 1 to show tabline only when more than one tab is present
set laststatus=2 " alwayse show statusline

"custom list char{
let g:lc1='tab:\|\ ,trail:×,nbsp:×,eol:↵,space:·'
let &listchars = g:lc1
set list
"}

" netrw settind{
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_menu = 0
"}

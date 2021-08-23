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
"set statusline+=\ %#statuslinemodehilight2#
set statusline+=\ %#CrusorLine#
set statusline+=\ %{&modified?'⬢':&readonly&&&modifiable?'⬡':&modifiable?'\ ':&readonly?'⨯':'!'}
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %Y
if(has('nvim'))
    set statusline+=\ /\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\ /\ %{&fileformat}
endif
"if has('gui_running')
    "set statusline+=%#statuslinemodehilight3#
    "set statusline+=\
"else
    "set statusline+=\ /
"endif
set statusline+=\ /
set statusline+=\ %3p%%\ /
set statusline+=\ %l:%2c\
"   }
"   statusline require function {
function! StatuslineMode()
    let l:mode=mode()
    " normal
    if l:mode=="n"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#87af00
        "hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156 guifg=#000000 guibg=#afff87
        "hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#82ff43
    " visual
    elseif l:mode=="v"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        "hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        "hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " insert
    elseif l:mode=="i"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69 guifg=#000000 guibg=#5f87ff
        "hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#afffff
        "hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#74f3f3
    " replace
    elseif l:mode=="R"
        hi statuslinemodehilight cterm=NONE ctermfg=225 ctermbg=196 guifg=#ffffff guibg=#ff0000
        "hi statuslinemodehilight2 cterm=NONE ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#000000
        "hi statuslinemodehilight3 cterm=NONE ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#000000
    " command-line
    elseif l:mode=="c"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#87af00
        "hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=156 guifg=#000000 guibg=#afff87
        "hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=106 guifg=#000000 guibg=#82ff43
    " visual blobk
    elseif l:mode==""
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        "hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        "hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " visual line
    elseif l:mode=="V"
        hi statuslinemodehilight cterm=NONE ctermfg=237 ctermbg=226 guifg=#000000 guibg=#ffd700
        "hi statuslinemodehilight2 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffff87
        "hi statuslinemodehilight3 cterm=NONE ctermbg=228 ctermfg=238 guifg=#000000 guibg=#ffed55
    " terminal
    elseif l:mode=="t"
        hi statuslinemodehilight cterm=NONE ctermfg=0 ctermbg=69 guifg=#000000 guibg=#5f87ff
        "hi statuslinemodehilight2 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#afffff
        "hi statuslinemodehilight3 cterm=NONE ctermfg=0 ctermbg=159 guifg=#000000 guibg=#74f3f3
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
nmap <F3> :Vex <CR>
imap <F3> :Vex <CR>
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
" editing
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'

" language
Plug 'rust-lang/rust.vim'
"Plug 'neomake/neomake'

" etc
Plug 'majutsushi/tagbar'
Plug 'justincampbell/vim-eighties'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'luochen1990/rainbow'
Plug 'yggdroot/indentline'
Plug 'jceb/vim-orgmode'
"Plug 'lucasprag/simpleblack'
"Plug 'sickill/vim-monokai'
"Plug 'itchyny/vim-cursorword'

" color
Plug 'lifepillar/vim-gruvbox8'
Plug 'ayu-theme/ayu-vim'
Plug 'andreasvc/vim-256noir'
"Plug 'morhetz/gruvbox'
"Plug 'sonph/onehalf'
"Plug 'sainnhe/gruvbox-material'
"Plug 'jacoborus/tender.vim'
call plug#end()

"Plugins setting{
"   yggdroot/indentline{
let g:indentLine_char = '|'
"   }


"   luochen1990/rainbow {
let g:rainbow_active = 1
"   }

"   neoclide/coc.nvim{
let g:coc_global_extensions = ['coc-python','coc-css', 'coc-pairs', 'coc-yank']
"   }
"}

"   ayu{
let ayucolor="dark"
"   }

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
set nu rnu
set softtabstop=4
set shiftwidth=4
set smarttab
set confirm
set backspace=indent,eol,start
set history=200
set showcmd
set showmode
set nowrap
set noautowrite
"set t_co=256
colo ayu
set background=dark
set undofile
set showtabline=1  " 1 to show tabline only when more than one tab is present
set laststatus=1 " always show statusline(2)
let g:markdown_fenced_languages = ['python'] " language to highlight in markdown

"custom list char{
let g:lc1='tab:\|\ ,trail:×,nbsp:×,eol:↵,space:·'
let &listchars = g:lc1
set list
"}

" netrw setting{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
"augroup ProjectDrawer
    "autocmd!
    "autocmd VimEnter * :Vexplore
"augroup END
"}

autocmd BufNewFile, BufRead *.py,*.rs
    \ colorscheme ayu |
    \ set colorcolumn=80 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set cursorcolumn

autocmd BufNewFile, BufRead *.js,*.html,*.css
    \ colorscheme ayu |
    \ set expandtab |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

autocmd BufNewFile, BufRead *.md,*.ly,*.txt
    \ colorscheme 256_noir |
    \ set colorcolumn=0 |
    \ set nocursorcolumn

if executable("python3")
    autocmd BufRead,BufNewFile *.py noremap <F5> :w:!python3 %
else
    autocmd BufRead,BufNewFile *.py noremap <F5> :echo you need to install Ruby first!"
endif


" coc-nvim{

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}

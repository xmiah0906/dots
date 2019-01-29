mapclear
let &t_ZM = "\e[3m"

" vim-plugs {{{

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'nerdypepper/agila.vim'
Plug 'mhinz/vim-startify'
Plug 'davidhalter/jedi-vim', {'for': ['python']}

Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim', { 'for': ['*html', '*css', 'vue'] }
Plug 'andymass/vim-matchup'
Plug 'wellle/targets.vim'
Plug 'skywind3000/vim-keysound'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-syntax-extra'
Plug 'w0rp/ale'
Plug 'rstacruz/vim-closer'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-jedi', {'for': ['python']}
Plug 'nvie/vim-flake8'

Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-textobj-user'
Plug 'terryma/vim-expand-region'
Plug 'machakann/vim-highlightedyank'

Plug 'vim-python/python-syntax'
Plug 'mzlogin/vim-markdown-toc'
Plug 'wellle/tmux-complete.vim'
Plug 'tpope/vim-commentary'


call plug#end()

" }}}

" augroups {{{

augroup indents
	autocmd!
	autocmd FileType less,css,html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType text,markdown setlocal expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
augroup END

augroup General
    au!
    autocmd FileType markdown,text setlocal spell
    autocmd FileType * setlocal formatoptions-=cro
    autocmd BufWritePre [:;]* throw 'Forbidden file name: ' . expand('<afile>')
	autocmd BufWritePre * :%s/\s\+$//e
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType scss,css setlocal commentstring=/*%s*/ shiftwidth=2 softtabstop=2
augroup END

augroup highlight_follows_vim
	autocmd!
	autocmd FocusGained * set cursorline
	autocmd FocusLost * set nocursorline
augroup END

augroup mapppings
	autocmd!
	autocmd FileType less,css,html nnoremap <Leader>s viB:sort<cr>
augroup END

augroup restorecursor
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   execute "normal! g`\"" |
				\ endif
augroup END

augroup nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" }}}

" HTML, XML, Jinja
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

"" Coloring
set t_Co=256
syntax enable
colorscheme agila
autocmd BufEnter * :highlight Normal ctermbg=NONE ctermfg=NONE

" general settings
set nobackup
set nowritebackup
set noswapfile  " get rid of swapfiles everywhere
set lazyredraw
set hidden
set wildmenu
set complete=.,w,b,i,u,t,

set nocompatible
set listchars=tab:¦\ ,nbsp:␣,trail:∙,extends:>,precedes:<
set fillchars=vert:\│

set omnifunc=syntaxcomplete#Complete
set completefunc=LanguageClient#comple

filetype plugin indent on
set list
set laststatus=2
set noshowmode
set incsearch ignorecase smartcase hlsearch
set shortmess=atI
set cmdheight=1
set modeline

set notimeout
set nottimeout
set autochdir
set nostartofline

set undofile
set backupdir=~/.config/nvim/tmp/backups/
set undodir=~/.config/nvim/tmp/undo/
set path+=**
set inccommand=split
set backspace=indent,eol,start
set sidescroll=40
set foldmethod=manual

set mouse=a
set number
set relativenumber
set ruler
" highlight LineNr ctermfg=black

set splitbelow
set splitright

set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines
set breakindent
set encoding=utf-8
scriptencoding utf-8

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
nore XX "+x<CR>

" statusline
let g:currentmode={
			\ 'n'  : 'NORMAL ',
			\ 'no' : 'N·OPERATOR PENDING ',
			\ 'v'  : 'VISUAL ',
			\ 'V'  : 'V·LINE ',
			\ '' : 'V·BLOCK ',
			\ 's'  : 'SELECT ',
			\ 'S'  : 'S·LINE ',
			\ '' : 'S·BLOCK ',
			\ 'i'  : 'INSERT ',
			\ 'R'  : 'REPLACE ',
			\ 'Rv' : 'V·REPLACE ',
			\ 'c'  : 'COMMAND ',
			\ 'cv' : 'VIM EX ',
			\ 'ce' : 'EX ',
			\ 'r'  : 'PROMPT ',
			\ 'rm' : 'MORE ',
			\ 'r?' : 'CONFIRM ',
			\ '!'  : 'SHELL ',
			\ 't'  : 'TERMINAL '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
	let l:modecurrent = mode()
	" use get() -> fails safely, since ^V doesn't seem to register
	" 3rd arg is used when return of mode() == 0, which is case with ^V
	" thus, ^V fails -> returns 0 -> replaced with 'V Block'
	let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
	let l:current_status_mode = l:modelist
	return l:current_status_mode
endfunction

hi PrimaryBlock        ctermfg=06 ctermbg=00
hi SecondaryBlock      ctermfg=05 ctermbg=00
hi Blanks              ctermfg=08 ctermbg=00
highlight EndOfBuffer ctermfg=black ctermbg=black

set statusline=

set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#Blanks#
set statusline+=\ %t
set statusline+=%(%m%)
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ Ln
set statusline+=\ %l
set statusline+=,Col
set statusline+=\ %c
set statusline+=%#PrimaryBlock#
set statusline+=\ %Y

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


" Functions
function! GetTabber()  " a lil function that integrates well with Tabular.vim
	let c = nr2char(getchar())
	:execute 'Tabularize /' . c
endfunction

let g:help_in_tabs = 1

nmap <silent> H  :let g:help_in_tabs = !g:help_in_tabs<CR>

" Only apply to .txt files...
augroup HelpInTabs
	autocmd!
	autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

" Only apply to help files...
function! HelpInNewTab ()
	if &buftype == 'help' && g:help_in_tabs
		"Convert the help window to a tab...
		execute "normal \<C-W>T"
	endif
endfunction


" mappings
let mapleader=';'


" nnoremap
nnoremap <Leader>o : only<cr>
nnoremap <Leader>l : Lines<cr>
nnoremap <Leader>b : bnext<cr>
nnoremap <Leader>B : bprev<cr>
nnoremap <Leader>z : FZF<cr>
nnoremap <Leader>- : split<CR>
nnoremap <Leader>\ : vsplit<CR>
nnoremap <Leader>f : Startify<CR>
nnoremap <Leader>w : MtaJumpToOtherTag<cr>
nnoremap <Leader>ta : call GetTabber()<cr>
nnoremap <Leader>t <Esc>:terminal<CR>
inoremap <Leader>t <Esc>:terminal<CR>
nnoremap <Leader>g : Goyo<cr>
nnoremap <Leader><ESC> : nohlsearch<cr>
nnoremap <F2>      : NERDTreeToggle<cr>
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap H H:exec 'norm! '. &scrolloff . 'k'<cr>
nnoremap L L:exec 'norm! '. &scrolloff . 'j'<cr>
nnoremap  <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

cmap w!! %!sudo tee > /dev/null %

" vnoremap
vnoremap > >gv
vnoremap < <gv

" onoremap
onoremap ax a`
onoremap ix i`

" xnoremap
xnoremap + g<C-a>
xnoremap - g<C-x>

:command! WQ wq
:command! Wq wq
:command! Wqa wqa
:command! W w
:command! Q qa

" Always exit all files
cnoreabbrev q qa
cnoreabbrev x xa

" abbreviations
abclear
iab #i #include
iab #d #define
cab dst put =strftime('%d %a, %b %Y')<cr>
cab vg vimgrep

" Maps Tab to indent blocks of text in visual mode.
vmap <TAB> >gv
vmap <BS> <gv

" Buffers with <TAB>.
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" plugin settings

" emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-X>'

" nerdtree
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeWinPos              = 'left'
let g:NERDTreeWinSize             = 20
let g:NERDTreeStatusline          = "  "
let g:NERDTreeDirArrowExpandable  = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'

" ale
let g:ale_set_signs             = 1
let g:ale_use_deprecated_neovim = 1
let g:ale_sign_error            = '> '
let g:ale_sign_warning          = '! '
let g:ale_linters = {'python': ['pyls', 'flake8', 'pylint']}
nmap <silent> e <Plug>(ale_next_wrap)

hi ALEErrorSign ctermfg=01 ctermbg=00
hi ALEWarningSign ctermfg=06 ctermbg=00

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-tab> pumvisible() ? "\<c-p>" : "\<c-tab>"

" fzf colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" keysound
let g:keysound_enable = 1
let g:keysound_volume = 1000
let g:keysound_py_version = 3
let g:keysound_theme = 'typewriter'

" multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-s>'
let g:multi_cursor_quit_key='<Esc>'

" vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim surround
nmap ss ysiw
nmap sl yss
vmap s S

" hightlighttedyank
let g:hightlighttedyank_highlight_duration = 200

" Goyo
augroup Goyo
    autocmd!
    " Always enable Goyo.
    autocmd BufReadPost * Goyo 85x85%
    autocmd BufReadPost *.md Goyo 75x85%
    autocmd BufReadPost *.conf Goyo 100x85%

    " Equalize splits on resize
    autocmd VimResized * execute "normal \<c-W>="
augroup END


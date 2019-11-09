" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" # dein
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" $ mkdir -p ~/.cache/dein/repos/github.com/Shougo/dein.vim
" $ git clone https://github.com/Shougo/dein.vim/git \
"     ~/.cache/dein/repos/github.com/Shougo/dein.vim
if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')

	call dein#begin(expand('~/.cache/dein'))

  call dein#add('Shougo/dein.vim')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " GUI enhancements
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('itchyny/lightline.vim')

  " Colorschemes
  call dein#add('tomasr/molokai', {'merged': 0})
  call dein#add('yasukotelin/shirotelin', {'merged': 0})

  " Language supports
  call dein#add('kovisoft/slimv')

  call dein#end()
	call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
	call dein#install()
endif
"dein.delete
"call map(dein#check_clean(), "delete(v:val, 'rf')")

"vim-gitgutter
set updatetime=300

"lightline.vim
let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active' : { 'left' : [['mode', 'paste'],
      \                         ['readonly', 'filepath', 'modified']],
      \               'right': [['gitbranch', 'paste'],
      \                         ['fileformat', 'filetype']]},
      \  'component_function' :{ 'gitbranch' : 'fugitive#head',
      \                          'filepath'  : 'LightlineFilePath' },
      \  'separator':    {'left' : "", 'right': ""},
      \  'subseparator': {'left' : "", 'right': ""}
      \}
function! LightlineFilePath()
  if winwidth(0) > 180
    return expand("%:s")
  else
    return expand("%:t")
  endif
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set autoindent
set encoding=utf-8
scriptencoding utf-8
set printencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set ff=unix
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces

set nobackup
set noswapfile
set autoread
set autochdir
set ambiwidth=double
set virtualedit=onemore
set visualbell
set showmatch
set smartindent
set showtabline=2
set clipboard+=unnamed
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*~,*.png,*.jpg,*.gif

" Use small tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault " default :s///g
set wrapscan
set hlsearch

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" GUI Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newline
set nofoldenable " ?
set ruler " where am I?
set ttyfast " ?
set lazyredraw " ?
set synmaxcol=500 " ?
set laststatus=2
set relativenumber
set number
set showcmd
set mouse=a " enable mouse for all mode

" font
set guifont=Cica:h12
set printfont=Cica:h8

" colorscheme
syntax enable
colorscheme molokai
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Keyboard Shortcut
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
let g:mapleader = "\<Space>"

" Move by line
nnoremap j gj
nnoremap k gk

" Scroll half a page
nnoremap <C-k> <C-u>zz
nnoremap <C-j> <C-d>zz

" Jump to start and end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" TRIAL
nnoremap <Leader>s :source %<CR>
nnoremap <Leader>, :new ~/.vimrc<CR>
cnoremap <C-d> ~/dev/

" my own map using only m
nnoremap m mm
nnoremap ` `m

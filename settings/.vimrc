"""""""""""""""""""""
" Search options
"""""""""""""""""""""
set hlsearch " Enable search highlighting.
set ignorecase " Ignore case when searching.

"""""""""""""""""""""
" Performance options
"""""""""""""""""""""
set lazyredraw " Don’t update screen during macro and script execution.

"""""""""""""""""""""
" Text Rendering Options
"""""""""""""""""""""
set encoding=utf-8 " Use an encoding that supports unicode.
set fileencodings=utf-8,euc-kr
set linebreak " Avoid wrapping a line in the middle of a word.
set scrolloff=1 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.
syntax enable " Enable syntax highlighting.
set wrap " Enable line wrapping.

"""""""""""""""""""""
" User Interface Options
"""""""""""""""""""""
set laststatus=2 " Always display the status bar.
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set ruler " Always show cursor position.
set wildmenu " Display command line’s tab complete options as a menu.
set tabpagemax=50 " Maximum number of tab pages that can be opened from the command line.
set cursorline " Highlight the line currently under cursor.
set number " Show line numbers on the sidebar.
set mouse=a " Enable mouse for scrolling and resizing.

"""""""""""""""""""""
" Code Folding Options
"""""""""""""""""""""
set foldnestmax=3 "  Only fold up to three nested levels.
set foldlevel=2
set nofoldenable " Disable folding by default.

"""""""""""""""""""""
" Miscellaneous Options
"""""""""""""""""""""
set autoread " Automatically re-read files if unmodified inside Vim.
set confirm "  Display a confirmation dialog when closing an unsaved file.
set hidden " Hide files in the background instead of closing them.
set history=1000 " Increase the undo limit.
set wildignore+=.pyc,.swp " Ignore files matching these patterns when opening files based on a glob pattern.

set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set showmatch " 일치하는 괄호 하이라이팅
set softtabstop=4
set incsearch

set backspace=indent,eol,start


"""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v

noremap <F1> :NERDTreeToggle<CR>
noremap <C-a> :Git blame<CR> " git-fugitive
let g:NERDCreateDefaultMappings = 0
noremap <C-_> :NERDCommenterComment<CR>


"""""""""""""""""""""
" Scripts && Functions
"""""""""""""""""""""
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

colorscheme jellybeans

"""""""""""""""""""""
" Plugin: Vundle 
"""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf  " MacOS

call vundle#begin()
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Keep Plugin commands between vundle#begin/end.

    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'aklt/plantuml-syntax' " uml syntax
    Plugin 'ctrlpvim/ctrlp.vim' " global finder
	Plugin 'preservim/nerdcommenter'
    Plugin 'chrisbra/csv.vim' " for csv file
    Plugin 'davidhalter/jedi-vim' " autoCompletion
    Plugin 'junegunn/fzf.vim' 
    Plugin 'cespare/vim-toml'
	Plugin 'majutsushi/tagbar'
	Plugin 'scrooloose/nerdtree'
	Plugin 'nathanaelkane/vim-indent-guides'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'tpope/vim-fugitive'
	Plugin 'blueyed/vim-diminactive'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on

    "ctrlp option. will ignore below to avoid freezing
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
      \ 'file': '\v\.(exe|so|dll)$'
    \ }

"""""""""""""""""""""
" Plugin: vim-airline
"""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
let g:airline_theme='hybrid'


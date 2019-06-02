"""""""""""""""""""""
" Indentation options
"""""""""""""""""""""
set autoindent " New lines inherit the indentation of previous lines.
set expandtab " Convert tabs to spaces.
set shiftwidth=4 " When shifting, indent using four spaces.
set smarttab " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4 " Indent using four spaces.

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
set foldmethod=indent " Fold based on indention levels.
set foldnestmax=3 "  Only fold up to three nested levels.
set foldlevel=2
set nofoldenable " Disable folding by default.

"""""""""""""""""""""
" Miscellaneous Options
"""""""""""""""""""""
set autoread " Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.
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
set smartindent
set softtabstop=4
set incsearch


"""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v

"""""""""""""""""""""
" Scripts && Functions
"""""""""""""""""""""
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif


" 컬러 스킴 사용
colorscheme jellybeans

"""""""""""""""""""""
" Plugin: Vundle 
"""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " Keep Plugin commands between vundle#begin/end.

    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'aklt/plantuml-syntax' " uml syntax
    Plugin 'ctrlpvim/ctrlp.vim' " global finder
    Plugin 'scrooloose/nerdcommenter' " add comment char, depending its extensions 
    Plugin 'chrisbra/csv.vim' " for csv file
    Plugin 'davidhalter/jedi-vim' " autoCompletion
    Plugin 'vimwiki/vimwiki'  " for wiki making

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
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

"""""""""""""""""""""
" Plugin: vim-wiki
"""""""""""""""""""""
" 로컬 리더 키 설정은 취향이니 각자 마음에 드는 키로 설정한다
let maplocalleader = "\\"
let g:vimwiki_list = [
    \ {
        \ 'path': $HOME.'/projects/my-wiki.wiki/',
        \ 'syntax': 'markdown',
        \ 'ext': '.md'
    \ }
\]
" vimwiki의 conceallevel 을 끄는 쪽이 좋다
let g:vimwiki_conceallevel = 0

command! WikiIndex :VimwikiIndex

function! NewTemplate()
    let l:wiki_directory = v:false

    echo g:vimwiki_list
    for wiki in g:vimwiki_list
        echo $HOME
        echo wiki.path
        echo expand('%:p:h') . '/' 
        if expand('%:p:h') . '/' == wiki.path
            echo "This file is under the wiki path"
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    echo "Current line: ".line("$")
    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags    : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

function! LastModified()
    if &modified
        echo "markdown updated time modified"
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        exe 'keepjumps 1,' . n . 's#^\(.\{,10}updated : \).*#\1' .
            \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

augroup vimwikiauto
    autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END

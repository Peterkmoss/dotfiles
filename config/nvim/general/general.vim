" Set history to 500
set history=500

" 8 lines after cursor still shown
set so=8

" Buffers
set hidden

" Turn on wild menu
set wildmenu

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when on one
set showmatch

" Indents
set expandtab
set smarttab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set wrap linebreak

" Search
set ignorecase
set nohlsearch

set completeopt=menuone,noinsert,noselect

" General
set encoding=utf-8
set mouse=
set number relativenumber
set spelllang=da,en_us
set cursorline
set signcolumn=yes
set cmdheight=1

set nobackup
set nowritebackup

set updatetime=50

" Clipboard
set clipboard=unnamedplus

" Fix splitting
set splitbelow splitright

set conceallevel=0

" Statusline
set noshowmode

let g:live_reload = 0

set viewoptions="folds,options,cursor"

" Autocommands
augroup MyGroup
    au!
    au BufWritePost *.html :call ReloadFirefox()
    au FileType Makefile setlocal noexpandtab
    au BufRead,BufNewFile *.tex setlocal filetype=tex
    au BufWinLeave *.* mkview!
    au BufWinEnter *.* silent! loadview
augroup END

function! GitBranch()
  return system("git branch --show-current 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  '.l:branchname : ''
endfunction

function! GetMode()
    let l:mode = mode()

    if l:mode ==# "n"
        return "normal"
    elseif l:mode ==# "i"
        return "insert"
    elseif l:mode ==# "v"
        return "visual"
    elseif l:mode ==# "V"
        return "visual [line]"
    elseif l:mode ==# "CTRL-V"
        return "visual [block]"
    elseif l:mode ==# "R"
        return "replace"
    elseif l:mode ==# "c"
        return "command"
    else
        return l:mode
    endif
endfunction

set statusline=
set statusline+=%#Number#
set statusline+=\ %{GetMode()}
set statusline+=%#Keyword#
set statusline+=%{StatuslineGit()}
set statusline+=%#Type#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%#Todo#
set statusline+=\ %{coc#status()}
set statusline+=%#Comment#
set statusline+=\ %y
set statusline+=\ %l/%L
set statusline+=\ %p%%

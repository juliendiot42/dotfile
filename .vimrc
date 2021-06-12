" Acknowledgements:
"   Several elements of this .vimrc come from Kévin Sztern's config
"   You can find it here: https://github.com/Chewie/dotfiles/blob/master/vim/.vimrc




" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Theming
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 'IDE' features
Plug 'tpope/vim-fugitive'


call plug#end()


" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number
set relativenumber

" Enables syntax highlighting
syntax on


" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤,space:·

set fillchars=vert:│


" Briefly show matching braces, parens, etc
set showmatch

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Insert spaces instead of tabs
set expandtab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" Allow mouse use in vim
set mouse=a



" Use a slightly darker background color to differentiate with the status line
let g:jellybeans_background_color_256='232'

" Feel free to switch to another colorscheme
colorscheme jellybeans

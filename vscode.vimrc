" some options:

" use exclusive selection so that `v$c` does not include the line break
set selection=exclusive


" key mapping:

" remap j and k to gj, gk. move one 'dispay' line up when lines are wrapped
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" keep the select text with mouse then ctrl+v to paste (instead of going to visual block mode)
vnoremap <C-v> p

imap <Down> <C-o>gj
imap <Up> <C-o>gk

" 'c' yank in a specific "c" register
nnoremap c "cc
vnoremap c "cc

"Newlines
nnoremap <C-j> o<ESC>
nnoremap <C-k> O<ESC>

" insert space from normal mode
nnoremap <C-Space> i<Space><ESC>l


" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-w>
" noremap! <C-BS> <C-w>
" noremap! <C-h> <C-w>

" Search selected text
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
" better behaviour of n and N J
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" move vertically, center lines
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

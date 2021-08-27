" Vim configuration specific to R files


" show existing tab with 2 spaces width
setlocal tabstop=2
" when indenting with '>', use 2 spaces width
setlocal shiftwidth=2
" On pressing tab, insert 2 spaces
setlocal  expandtab

" autosave
set autowrite

" special remap:
inoremap <M--> <Space><-<Space>




" Tag R source code:
" FIRST DO in a treminal:
" R CMD rtags -o ~/TAGS /opt/R/R-4.0.4/src
" Rscript -e 'nvimcom::etags2ctags("~/TAGS", "~/.cache/Nvim-R/Rtags")'
" rm ~/TAGS
" ctags --languages=C,Fortran,Java,Tcl -R -f ~/.cache/Nvim-R/RsrcTags /opt/R/R-4.0.4/src
" 
" For R packages:
"  DO NOT WORK
" R CMD rtags -o ~/TAGS ~/R/x86_64-pc-linux-gnu-library/4.0
" Rscript -e 'nvimcom::etags2ctags("~/TAGS", "~/.cache/Nvim-R/RpkgTags")'
" rm ~/TAGS
" ctags --languages=C,Fortran,Java,Tcl -R -f ~/.cache/Nvim-R/RpkgSrcTags ~/R/x86_64-pc-linux-gnu-library/4.0

set tags+=~/.cache/Nvim-R/Rtags,~/.cache/Nvim-R/RsrcTags,~/.cache/Nvim-R/RpkgTags,~/.cache/Nvim-R/RpkgSrcTags



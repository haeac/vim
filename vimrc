let mapleader = ","

set list
set listchars=tab:▸\ ,eol:¬

" Toggle list chars on and off with `,l`
nmap <leader>l :set list!<CR>

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Toggle line numbers on and off with `,n`
nmap <silent> <leader>n :set number!<CR>

" Toggle relative line numbers on and off with `,r`
nmap <silent> <leader>r :set relativenumber!<CR>

" Set region to British English
set spelllang=en_gb

set ts=4 sts=4 sw=4 ai expandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Setup tabs and spaces for some languages
  autocmd FileType make setlocal ts=8 sts=8 sw=8 ai noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 ai expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 ai expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 ai expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 ai expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 ai noexpandtab
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 ai expandtab

  " Treat .sls files as YAML
  autocmd BufNewFile,BufRead *.sls setfiletype yml
endif

" Mappings for indentations
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Toggle between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Visual selection of the text that was last modified
nmap gV `[v`]

let mapleader = ","                                             " Set map leader to ,
let g:airline_powerline_fonts = 1                               " Use powerline fonts (install them first)
" Tweaks for netrw built-in plug-in
let g:netrw_banner=0                                            " Disable annoying banner
let g:netrw_browse_split=4                                      " Open in prior window
let g:netrw_altv=1                                              " Open splits to the right
let g:netrw_liststyle=3                                         " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set nocompatible                                                " Don't be compatible with vi
" set list
set number                                                      " Activate line numbers
set relativenumber                                              " Activate relative line numbers
set listchars=tab:▸\ ,eol:¬
set wrap                                                        " Wrap long lines
set lazyredraw                                                  " Re-draw screen only when needed
set showmatch                                                   " Highlight matching [{()}]
set incsearch                                                   " Live search
set hlsearch                                                    " Highlight search results
set spelllang=en_gb                                             " Set region to British English
set ts=4 sts=4 sw=4 ai expandtab
set path+=**                                                    " Add sub-tree to path
set wildmenu                                                    " Display all matching files when we tab complete

" Toggle list chars on and off with `,l`
nmap <leader>l :set list!<CR> 

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Toggle line numbers on and off with `,n`
nmap <silent> <leader>n :set number!<CR>

" Toggle relative line numbers on and off with `,r`
nmap <silent> <leader>r :set relativenumber!<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Setup tabs and spaces for some languages
  autocmd FileType make setlocal ts=8 sts=8 sw=8 ai noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 ai expandtab
  autocmd FileType jinja setlocal ts=2 sts=2 sw=2 ai expandtab
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

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Visual selection of the text that was last modified
nmap gV `[v`]


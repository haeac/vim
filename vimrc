let mapleader = ","                                             " Set map leader to ,
let g:airline_powerline_fonts = 1                               " Use powerline fonts (install them first)

" Tweaks for netrw built-in plug-in
let g:netrw_banner=0                                            " Disable annoying banner
let g:netrw_browse_split=4                                      " Open in prior window
let g:netrw_altv=1                                              " Open splits to the right
let g:netrw_liststyle=3                                         " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Uncomment the next 3 settings if the Google Colour scheme is installed from
" https://github.com/google/vim-colorscheme-primary

" syntax enable                                                   " Setup color scheme

" set t_Co=256
" set background=dark
set encoding=utf-8                                              " Set default file encoding
set nocompatible                                                " Don't be compatible with vi
set number                                                      " Activate line numbers
set numberwidth=5                                               " Increas width of number column
set relativenumber                                              " Activate relative line numbers
set wrap                                                        " Wrap long lines
set showmatch                                                   " Highlight matching [{()}]
set incsearch                                                   " Live search
set hlsearch                                                    " Highlight search results
set spelllang=en_gb                                             " Set region to British English
set ts=4 sts=4 sw=4 ai expandtab                                " Setup softtabs
set path+=**                                                    " Add sub-tree to path
set wildmenu                                                    " Display all matching files when we tab complete
set splitbelow                                                  " Open split panes right and bottom
set splitright                                                  " Open split panes right and bottom
set list listchars=tab:»·,trail:·,nbsp:·                        " Display extra whitespace
set laststatus=2                                                " Always display the status line
set modelines=0                                                 " Disable mode lines as a security precaution
set nomodeline
set backspace=2                                                 " Backspace deletes like most programs in insert mode
set showcmd                                                     " Display inclomplete commands
set ruler                                                       " Show cursor position at all times
set diffopt+=vertical                                           " Always do vertical diffs
set nojoinspaces                                                " Use one space, not two, after punctuation.

" Toggle list chars on and off with `,l`
nnoremap <leader>l :set list!<CR>

" Toggle spell checking on and off with `,s`
nnoremap <silent> <leader>s :set spell!<CR>

" Toggle line numbers on and off with `,n`
nnoremap <silent> <leader>n :set number!<CR>

" Toggle relative line numbers on and off with `,r`
nnoremap <silent> <leader>r :set relativenumber!<CR>

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
nnoremap <D-[> <<
nnoremap <D-]> >>

" Toggle between windows (splits)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Visual selection of the text that was last modified
nnoremap gV `[v`]


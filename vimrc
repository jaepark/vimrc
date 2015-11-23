
"""[ General ]""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                            " get out of horrible vi-compatible mode
set ffs=unix,dos,mac                        " automatically detected values for fileformat in this order
set fileencodings=utf-8,euc-kr
set background=dark                         " we are using a dark background

"""[ Vim UI ]"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number                                  " Print the line number in front of each line
set ruler                                   " Show the line and column number of the cursor position
set noerrorbells                            " don't make noise on error messages

"""[ Visual Cues ]""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch                               " show matching brackets for a moment
set matchtime=3                             " how many tenths of a second to blink matching brackets for
set hlsearch                                " do highlight searched phrases
set incsearch                               " but do highlight as you type you search phrase
set novisualbell                            " don't blink
set laststatus=2                            " always show the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b\,HEX=\%02.2B]\ [%p%%]\ [POS=L%l,C%01v]

""" [Path/File Expansion] """
set wildmode=list:longest:full,full
set wildchar=<TAB>

""" [ Formatting ] """
filetype on
filetype plugin on
au FileType tpp,c,cpp,cs,html,php,php4,js,css,jsp set nu

set tabstop=4 " an indentation every four columns
set softtabstop=4 "let backspace delete indent
set shiftwidth=4 " use indents of 4 spaces
set expandtab " tabs are spaces, not tab
" set noexpandtab " tabs are tabs

au FileType html,css set sw=2 sts=2 ts=2
au FileType jade set sw=2 sts=2 ts=2
" au FileType python set sw=2 sts=2 ts=2

syntax on
set smartindent


""" [ html indentation ] """
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

""" [ cTags ] """
set tags=tags;/
if !exists("autocommands_loaded")
let autocommands_loaded = 1
  augroup C
    autocmd BufRead *.c set cindent
  augroup END
endif
nmap <C-]> :tj <C-R><C-W><CR>

"Highlight Extra White Space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'pangloss/vim-javascript'

" Syntax highlight for .ejs files in vim
au BufNewFile,BufRead *.ejs set filetype=js
au BufNewFile,BufRead *.ejs set filetype=html

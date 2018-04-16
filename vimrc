" Call plugins
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'https://github.com/nightsense/carbonized'
Plug 'https://github.com/romainl/flattened'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/drewtempelmeyer/palenight.vim'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/hzchirs/vim-material'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/KeitaNakamura/neodark.vim'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/yuttie/comfortable-motion.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Line numbers
set number
set relativenumber

" cursor line
set cursorline
set cursorcolumn

" Theme stuff 
if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
        let g:enable_bold_font=1
        let g:enable_italic_font=1
        let g:palenight_terminal_italics=1
        let g:solarized_visibility = "high"
        let g:solarized_contrast = "high"
        let g:onedark_terminal_italics=1
        set background=dark
        colorscheme neodark
        let g:airline_theme='neodark'
        let g:airline#extensions#tabline#enabled = 1
    endif
endif

" syntax highlighting
syntax enable
let g:cpp_member_variable_highlight = 1

" Auto reload files
set autoread

" tabs and whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set wrap!
set autoindent

" Hide info on bottom
set noru
set nosmd

" scrolling behavior
set scrolloff=5

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" gitgutter custom symbols
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'

" double slash comments
autocmd FileType c,cpp,java setlocal commentstring=//\ %s
autocmd FileType m setlocal commentstring=%\ %s

" ctags path
set tags=~/.tags;

" Disable semantic autocompletion in YouCompleteMe
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'cpp': 1,
      \ 'c': 1}

" enable fzf
set rtp+=/usr/local/opt/fzf

" Faster buffer cycling
map <C-J> :bprevious<CR>
map <C-K> :bnext<CR>

" Search highlighted selection
vnoremap // y/<C-R>"<CR>

" Close buffer and switch to prev, keeping window open
command CB bp|bd #

" Turn off truecolor
command TG set termguicolors!

" Open ctags definitions in new tab or vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

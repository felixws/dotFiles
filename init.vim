"init.vim file for ubuntu created on 5.12.2020
" plug directory: ~/.local/share/nvim/site/autoload/plug.vim
" TODO: split init.vim into multiple files and source them

call plug#begin(stdpath('data') . '/plugged')
" appearance
    Plug 'joshdick/onedark.vim' 
    Plug 'vim-airline/vim-airline'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'mhinz/vim-startify'
    Plug 'Yggdroot/indentLine'
    Plug 'wfxr/code-minimap'

" navigation
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin' 
    Plug 'ctrlpvim/ctrlp.vim' 
    Plug 'jremmen/vim-ripgrep'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ludovicchabant/vim-gutentags'

" completion/templating
    Plug 'davidhalter/jedi-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
    Plug 'SirVer/ultisnips'
    Plug 'vim-utils/vim-man'
    Plug 'dense-analysis/ale'
    Plug 'mattn/emmet-vim'

" command extention
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mbbill/undotree'

" git
    Plug 'tpope/vim-fugitive'

" LaTeX
    Plug 'lervag/vimtex'

call plug#end()

set fileencoding=utf-8
set encoding=utf-8

set relativenumber
set smartindent
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set nowrap
set scrolloff=8
set cmdheight=2
set nohlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set hidden
set incsearch
set clipboard^=unnamed,unnamedplus

" appearance 
syntax on
set number
set cursorline
set colorcolumn=80
highlight ColoColumn ctermbg=0 guibg=lightgrey
colorscheme onedark
set background=dark

" set which python environments to use
" setup venvs for nvim python
let g:python3_host_prog = '~/.nvim-python3/bin/python3'
"let g:python_host_prog = '~/nvim-python3/bin/python3'

" spacebar as leader key
let mapleader=' '

" quick sourcing of vimrc
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
 
" easier movement across windows
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
" easier resizing of windows
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>< :resize -5<CR>
nnoremap <silent> <Leader>> :resize +5<CR>
" hotkeys for smooth scroll plugin
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

" hotkeys to run python code
nnoremap <leader><F2> :vsplit<CR>:terminal python %<CR> 
nnoremap <leader><F3> :vnew<CR>:terminal python<CR>

" startify customizations
nnoremap <leader>t :tabnew<CR>:Startify<CR>

" undotree customizations
nnoremap <leader>u :UndotreeShow<CR>

" NERDTree customizations
nnoremap <leader>pv :NERDTree <bar> :vertical resize 30<CR>
let NERDTreeShowLineNumbers=1

" ripgrep customizations
nnoremap <leader>ps :Rg<space>

" jedi-vim customizations
let g:jedi#completions_enabled = 0
 
" deoplete customizations
let g:deoplete#enable_at_startup = 1

" emmet config
 
" vimtex config
let g:tex_flavor = 'latex'
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" gutentags config
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

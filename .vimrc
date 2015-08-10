set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
" Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ivanov/vim-ipython'
Plugin 'hdima/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" auto-reload vimrc on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set clipboard=unnamed

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set noswapfile
if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup  " keep a backup file
  set backupdir=~/.vim/tmp,.
  set directory=~/.vim/tmp,.
endif

set history=700
set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands
set incsearch  " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" tabstop, softtabstop, shiftwidth, ...
set ts=4 sts=4 sw=4 expandtab smarttab

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 80 characters.
    autocmd FileType text setlocal textwidth=80

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

  " Enable file type detection
  filetype on

  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

else
  set autoindent  " always set autoindenting on
endif " has("autocmd")

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap <silent> <leader>s :call <SID>StripTrailingWhitespaces()<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" remove delays on ESC
set timeoutlen=1000 ttimeoutlen=0

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" zsh-style tab-complete in command-line mode
set wildmenu
set wildmode=longest:full,full
" set wildmode=longest:list,full

" <C-p> and <C-n> filter command history
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>

" shortcuts for switching panes
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" expand active file directory in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

colorscheme peachpuff

" line numbers and color overrides
set number
set colorcolumn=80,81
hi ColorColumn ctermbg=233
hi LineNr ctermfg=DarkGrey guifg=#2b506e guibg=#000000
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233 guibg=121212

" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

" invisible character colors
hi NonText ctermfg=DarkGrey guifg=#2b506e guibg=#000000
hi SpecialKey ctermfg=DarkGrey guifg=#2b506e guibg=#000000

" custom search highlight
hi Search ctermfg=Black ctermbg=39 cterm=bold,underline

" for powerline
set rtp+=$POWERLINE_ROOT/powerline/bindings/vim
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'

" fuzzy find
nnoremap <silent> <C-t> :FZF<CR>

nnoremap Y y$

" python folding
set nofoldenable
hi Folded ctermbg=233

" syntastic
highlight link SyntasticError ErrorMsg
highlight link SyntasticWarning Todo

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Visual highlight black
hi Visual ctermbg=0

"vim multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

set nocompatible
syntax on
colorscheme slate

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

compiler ruby

set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set runtimepath^=~/.vim/bundle/ctrlp.vim

set ignorecase
set smartcase

set wildignore+=*.pyc
let &t_Co=256
let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let g:no_html_toolbar = 'yes'

let coffee_no_trailing_space_error = 1

let NERDTreeIgnore=['\.pyc']

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim
imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <LocalLeader>aw :Ack '<C-R><C-W>'
map <silent> <LocalLeader>bd :bufdo :bd<CR>

map <silent> <LocalLeader>rl :wa<CR> :RunLastVimTmuxCommand<CR>
map <silent> <LocalLeader>ri :wa<CR> :InspectVimTmuxRunner<CR>
map <silent> <LocalLeader>rx :wa<CR> :CloseVimTmuxPanes<CR>
map <silent> <LocalLeader>vp :PromptVimTmuxCommand<CR>
vmap <silent> <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>
nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>

command SudoW w !sudo tee %
cnoremap <Tab> <C-L><C-D>

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$

if version >= 700
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
    autocmd FileType tex setlocal spell spelllang=en_us
endif

au FileType diff colorscheme desert
au FileType git colorscheme desert

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone

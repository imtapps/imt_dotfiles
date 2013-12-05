" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
"===================================================================================
"  DESCRIPTION:  Enterprise Ready Development Environment
" .__         __
" |__| ______/  |_  _____  ______ ______  ______
" |  |/     \   __\ \__  \ \____ \\____ \/  ___/
" |  |  Y Y  \  |    / __ \|  |_> >  |_> >___ \
" |__|__|_|  /__|   (____  /   __/|   __/____  >
"          \/            \/|__|   |__|       \/
"
"===================================================================================
"
" Set nocompatible {
"-----------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings. This must be first, because it changes
" other options as a side effect.
"-----------------------------------------------------------------------------------
set nocompatible
" }

" Vundle Package Management {1
" Notes {2
"===================================================================================
"
" Help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"===================================================================================
" }2
" Required for vundle to work {2
"-----------------------------------------------------------------------------------
 filetype off
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 Bundle 'gmarik/vundle'
" }2
" Github repos for bundles that we want to have installed {2
"-----------------------------------------------------------------------------------
 Bundle 'https://github.com/Shougo/neocomplcache.vim'
 Bundle 'https://github.com/vim-scripts/bash-support.vim'
 Bundle 'https://github.com/Raimondi/delimitMate'
 Bundle 'https://github.com/vim-scripts/L9'
 Bundle 'https://github.com/scrooloose/nerdtree'
 Bundle 'https://github.com/JarrodCTaylor/vim-256-color-schemes'
 Bundle 'https://github.com/tpope/vim-fugitive'
 " Must have exuberant-ctags for tagbar to work
 Bundle 'https://github.com/majutsushi/tagbar'
 Bundle 'https://github.com/ervandew/supertab'
 Bundle 'https://github.com/pangloss/vim-javascript'
 Bundle 'https://github.com/Lokaltog/vim-easymotion'
 Bundle 'https://github.com/scrooloose/syntastic'
 Bundle 'https://github.com/kchmck/vim-coffee-script'
 Bundle 'https://github.com/kien/ctrlp.vim'
 Bundle 'https://github.com/tpope/vim-commentary'
 Bundle 'https://github.com/davidhalter/jedi-vim'
 Bundle 'https://github.com/mhinz/vim-startify'
 Bundle 'https://github.com/tpope/vim-surround'
 Bundle 'https://github.com/mustache/vim-mustache-handlebars'
 Bundle 'https://github.com/JarrodCTaylor/vim-python-test-runner'
 Bundle 'https://github.com/tpope/vim-rails'
 Bundle 'https://github.com/tmhedberg/SimpylFold'
 Bundle 'https://github.com/bling/vim-airline'
 Bundle 'https://github.com/kien/rainbow_parentheses.vim'
 Bundle 'https://github.com/tpope/vim-fireplace'
 Bundle 'https://github.com/JarrodCTaylor/vim-js2coffee'
 Bundle 'https://github.com/sjl/gundo.vim'
 Bundle 'https://github.com/nelstrom/vim-markdown-folding'
 Bundle 'https://github.com/tpope/vim-markdown'
 Bundle 'https://github.com/justinmk/vim-sneak'
 Bundle 'https://github.com/JarrodCTaylor/vim-shell-executor'
" }2
" }1

" General Settings {1
" File Type Detection {2
"-----------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Load indent files, to automatically do language-dependent indenting.
"-----------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
" }2
" Color scheme {2
"-----------------------------------------------------------------------------------
set t_Co=256
colorscheme understated
" }2
" Switch syntax highlighting on. {2
"-----------------------------------------------------------------------------------
syntax on
" }2
" Various settings {2
"-----------------------------------------------------------------------------------
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set autowrite                          " Write a modified buffer on each :next , ...
set backspace=indent,eol,start         " Backspacing over everything in insert mode
set history=50                         " Keep 50 lines of command line history
set hlsearch                           " Highlight the last used search pattern
set incsearch                          " Do incremental searching
"set list                              " Toggle manually with set list / set nolist or set list!
set listchars=""                       " Empty the listchars
set listchars=tab:>.                   " A tab will be displayed as >...
set listchars+=trail:.                 " Trailing white spaces will be displayed as .
set nobackup                           " Don't constantly write backup files
set noswapfile                         " Ain't nobody got time for swap files
set noerrorbells                       " Don't beep
set nowrap                             " Do not wrap lines
set popt=left:8pc,right:3pc            " Print options
set shiftwidth=4                       " Number of spaces to use for each step of indent
set showcmd                            " Display incomplete commands in the bottom line of the screen
set ignorecase                         " Ignore case when searching....
set smartcase                          " ...unless uppercase letter are used
set tabstop=4                          " Number of spaces that a <Tab> counts for
set expandtab                          " Make vim use spaces and not tabs
set undolevels=1000                    " Never can be too careful when it comes to undoing
set hidden                             " Don't unload the buffer when we switch between them. Saves undo history
set visualbell                         " Visual bell instead of beeping
set wildignore=*.swp,*.bak,*.pyc,*.class,node_modules/**  " wildmenu: ignore these extensions
set wildmenu                           " Command-line completion in an enhanced mode
set shell=bash                         " Required to let zsh know how to run things on command line
set ttimeoutlen=50                     " Fix delay when escaping from insert with Esc
set noshowmode                         " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }2
" Set the minimum number of lines above and below the cursor {2
"-----------------------------------------------------------------------------------
set scrolloff=3
" }2
" Treat JSON files like JavaScript {2
"-----------------------------------------------------------------------------------
au BufNewFile,BufRead *.json set ft=javascript
" }2
" Make pasting done without any indentation break {2
"-----------------------------------------------------------------------------------
set pastetoggle=<F3>
" }2
" Initially display all folds open {2
"-----------------------------------------------------------------------------------
set nofoldenable
" }2
" Last cursor position {2
"-----------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-----------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Mustache/Handlebars abbreviations
let g:mustache_abbreviations = 1

if has("autocmd")
  au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif

" }2
" Make arrowkey resize viewports {2
"-----------------------------------------------------------------------------------
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>
" }2
" }1

" Status line {1
set laststatus=2                                    " Make the second to last line of vim our status line
let g:airline_theme='understated'                   " Use the custom theme I wrote
let g:airline_left_sep=''                           " No separator as they seem to look funky
let g:airline_right_sep=''                          " No separator as they seem to look funky
let g:airline#extensions#branch#enabled = 0         " Do not show the git branch in the status line
let g:airline#extensions#syntastic#enabled = 1      " Do show syntastic warnings in the status line
let g:airline#extensions#tabline#show_buffers = 0   " Do not list buffers in the status line
let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = '[R%04l,C%04v] [LEN=%L]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the default file position info
"let g:airline_section_warning = ''                  " Do not show the syntastic information in the status line
let g:airline#extensions#virtualenv#enabled = 0
" }1

" Jarrod's Remapped Keys {1
" Notes {2
"===================================================================================
"  (nore) prefix -- non-recursive
"  (un)   prefix -- Remove a mode-specific map
"  Commands                        Mode
"  --------                        ----
"  map                             Normal, Visual, Select, Operator Pending modes
"  nmap, nnoremap, nunmap          Normal mode
"  imap, inoremap, iunmap          Insert and Replace mode
"  vmap, vnoremap, vunmap          Visual and Select mode
"  xmap, xnoremap, xunmap          Visual mode
"  smap, snoremap, sunmap          Select mode
"  cmap, cnoremap, cunmap          Command-line mode
"  omap, onoremap, ounmap          Operator pending mode
"===================================================================================
" }2
" Key mappings {2
" --- change mapleader from \ to 9 as I find that easier to type
let mapleader="9"
" --- jk mapped to <Esc> so we can keep our fingers on the home row
imap jk <Esc>
" --- ss will toggle spell checking
map ss :setlocal spell!<CR>
" --- toggle NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>no :NERDTreeFind<CR>
" --- toggle Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
" --- open CtrlP buffer explorer
nnoremap <Leader>b :CtrlPBuffer<CR>
" --- open Ctrlp as a fuzzy finder
nnoremap <Leader>ff :CtrlP<CR>
" --- Split the window vertically
nnoremap <Leader>\ :vsplit<CR>
" --- Split the window horizontally
nnoremap <Leader>- :split<CR>
" --- Ack short cut
nnoremap <Leader>a :Ack!<space>
" --- Toggle Syntastic
nnoremap <Leader>ts :SyntasticToggleMode<CR>
" --- Clear the search buffer and highlighted text with enter press
:nnoremap <Space> :nohlsearch<CR>
" --- Search the ctags index file for anything by class or method name
map <Leader>st :CtrlPTag<CR>
" --- Refresh the ctags file
nnoremap <Leader>rt :call RenewTagsFile()<CR>
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" --- Better window navigation E.g. now use Ctrl+j instead of Ctrl+W+j
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" --- Shortcuts for test running commands
nnoremap<Leader>da :DjangoTestApp<CR>
nnoremap<Leader>df :DjangoTestFile<CR>
nnoremap<Leader>dc :DjangoTestClass<CR>
nnoremap<Leader>dm :DjangoTestMethod<CR>
nnoremap<Leader>nf :NosetestFile<CR>
nnoremap<Leader>nc :NosetestClass<CR>
nnoremap<Leader>nm :NosetestMethod<CR>
nnoremap<Leader>rr :RerunLastTests<CR>
" --- grunt-karma test runner shortcut
map <Leader>q :!karma start<CR>"
" --- Toggle relative line numbering
nnoremap<Leader>tn :set relativenumber!<CR>
" --- Shortcut to RenameFile function defined below
map <Leader>rf :call RenameFile()<CR>
" --- Shortcut to CopyFile function defined below
map <Leader>cf :call CopyFile()<CR>
" --- Shortcut to toggle visual undo
nnoremap<Leader>u :GundoToggle<CR>
" }2
" }1

" Plugin Configurations {1
" Syntastic configurations use :help syntastic.txt {2
"-----------------------------------------------------------------------------------
let g:syntastic_check_on_open=1                   " check for errors when file is loaded
let g:syntastic_loc_list_height=5                 " the height of the error list defaults to 10
let g:syntastic_python_checkers = ['flake8']      " sets flake8 as the default for checking python files
let g:syntastic_javascript_checkers = ['jshint']  " sets jshint as our javascript linter
" Ignore line width for syntax checking in python
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
" }2
" Neocomplcache configurations {2
"-----------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup=1
" To make compatible with jedi
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
  endif
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
let g:neocomplcache_force_overwrite_completefunc = 1
" }2
" Ctrlp configurations {2
"-----------------------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules$\|xmlrunner$\|.DS_Store|.git|.bak|.swp|.pyc'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 18
" }2
" Exuberant ctags configurations {2
"-----------------------------------------------------------------------------------
" Vim will look for a ctags file in the current directory and continue
" up the file path until it finds one
"-----------------------------------------------------------------------------------
" Enable ctags support
set tags=./.ctags,.ctags;
" }2"
" NERDTree configurations {2
"-----------------------------------------------------------------------------------
" Make NERDTree ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']
" }2
" Jedi configurations {2
"-----------------------------------------------------------------------------------
let g:jedi#goto_definitions_command = "<Leader>j"
let g:jedi#use_tabs_not_buffers = 0     " Use buffers not tabs
let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = "<leader>rn"
" }2
" Startify configurations {2
"-----------------------------------------------------------------------------------
let g:ctrlp_reuse_window = 'startify'
let g:startify_change_to_dir = 0
" Highlight the acsii banner with red font
hi StartifyHeader ctermfg=124
" Set the contents of the banner
let g:startify_custom_header = [
            \ '               AAAAAAAA       PPPPPPPPPPPPP      PPPPPPPPPPPPP        SSSSSSSSSS     ',
            \ '              AAAAAAAAA       PPPPPPPPPPPPPPPP   PPPPPPPPPPPPPPPP   SSSSSSSSSSSSSS   ',
            \ '             AAAAAAAAAA       PPPPPPPPPPPPPPPPP PPPPPPPPPPPPPPPPPP SSSSSS   SSSSSSS  ',
            \ '                                          PPPPP              PPPPP                   ',
            \ '                                          PPPPP              PPPPP                   ',
            \ '                                         PPPPPP             PPPPPP                   ',
            \ '          AAAAAAAAAAAAAA    PPPPPPPPPPPPPPPPPP PPPPPPPPPPPPPPPPPP    SSSSSSSSSSSSS   ',
            \ '         AAAAAAAAAAAAAAA    PPPPPPPPPPPPPPPPP  PPPPPPPPPPPPPPPPP        SSSSSSSSSSS  ',
            \ '        AAAAAA     AAAAAA   PPPPPP             PPPPPP            SSSSS      SSSSSSS  ',
            \ '       AAAAAA      AAAAAA  PPPPPPP            PPPPPPP            SSSSSS     SSSSSSS  ',
            \ '      AAAAAA       AAAAAA  PPPPPPP            PPPPPPP             SSSSSSSSSSSSSSSS   ',
            \ '     AAAAAA        AAAAAAA PPPPPPP            PPPPPPP               SSSSSSSSSSSS     ',
            \ '    AAAAAAA        AAAAAAAAPPPPPPP            PPPPPPP                  SSSSSS        ',
            \ '                                                                                     ',
            \ '    ===============================================================================  ',
            \ '    ===============================================================================  ',
            \ '',
            \]
" List recently used files using viminfo.
let g:startify_show_files = 1
" The number of files to list.
let g:startify_show_files_number = 10
" A list of files to bookmark. Always shown
let g:startify_bookmarks = [ '~/.vimrc' ]
" }2
" Rainbow Parentheses {2
"-----------------------------------------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" }2
" SuperTab {2
"-----------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"
" }2
" Gundo {2
"-----------------------------------------------------------------------------------
let g:gundo_preview_bottom = 1
" }2
" Vim-Markdown-Folding {2
"-----------------------------------------------------------------------------------
let g:markdown_fold_style = 'nested'
" }2
" Vim-Markdown {2
"-----------------------------------------------------------------------------------
let g:markdown_fenced_languages = ['python', 'sh', 'vim', 'javascript', 'html', 'clojure', 'css', 'c', 'sql', 'java']
"}2
" Vim-Sneak {2
"-----------------------------------------------------------------------------------
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward
"}2
" }1

" Misc Functions {1
" RenewTagsFile {2
function! RenewTagsFile()
    exe 'silent !rm -rf .ctags'
    exe 'silent !coffeetags --include-vars -Rf .ctags'
    exe 'silent !ctags -a -Rf .ctags --languages=python --python-kinds=-iv --exclude=build --exclude=dist ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')''
    exe 'silent !ctags -a -Rf .ctags --extra=+f --exclude=.git --languages=python --python-kinds=-iv --exclude=build --exclude=dist 2>/dev/null'
    exe 'redraw!'
endfunction
" }2
" SortLines {2
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
" }2
" CopyFile {2
function! CopyFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        redraw!
    endif
endfunction
" }2
" RenameFile {2
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
" }2
" }1

" Key Bindings For The Others (Everyone who is not Jarrod) AT IMT {1
"===================================================================================
let mapleader=","
" --- open Ctrlp as a fuzzy finder
nnoremap <Leader>ff :CtrlP<CR>
" --- shortcut to save the current document
map .. :w<CR>
" -- spell check
noremap <Leader>sp :set spell spelllang=en_us<CR>
" --- toggle Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
" --- like grep on steroids
map <Leader>a :Ack!<space>
" --- basic file system navigation view
map <Leader>d :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
" --- python unit testing shortcuts
map <Leader>ta :DjangoTestApp<CR>
map <Leader>tf :DjangoTestFile<CR>
map <Leader>tc :DjangoTestClass<CR>
map <Leader>tm :DjangoTestMethod<CR>
nnoremap<Leader>ta :RerunLastTests<CR>
" --- search the ctags index file for anything by class or method name
map <Leader>fs :CtrlPTag<CR>
" --- search all files in the current files directory
map <Leader>fd :CtrlPCurFile<CR>
" --- search all the files you have open in your vim buffer
map <Leader>fb :CtrlPBuffer<CR>
" --- go to the last file you had open
nmap <Leader><Leader> <c-^>
" --- grunt-karma test runner shortcut
map <Leader>q :!karma start<CR>
" --- ,ed Shortcut to edit .vimrc file on the fly on a vertical window
nnoremap <Leader>ed <C-w><C-v><C-l>:e $MYVIMRC<CR>
" --- Easy motion
let g:EasyMotion_leader_key = '<Leader>l'
" --- Shortcut to RenameFile function defined above
map <Leader>rf :call RenameFile()<CR>
" --- Shortcut to CopyFile function defined above
map <Leader>cf :call CopyFile()<CR>
" --- re-index the ctags file
nnoremap <Leader>ri :call RenewTagsFile()<CR>
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" --- jj and jk For Qicker Escaping between normal and editing mode
inoremap jj <ESC>
inoremap jk <ESC>
" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @" = expand("%:p")"<CR>:echo "Copied file path to clipboard"<CR>
" Copy current filename to system clipboard
nnoremap <Leader>yf :let @"=expand("%:t")<CR>:echo "Copied file name to clipboard"<CR>
" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @"=expand("%:h")<CR>:echo "Copied file directory to clipboard"<CR>
" --- Toggle relative line numbering
nnoremap<Leader>tn :set relativenumber!<CR>
" --- Shortcut to surround inner words
nmap<Leader>s ysiw
" --- Shortcut to toggle visual undo
nnoremap<Leader>u :GundoToggle<CR>
" --- Emacs keys in insert mode
" May the programming gods forgive me for these four lines
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>l
imap <C-b> <C-o>h

function! TestVector()
    let g:test_commad = '!python src/manage.py test test ' . expand('%:p')
    exe g:test_commad
endfunction
nmap<Leader>tv :call TestVector()<CR>

function! RetestVector()
    exe g:test_commad
endfunction
nmap<Leader>rv :call RetestVector()<CR>
" }1

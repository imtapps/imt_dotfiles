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
 Bundle 'https://github.com/bkad/CamelCaseMotion'
 Bundle 'https://github.com/Shougo/neocomplcache.vim'
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
 Bundle 'https://github.com/JarrodCTaylor/vim-js2coffee'
 Bundle 'https://github.com/sjl/gundo.vim'
 Bundle 'https://github.com/nelstrom/vim-markdown-folding'
 Bundle 'https://github.com/tpope/vim-markdown'
 Bundle 'https://github.com/justinmk/vim-sneak'
 Bundle 'https://github.com/JarrodCTaylor/vim-shell-executor'
 Bundle 'https://github.com/epeli/slimux'
 Bundle 'https://github.com/JarrodCTaylor/vim-qunit-special-blend'
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
colorscheme pop-rocks
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
set showbreak=↪\
set synmaxcol=256
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
let mapleader="9"
imap jk <Esc>
map ss :setlocal spell!<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>no :NERDTreeFind<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>
nnoremap <Leader>a :Ack!<space>
nnoremap <Leader>ts :SyntasticToggleMode<CR>
nnoremap <Space> :nohlsearch<CR>
nnoremap <Leader>rt :call RenewTagsFile()<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>da :DjangoTestApp<CR>
nnoremap <Leader>df :DjangoTestFile<CR>
nnoremap <Leader>dc :DjangoTestClass<CR>
nnoremap <Leader>dm :DjangoTestMethod<CR>
nnoremap <Leader>nf :NosetestFile<CR>
nnoremap <Leader>nc :NosetestClass<CR>
nnoremap <Leader>nm :NosetestMethod<CR>
nnoremap <Leader>rr :RerunLastTests<CR>
nnoremap <Leader>tn :set relativenumber!<CR>:set number!<CR>
nnoremap <Leader>ud :GundoToggle<CR>
nnoremap <Leader>tc :call ToggleTodoCheckbox()<CR>
nnoremap <Leader>q :call QuickfixToggle()<CR>
nnoremap <Leader>eb :ExecuteBuffer<CR>
nnoremap <Leader>es :ExecuteSelection<CR>
nnoremap <Leader>ja :RunAllQunitTests<CR>
nnoremap <Leader>jt :RunSingleQunitTest<CR>
nnoremap <Leader>jm :RunSingleQunitModule<CR>
nnoremap Y y$
" --- Shortcuts for quickfix as it was broken for some reason
autocmd BufReadPost quickfix nnoremap <buffer> <CR> :.cc<CR>
autocmd BufReadPost quickfix nnoremap <buffer> o :.cc<CR>
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" --- Save changes to a readonly file with sudo
cmap w!! w !sudo tee %
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
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc
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
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''
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
let g:markdown_fenced_languages = ['python', 'sh', 'vim', 'javascript', 'html', 'css', 'c', 'sql']
"}2
" Vim-Sneak {2
"-----------------------------------------------------------------------------------
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward
let g:sneak#streak = 1
" We need 52 characters for this
let g:sneak#target_labels = "sfgkqwetyupzcvbnmSDFGHJKLQWERTYUPZXCVBNM1234567890rx"
"}2
" }1

" Misc Functions {1
" RenewTagsFile {2
"-----------------------------------------------------------------------------------
function! RenewTagsFile()
    exe 'silent !rm -rf .ctags'
    exe 'silent !coffeetags --include-vars -Rf .ctags'
    exe 'silent !ctags -a -Rf .ctags --languages=python --python-kinds=-iv --exclude=build --exclude=dist ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')''
    exe 'silent !ctags -a -Rf .ctags --extra=+f --exclude=.git --languages=python --python-kinds=-iv --exclude=build --exclude=dist 2>/dev/null'
    exe 'redraw!'
endfunction
" }2
" SortLines {2
"-----------------------------------------------------------------------------------
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
" }2
" CopyFile {2
"-----------------------------------------------------------------------------------
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
"-----------------------------------------------------------------------------------
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
" Highlight matches when jumping to next {2
"-----------------------------------------------------------------------------------
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight HighlightStyle ctermfg=none ctermbg=160 cterm=none
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('HighlightStyle', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
    call matchdelete(ring)
    redraw
endfunction
" }2
" Nohassle Paste {2
"-----------------------------------------------------------------------------------
" Code totally boosted from Tim Pope
function! s:setup_paste() abort
  let s:paste = &paste
  set paste
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>
nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END
" }2
" CamelCaseMotion {2
"-----------------------------------------------------------------------------------
map <silent> W <Plug>CamelCaseMotion_w
map <silent> E <Plug>CamelCaseMotion_e
map <silent> B <Plug>CamelCaseMotion_b
omap <silent> iW <Plug>CamelCaseMotion_iw
xmap <silent> iW <Plug>CamelCaseMotion_iw
omap <silent> iE <Plug>CamelCaseMotion_ie
xmap <silent> iE <Plug>CamelCaseMotion_ie
omap <silent> iB <Plug>CamelCaseMotion_ib
xmap <silent> iB <Plug>CamelCaseMotion_ib
" }2
" Increment a column of number {2
"-----------------------------------------------------------------------------------
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction

vnoremap <C-a> :call Incr()<CR>
" }2
" DeleteBuffer {2
"-----------------------------------------------------------------------------------
" Custom function to delete buffers from within Ctrl-P
function! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunction
" }2
" Toggle checkboxs {2
"-----------------------------------------------------------------------------------
function! ToggleTodoCheckbox()
        let line = getline('.')
        if(match(line, "\\[ \\]") != -1)
          let line = substitute(line, "\\[ \\]", "[√]", "")
          let line = substitute(line, "$", " @done (" . strftime("%d/%m/%y %H:%M") . ")", "")
        elseif(match(line, "\\[√\\]") != -1)
          let line = substitute(line, "\\[√\\]", "[ ]", "")
          let line = substitute(line, " @done.*$", "", "")
        endif
        call setline('.', line)
endfunction
" }2
" Toggle Quickfix {2
"-----------------------------------------------------------------------------------
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }2
" Format JSON {2
"-----------------------------------------------------------------------------------
function! FormatJSON()
    :'<,'>!python -m json.tool
endfunction
command! -range FormatJSON call FormatJSON()
" }2
" }1

" Key Bindings For The Others (Everyone who is not Jarrod) AT IMT {1
"===================================================================================
let mapleader=","
nnoremap <Leader>ff :CtrlP<CR>
noremap <Leader>sp :set spell spelllang=en_us<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
map <Leader>a :Ack!<space>
map <Leader>d :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
map <Leader>ta :DjangoTestApp<CR>
map <Leader>tf :DjangoTestFile<CR>
map <Leader>tc :DjangoTestClass<CR>
map <Leader>tm :DjangoTestMethod<CR>
map<Leader>nf :NosetestFile<CR>
map<Leader>nc :NosetestClass<CR>
map<Leader>nm :NosetestMethod<CR>
nnoremap<Leader>ta :RerunLastTests<CR>
map <Leader>fs :CtrlPTag<CR>
map <Leader>fd :CtrlPCurFile<CR>
map <Leader>fb :CtrlPBuffer<CR>
nmap <Leader><Leader> <c-^>
map <Leader>q :!grunt test<CR>
nnoremap <Leader>ed <C-w><C-v><C-l>:e $MYVIMRC<CR>
let g:EasyMotion_leader_key = '<Leader>l'
map <Leader>rf :call RenameFile()<CR>
map <Leader>cf :call CopyFile()<CR>
nnoremap <Leader>ri :call RenewTagsFile()<CR>
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap<Leader>tn :set relativenumber!<CR>
nmap<Leader>s ysiw
nnoremap<Leader>u :GundoToggle<CR>
" --- Emacs keys in insert mode
" May the programming gods forgive me for these four lines
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>l
imap <C-b> <C-o>h
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

function! TestVector()
    let g:test_commad = '!python src/manage.py test test ' . expand('%:p')
    exe g:test_commad
endfunction
nmap<Leader>tv :call TestVector()<CR>

function! RetestVector()
    exe g:test_commad
endfunction
nmap<Leader>rv :call RetestVector()<CR>

nmap <Leader>tm :call InvokeTestMethodByType()<CR>
function! InvokeTestMethodByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestMethod'
    else
        exe ':RunSingleQunitTest'
    endif
endfunction

nmap <Leader>tc :call InvokeTestClassByType()<CR>
function! InvokeTestClassByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestClass'
    else
        exe ':RunSingleQunitModule'
    endif
endfunction

nmap <Leader>tf :call InvokeTestFileByType()<CR>
function! InvokeTestFileByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestFile'
    else
        exe ':RunAllQunitTests'
    endif
endfunction


" }1

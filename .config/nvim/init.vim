scriptencoding utf-8

" Explicitly state paths for Pyenv
let g:python_host_prog = '/home/asleap/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/asleap/.pyenv/versions/neovim3/bin/python'

" Setup dein
if (!isdirectory(expand("$HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/bundle/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    call dein#add(s:plugin_dir . '/Shougo/dein.vim')

    " Appearance, UI
    call dein#add('morhetz/gruvbox')
    call dein#add('mhinz/vim-startify')
    call dein#add('vim-airline/vim-airline')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('Yggdroot/indentLine')
    call dein#add('dominikduda/vim_current_word')

    " Editing
    call dein#add('matze/vim-move')
    call dein#add('vim-scripts/DoxygenToolkit.vim')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('majutsushi/tagbar')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('mbbill/undotree')
    call dein#add('wellle/targets.vim')
    call dein#add('rhysd/clever-f.vim')
    call dein#add('eugen0329/vim-esearch')
    call dein#add('christoomey/vim-tmux-navigator')

    " Autocomplition, snippets, linting, formatting
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('honza/vim-snippets')
    call dein#add('w0rp/ale')
    call dein#add('sbdchd/neoformat')

    " Python
    call dein#add('zchee/deoplete-jedi')
    call dein#add('davidhalter/jedi-vim')
    call dein#add('Vimjas/vim-python-pep8-indent')

    " Go
    call dein#add('zchee/deoplete-go', {'build': 'make'})

    " JavaScript
    call dein#add('othree/yajs.vim')
    call dein#add('carlitux/deoplete-ternjs')
    " call dein#add('ternjs/tern_for_vim')

    " TypeScript
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('mhartington/nvim-typescript')

    " Json
    call dein#add('elzr/vim-json')

    " Markdown
    call dein#add('rhysd/vim-gfm-syntax')

    " Fish shell
    call dein#add('aliva/vim-fish')

    " Jinja
    call dein#add('Glench/Vim-Jinja2-Syntax')

    " File management
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('cocopon/vaffle.vim')

    " Git
    call dein#add('tpope/vim-fugitive')
    call dein#add('jreybert/vimagit')

    if dein#check_install()
        call dein#install()
        let pluginsExist=1
    endif

    call dein#end()
    call dein#save_state()
endif


" Settings
" Timeout settings
set timeoutlen=300
set ttimeoutlen=50


" Map leader keys
let maplocalleader=','
let mapleader=' '
let g:mapleader=' '


" Repeat default nvim settings
syntax on
filetype plugin indent on
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=.,~/.local/share/nvim/backup
set belloff=all
set complete-=i
set directory=~/.local/share/nvim/swap
set display+=lastline
set formatoptions=tcqj
set history=1000
set hlsearch
set incsearch
set langnoremap
set nolangremap
set laststatus=2
set listchars="tab:> ,trail:-,nbsp:+"
set nocompatible
set nrformats=bin,hex
set ruler
set sessionoptions-=options
set showcmd
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set undodir=~/.local/share/nvim/undo
set viminfo+=!
set wildmenu


" Set mouse
set mouse=a
set mousehide


" Text settings
set fileencoding=utf-8              " UTF-8 on write
set expandtab                       " Use spaces instead of tabs
set tabstop=4                       " Show tabs as 4 spaces
set softtabstop=4                   " Tab key indents by 4 spaces
set shiftwidth=4                    " >> indents by 4 spaces
set shiftround                      " >> indents to the next multiple of shiftwidth


" Set listchars
set list
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:→ ,eol:↵,trail:~,extends:↷,precedes:↶,nbsp:±'
else
    let &listchars = 'tab:> ,eol:¬,trail:~,extends:>,precedes:<,nbsp:.'
endif


" Scroll settings
if !&scrolloff
    set scrolloff=6                 " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=6             " Show next 5 columns while side-scrolling.
endif


" Undo, backup, swap
set undofile
set nobackup
set swapfile


" Command line
set wildmenu
set wildmode=list:full
set wildignore+=*~,*.o,core.*,*.exe,.git/,.hg/,.svn/,.DS_Store,*.pyc
set wildignore+=*.swp,*.swo,*.class,*.tags,tags,tags-*,cscope.*,*.taghl
set wildignore+=.ropeproject/,__pycache__/,venv/,*.min.*,images/,img/,fonts/
set wildignorecase


" Fold options
set foldenable                      " Enable folds
set foldmethod=syntax               " Fold via syntax of files
set foldlevelstart=99               " Open all folds by default


" Other options
set completeopt=menu,longest        " Set completion menu
set cursorline                      " Highlight current line
set formatoptions+=o                " Continue comment markers in new line
set gdefault                        " Set global flag for search and replace
set hidden                          " Hide buffers in background
set ignorecase                      " Case insensitive search
set inccommand=nosplit              " Show effects of the command incrementally
set lazyredraw                      " Do not redraw on registers and macros
set linebreak                       " Write lines at convenient points
set modeline                        " Enable modeline
set nojoinspaces                    " Prevent inserting 2 spaces on a join (J)
set nostartofline                   " Jump to first non-blank character
set number                          " Line numbers
set numberwidth=1                   " Minimal line number width
set relativenumber                  " Relative numbering
set report=0                        " Always report changed lines
set showfulltag                     " Show tag and info in insert-mode completion
set showmatch                       " Highlight matched bracket
"set showmode                        " Show current mode
set showtabline=2                   " Always show tabline
set smartcase                       " Smart case search if there is upper
set spell                           " Enable spell check
set splitbelow                      " Split below current window
set splitright                      " Split right of the current window
set synmaxcol=128                   " Highlight columns (default 3000, 0 - no limit)
set textwidth=0                     " Hard-wrap long lines as you type them
set title                           " Set terminal's title
set whichwrap+=<,>,h,l              " Allow backspace and cursor keys to cross line boundaries
set wrap                            " Enable word wrap
set wrapscan                        " Searches wrap around end of file


" Plugin configuration (:help <PluginName>)
" Gruvbox
set termguicolors
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_impoved_strings=1
let g:gruvbox_improved_warnings=1
set background=dark
colorscheme gruvbox
set noshowmode

" netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = -30
let g:netrw_list_hide = &wildignore
let g:netrw_sort_sequence = '[\/]$,*'

" airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }
let g:airline#extensions#default#layout = [
    \ [ 'a', 'error', 'warning', 'b', 'c' ],
    \ [ 'x', 'y', 'z' ]
    \ ]

" Webdevicons
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"
if exists('*WebDevIconsGetFileTypeSymbol')
    let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
    let entry_format .= '. entry_path'
endif

" Startify
let g:startify_session_dir = '~/.local/share/nvim/sessions'
let g:startify_bookmarks = ['~', '~/Desktop']
let g:startify_change_to_vcs_root = 1

" indentLine
let g:indentLine_char='│'

" vim_current_word
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
" hi CurrentWord ctermfg=XXX ctermbg=XXX cterm=underline,bold,italic
highlight CurrentWord gui=underline cterm=underline
highlight CurrentWordTwins gui=underline cterm=underline

" AutoPairs
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsShortcutJump = ""
let g:AutoPairsShortcutBackInsert = ""
let g:AutoPairsFlyMode = 0

" DoxygenToolkit
" :DoxLic - licence stub
" :DoxAuthor - author stub
" :Dox - class/function stub
" :DoxBlock - block stub
" :DoxUndoc(DEBUG) - undoc

" NERDCommenter
let g:NERDSpaceDelims = 1
nmap <Leader>\ <Plug>NERDCommenterToggle
vmap <Leader>\ <Plug>NERDCommenterToggle

" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" FZF
let $LANG = 'en_US'
" Customize fzf colors to match your color scheme
let g:fzf_colors = {
        \ 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Function'],
        \ 'fg+':     ['fg', 'String', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'Statusline', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Type'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Error'],
        \ 'marker':  ['fg', 'String'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'],
        \ }

" esearch
let g:esearch#out#win#open = 'enew'
if !exists('g:esearch')
    let g:esearch = {}
endif
let g:esearch.backend = 'nvim'
" let g:esearch.out = 'qflist'
let g:esearch.use = []
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<Leader>es', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<Leader>ew', 'esearch-word-under-cursor')

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 80 " -1
let g:deoplete#max_menu_width = 40 " -1
let g:deoplete#auto_complete_delay = 100
let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['around', 'member', 'tag']
let g:deoplete#sources._ = []
let g:deoplete#sources.vim = ['vim', 'tag', 'neosnippet']
let g:deoplete#sources.python = ['jedi', 'tag', 'neosnippet']
let g:deoplete#sources.go = ['go', 'tag', 'neosnippet']
let g:deoplete#sources.javascript = ['tern', 'tag', 'neosnippet']
let g:deoplete#sources.typescript = ['typescript', 'tag', 'neosnippet']
" let g:deoplete#file#enable_buffer_path = 1
" call deoplete#custom#set('_', 'matchers', ['matcher_head'])
" call deoplete#custom#set('_', 'sorters', ['sorter_rank'])
" call deoplete#custom#set('_', 'converters', [
            " \ 'converter_remove_overlap',
            " \ 'converter_truncate_abbr',
            " \ 'converter_truncate_menu',
            " \ 'converter_auto_delimeter',
            " \ 'converter_auto_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

" deoplete-jedi
let g:deoplete#sources#jedi#server_timeout = 20 " 10
let g:deoplete#sources#jedi#enable_cache = 1 " 0

" jedi-vim
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tag_stack = 1
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#auto_close_doc = 1

" deoplete-go
let g:deoplete#sources#go#pointer = 1

" deoplete-ternjs
let g:deoplete#sources#ternjs#types = 1

" tern (requires global node installation, not nvm)
" let g:tern_map_keys = 0
" let g:tern_show_argument_hints = 'on_move'
" let g:tern_show_signature_in_pum = 0
" let g:tern_show_loc_after_rename = 1

" echodoc
let g:echodoc#enable_at_startup = 1

" neosnippet
imap <C-s> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#enable_snipmate_compatibility = 1

" ale
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 0
let g:airline#extensions#ale#error_symbol = '•'
let g:airline#extensions#ale#warning_symbol = '•'
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tslint']
    \ }
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
let g:ale_set_quickfix = 1
let g:ale_enabled = 0

" neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['autopep8', 'isort']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
nnoremap <Localleader>f :Neoformat<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
" let g:clever_f_timeout_ms = 1500
let g:clever_f_show_prompt = 1


" Autocmds
augroup MyNvimBasic
    autocmd!
    " Speed up Syntax Highlighting
    " :syntime on to start profile, :syntime report then
    autocmd BufEnter * :syntax sync minlines=128
    autocmd BufEnter * :syntax sync maxlines=256
    " Go back to previous position of cursor
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe 'normal! g`"zvzz' |
        \ endif
    " No syntax for big files
    autocmd BufReadPre *
        \ if getfsize(expand("%")) > 10000000 |
        \   syntax off |
        \ endif
    " Close quickfix and locationlist windows
    function! MyLastWindow()
        if &buftype ==# 'quickfix' || &buftype ==# 'locationlist'
            if winbufnr(2) == -1
                quit!
            endif
        endif
    endfunction
    autocmd BufEnter * call MyLastWindow()
augroup END

augroup MyPythonAutocmds
    autocmd!
    autocmd FileType python setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        " \ textwidth=79
        \ expandtab
        \ autoindent
        \ fileformat=unix
    " Use ':Pyimport <import name>' to check out import
    autocmd FileType python nnoremap <buffer> <Localleader>g :call jedi#goto()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>a :call jedi#goto_assignments()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>d :call jedi#show_documentation()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>r :call jedi#rename()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>u :call jedi#usages()<CR>
    autocmd FileType python nnoremap <buffer> <Localleader>v2 :call jedi#force_py_version(2)
    autocmd FileType python nnoremap <buffer> <Localleader>v3 :call jedi#force_py_version(3)
augroup END

augroup MyJavaScriptAutocmds
    autocmd!
    autocmd FileType javascript setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        " \ textwidth=79
        \ expandtab
        \ autoindent
        \ fileformat=unix
    " autocmd FileType javascript nnoremap <buffer> <Localleader>d :TernDoc<CR>
    " autocmd FileType javascript nnoremap <buffer> <Localleader>t :TernType<CR>
    " autocmd FileType javascript nnoremap <buffer> <Localleader>g :TernDef<CR>
    " autocmd FileType javascript nnoremap <buffer> <Localleader>a :TernRefs<CR>
    " autocmd FileType javascript nnoremap <buffer> <Localleader>r :TernRename<CR>
augroup END

augroup MyTypeScriptAutocmds
    autocmd!
    autocmd FileType typescript setlocal
        \ foldmethod=indent
        \ tabstop=4
        \ shiftwidth=4
        \ softtabstop=4
        " \ textwidth=79
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType typescript nnoremap <buffer> <Localleader>g :TSTypeDef<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>a :TSDef<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>d :TSDoc<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>r :TSRename<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>u :TSRefs<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>t :TSType<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>i :TSImport<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cs :TSStart<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cc :TSStop<CR>
    autocmd FileType typescript nnoremap <buffer> <Localleader>cr :TSRestart<CR>
augroup END

augroup MyTextFileAutocmds
    autocmd!
    autocmd FileType yaml setlocal
        \ foldmethod=indent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ autoindent
        \ fileformat=unix
    autocmd FileType json setlocal
        \ foldmethod=indent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ autoindent
        \ fileformat=unix
augroup END


" Functions and commands
function! ExecuteCommand(command)
    let _s = @/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/ = _s
    call cursor(l, c)
endfunction
command! -nargs=0 StripTrailingWhitespace call ExecuteCommand("%s/\\s\\+$//e")

command! -nargs=0 CopyFilename let @+ = expand("%")

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
        let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

function! ToggleColorColumn()
    if &colorcolumn
        setlocal colorcolumn=
    else
        setlocal colorcolumn=80
    endif
endfunction
command! -nargs=0 ToggleColorColumn call ToggleColorColumn()


" Mappings

" Normal mode
" Disable Ex mode
nnoremap Q <Nop>
" Disable macros recording
nnoremap q <Nop>
" Remap ; to :
nnoremap ; :
" Navigate
noremap k gk
noremap j gj
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" tmux-navigator
if &term == 'screen-256color' || &term == 'tmux-256color'
    let g:tmux_navigator_no_mappings = 1
    let g:tmux_navigator_save_on_switch = 2
    nnoremap <C-h> :TmuxNavigateLeft<cr>
    nnoremap <C-j> :TmuxNavigateDown<cr>
    nnoremap <C-k> :TmuxNavigateUp<cr>
    nnoremap <C-l> :TmuxNavigateRight<cr>
endif
" Folds
nnoremap zr zr:echo &foldlevel<CR>
nnoremap zm zm:echo &foldlevel<CR>
nnoremap zR zR:echo &foldlevel<CR>
nnoremap zM zM:echo &foldlevel<CR>
nnoremap za za:echo &foldlevel<CR>
" Clear search results
nnoremap <Esc> :nohlsearch<CR>
nnoremap / /\v
nnoremap ? ?\v
noremap Y y$
" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" Redo
nnoremap U <C-r>

" Visual mode
vnoremap / /\v
vnoremap ? ?\v
" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Insert mode bindings
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
inoremap <M-p> <C-Left>
inoremap <M-n> <C-Right>
" Escape insert, delete line, return to insert
inoremap <C-d> <Esc>ddi
" Escape insert, create new line, edit it
inoremap <C-o> <Esc>o
" Go to end of the line
inoremap <C-e> <Esc>A
" Smash escape
inoremap jk <Esc>
" Navigate in popup
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <BS>    deoplete#smart_close_popup() . "\<C-h>"

" Terminal normal mode
tnoremap <Esc> <C-\><C-n><Esc><CR>

" Space-like bindings
" Toggle
nnoremap <Leader>tw :set list!<CR>
nnoremap <Leader>tn :call ToggleNumber()<CR>
" Spellcheck: [s, ]s - previous and next error
nnoremap <Leader>ts :setlocal spell! spelllang=en_us<CR>
nnoremap <Leader>tk :terminal<CR>
nnoremap <Leader>ti :IndentLinesToggle<CR>
nnoremap <Leader>td :call deoplete#toggle()<CR>
nnoremap <Leader>th :VimCurrentWordToggle<CR>
nnoremap <Leader>tc :set cursorline!<CR>
nnoremap <Leader>tl :ToggleColorColumn<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <leader>tu :UndotreeToggle<CR>

" Edit
nnoremap <Leader>ed :StripTrailingWhitespace<CR>
" Search and replace
nnoremap <Leader>er :%s//g<Left><Left>
" Search project-wide
" :copen - show all found
" :close - close found
" :cn, :cp - next, previous
" Registers
" :reg [reg-name] - show register content
" Undo all
nnoremap <Leader>eu :edit!<CR>

" File
nnoremap <Leader>f :Files<CR>
" Sudo save
" nnoremap <Leader>F :update !sudo tee % >/dev/null<CR>
nnoremap <Leader>F :w !sudo tee %<CR>
" nnoremap <Leader>m :Vexplore<CR>
nnoremap <Leader>m :Vaffle<CR>
nnoremap <Leader>h :Vaffle %:p:h<CR>

" Buffer
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

" Window
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>q :close<CR>
" :vnew<CR> - new vertical split
" <C-w>r/R - rotate
" <C-w>o - maximize window
" <C-w>c - close window
" <C-w>_,|,+,-,=,<,> - resize
nnoremap <Leader>w :Windows<CR>
" Tab
nnoremap <Leader>we :tabe<CR>
nnoremap <leader>wn :tabn<CR>
nnoremap <Leader>wp :tabp<CR>

" Lint (ale)
nnoremap <Leader>ll :ALELint<CR>
nnoremap <Leader>lp :ALEPreviousWrap<CR>
nnoremap <Leader>ln :ALENextWrap<CR>
nnoremap <Leader>lt :ALEToggle<CR>
nnoremap <Leader>ld :ALEDetail<CR>

" Git
nnoremap <Leader>gm :Magit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gg :Ggrep<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gr :Gmerge<CR>

" Search maps with fzf
nmap <Leader>? <Plug>(fzf-maps-n)


" Initial settings
set nolist
set nospell
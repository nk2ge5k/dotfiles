""""""""""""""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

""""""""""""""""""""""""""""""""""" GENERAL """"""""""""""""""""""""""""""""""""

let mapleader=","
set nocompatible

set background=dark " dark background

function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

filetype plugin indent on   " autodetect file type
syntax on                   " syntax highlighting
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set virtualedit=onemore  " allow to move one character after end of line

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

set mouse=""             " disable mouse
set noswapfile           " disable swap files
set autochdir            " auto change current directory to file directory
set hidden               " Allow buffer switching without saving
set history=1000

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

"""""""""""""""""""""""""""""""""" APPERENCE """""""""""""""""""""""""""""""""""

let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

color nord                      " Load a colorscheme
" color default

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set termguicolors

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
" highlight ColorColumn guibg=LightGray
" highlight Comment guifg=#ffffff

set laststatus=2                " always display statusline
set statusline=%<%n\ %F\ %m\ %r\ %y\ 0x%B,%b%=%l:%c\ %P

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set colorcolumn=81              " higlight column 81
set list!
set listchars=tab:·\ ,trail:.   " Highlight problematic whitespace
set fillchars+=vert:\ 
" set spell spelllang=en_us,ru

"""""""""""""""""""""""""""""""""" FORMATTING """"""""""""""""""""""""""""""""""

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set smartindent                 " TODO: disable?

""""""""""""""""""""""""""""""""" KEY MAPPING """"""""""""""""""""""""""""""""""

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap j gj
nmap k gk

nnoremap <S-y> :NERDTreeToggle<CR>

""""""""""""""" NERDTree """"""""""""""" 

let NERDTreeAutoDeleteBuffer = 1

"""""""""""" NERDCommenter """""""""""" 

let g:NERDSpaceDelims = 1

"""""""""""""""" vim-go """"""""""""""""

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
" let g:go_metalinter_command = "golangci-lint"
let g:go_addtags_transform = "camelcase"
let g:go_doc_command = ["godoc", "-all", "-ex"]
let g:go_fmt_command = "goimports"


""""""""""""""" rainbow """"""""""""""""

let g:rainbow_active = 0

""""""""""""""" ack.vim """"""""""""""""

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""" undotree """""""""""""""

if has('persistent_undo')
    set undodir=$HOME/.undodir/
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif


""""""""""""""""" ctrlp """"""""""""""""

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
let g:ctrlp_root_markers = ['.git', '.svn', 'go.mod', 'project.yml']
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }

"""""""""""""""" tagbar  """""""""""""""

let g:tagbar_ctags_bin = '/usr/local/opt/ctags/bin/ctags'

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

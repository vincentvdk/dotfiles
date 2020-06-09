" .vimrc
" Vincent Van der Kussen vim config
"

" -- Vundle configuration --------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' 

" -- Linting
"Plugin 'w0rp/ale'
Plugin 'nlknguyen/cloudformation-syntax.vim'

" -- Status line 
"Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'

" -- Gutter
Plugin 'airblade/vim-gitgutter'

" -- Files and fuzzy finder
Plugin 'junegunn/fzf.vim'

" -- Better Python identation
Plugin 'vim-scripts/indentpython.vim'

" Pairing quotes, brackets, ..
"Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

" -- Autocompletion
"Plugin 'Valloric/YouCompleteMe'
" deps
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
" python deps
Plugin 'davidhalter/jedi-vim'

" -- Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'

" -- Colors
Plugin 'chriskempson/base16-vim'

" -- Golang
"Plugin 'fatih/vim-go.git'

" -- Markdown
Plugin 'iamcco/markdown-preview.vim'

" -- Terraform
Plugin 'hashivim/vim-terraform'

" -- Icons (needs nerd icons)
Plugin 'ryanoasis/vim-devicons'

"-- Git
Plugin 'tpope/vim-fugitive'

"-- CoC
Plugin 'neoclide/coc.nvim'

"-- Buffers in Tabline
Plugin 'ap/vim-bufftabline'

call vundle#end()

" -- testing stuff
" ----------------
set path+=**


" -----------------------------------------------------------------------------
" Remapping and shortcuts
" -----------------------------------------------------------------------------
" Remap colon key
nnoremap ; :
nnoremap : ;

" vim.numbers
nnoremap <F4> :NumbersOnOff<CR>

" Change leader key
let mapleader = ","

" jk | escaping
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" <leader>n | NERD Tree
nnoremap <leader>n :NERDTreeToggle<cr>

" New line in insert mode | Shift-Enter -> o
imap <S-Enter> <Esc>o

" Leader-n is used for NERDtree toggle
let g:jedi#usages_command = ""

"Fuzzy Finder (fzf)
nnoremap <C-p> :Files<cr>

"unhighlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala       let b:comment_leader = '// '
autocmd FileType sh,ruby,python,yaml    let b:comment_leader = '# '
autocmd FileType conf,fstab             let b:comment_leader = '# '
autocmd FileType vim                    let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" -----------------------------------------------------------------------------
"  Buffers
" -----------------------------------------------------------------------------
nnoremap <leader>T :enew<cr>
" Move to the next buffer
nnoremap <leader>bn :bnext<CR>
" Move to the previous buffer
nnoremap <leader>bb :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>


" -----------------------------------------------------------------------------
" Basic configuration
" -----------------------------------------------------------------------------
set encoding=utf-8
set modelines=1
set hidden
set ttyfast
set title
set showcmd
syntax enable
filetype plugin indent on

"set autoread when a file changes
set autoread

"set command line height
set cmdheight=2

"dont use swap files. I just delete them anyway
set noswapfile

"show rules
set ruler
" avoid scrolling problems "
set lazyredraw 
"set ttyfast
set nocursorline

" line numbers
set number 
set relativenumber
set nuw=3

"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" indentation
set autoindent
set smartindent

"list hidden characters
"set list
"set listchars=tab:▸\
"eol:¬
set ai
set si
" indent on newline
"imap <C-Return> <CR><CR><C-o>k<Tab>

"set line highlight
set wrap
set cursorline      " highlight current line
set textwidth=80

" configure backspace
set backspace=2
set backspace=indent,eol,start

"wrap lines
set wrap
set formatoptions+=l
set linebreak
set nolist
set wrapmargin=0

" Colors
let base16colorspace=256
set background=dark
colorscheme base16-default-dark
set hlsearch
highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
highlight ALEWarning ctermfg=White ctermbg=DarkMagenta
highlight ALEErrorLine ctermfg=White ctermbg=NONE
highlight ALEError ctermfg=White ctermbg=NONE

""""""""""""""""""""""""""""
"   PLUGIN CONFIGURATION   "
""""""""""""""""""""""""""""

"-------------------------------------------------------
" Fuzzy finder (fzf)
"-------------------------------------------------------
set rtp+=~/.fzf

" search for previous typed lines
imap <c-x><c-l> <plug>(fzf-complete-line)
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" remaps
nnoremap <leader>p :FZF<cr>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>B :Buffers<CR>
nmap <Leader>C :Commits<CR>

"---------------------------------------------------------
" Status line
"---------------------------------------------------------
function! ActiveStatus()
    let statusline=""
    let statusline.="%#StatuslineFilename#"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="%#StatuslineChar#"
    let statusline.=""
    let statusline.="%#StatuslineGeneral#"
    let statusline.="%*"
    let statusline.="%#User1#"
    let statusline.="\ %2f\%m"
    let statusline.="%#StatuslineGeneral#"
    let statusline.="%="
    let statusline.=""
    let statusline.="%#StatuslineFiletype#"
    let statusline.="%{strlen(&fenc)?&fenc:&enc}"
    let statusline.="%y\ "
    let statusline.=" " 
    let statusline.="\ %p%%\ "
    let statusline.="%([%l:%c]%)%L\ "
    return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
  let statusline.="\ %<"
  let statusline.="%f"
  let statusline.="%{&modified?'\ \ +':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="\ \ "
  let statusline.="\ %2v"
  return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()

hi User1 ctermfg=15 ctermbg=18
hi StatuslineFilename   ctermfg=18 ctermbg=21
hi StatuslineChar       ctermfg=21 ctermbg=18
hi StatuslineGeneral    ctermfg=20 ctermbg=18
hi StatuslineFiletype   ctermfg=18 ctermbg=20

augroup status
    autocmd!
    autocmd WinEnter * setlocal statusline=%!ActiveStatus()
    autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END


" ------------------------------------------------------------------------------
"  Vim tabs colors
" ------------------------------------------------------------------------------
hi TabLineFill ctermfg=20 ctermbg=18
hi TabLine ctermfg=20 ctermbg=18
hi TabLineSel ctermfg=18 ctermbg=21

" ------------------------------------------------------------------------------
" Git Gutter
" ------------------------------------------------------------------------------
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
" ---------------------------------------------------------
highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

"" -----------------------------------------------------------------------------
"" NERDTree setting
"" -----------------------------------------------------------------------------
"" autostart NERDTree unless for git commit messages
"autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
"" put cursor in opened file instead of NERDTree pane
"autocmd VimEnter * wincmd p
"" Close all open buffers on entering a window if the only
"" buffer that's left is the NERDTree buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" Hide these file types
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
"" Disable linenumbers in NERDTree buffer
""let NERDTreeShowLineNumbers=0
""autocmd FileType nerdtree set norelativenumber
"autocmd BufEnter NERD_* setlocal nonumber
"autocmd BufEnter NERD_* setlocal norelativenumber
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
""let g:NERDTreeStatusline = '%#NonText#'
""let g:NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"
""NerdTree git plguin config
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Unknown"   : "?"
"    \ }


" -----------------------------------------------------------------------------
" netrw
" -----------------------------------------------------------------------------
" absolute width of netrw window
let g:netrw_winsize = -28
" " tree-view
let g:netrw_liststyle = 3
"" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" open file in a new previous window.
let g:netrw_browse_split = 4
" disable banner
let g:netrw_banner = 0
" toggle netrw
nnoremap <leader>n :Lexplore<cr>


" -----------------------------------------------------------------------------
" ALE Linting
" -----------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 1

"let g:ale_linter_aliases = {'yaml': ['cloudformation', 'yaml']}
highlight ALEWarning ctermbg=DarkMagenta
highlight ALEError ctermfg=Magenta
let g:ale_linters = { 
            \ 'python': ['flake8'],
            \}
let g:ale_python_pycodestyle_options = '--ignore=C0111 --ignore=C0103 --max-line-length=100'
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_executable = 'pipenv'
let g:ale_python_pylint_change_directory = 0
let g:ale_python_pylint_options = '--disable=C0111'
let g:ale_python_flake8_options = '--ignore=F841' 

"" -----------------------------------------------------------------------------
"" deoplete configuration. <Switched to CoC>
"" -----------------------------------------------------------------------------
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#auto_complete_delay = 100
"
"" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
"" Python
"let g:jedi#auto_initialization = 1
"" Disabled for deoplete
"let g:jedi#completions_enabled = 0
"
"" Go
"let g:go_highlight_types = 1
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'


" deoplete language configuration
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
" -----------------------------------------------------------------------------

" Copy Pasting stuff
"enable pasting mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Copy to xclipboard
"set clipboard=unnamedplus
set clipboard+=unnamedplus

set wildmenu            " visual autocomplete for command menu "
set showmatch           " highlight matching [{()}]"



" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"" -----------------------------------------------------------------------------
""  YouCompleteMe <Switched to CoC>
""  ----------------------------------------------------------------------------
"" Point YCM to the Pipenv created virtualenv, if possible
"" At first, get the output of 'pipenv --venv' command.
"let pipenv_venv_path = system('pipenv --venv')
"" The above system() call produces a non zero exit code whenever
"" a proper virtual environment has not been found.
"" So, second, we only point YCM to the virtual environment when
"" the call to 'pipenv --venv' was successful.
"" Remember, that 'pipenv --venv' only points to the root directory
"" of the virtual environment, so we have to append a full path to
"" the python executable.
"if shell_error == 0
"  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
"  let g:ycm_python_binary_path = venv_path . '/bin/python'
"else
"  let g:ycm_python_binary_path = 'python'
"endif
"let g:ycm_autoclose_preview_window_after_completion=1


" -----------------------------------------------------------------------------
" CoC
" -----------------------------------------------------------------------------
let g:coc_node_path = '/home/vincent/.nvm/versions/node/v10.20.0/bin/node'
set updatetime=300
"Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [ 'coc-emoji', 'coc-prettier', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml']
let g:go_def_mapping_enabled = 0

highlight CocErrorHighlight ctermfg=white ctermbg=red  cterm=underline guifg=#ff0000
highlight CocWarningHighlight ctermfg=Red  guifg=#ff0000
highlight CocInfoHighlight ctermfg=Red  guifg=#ff0000
highlight CocHintHighlight ctermfg=Red  guifg=#ff0000

" -----------------------------------------------------------------------------
" Markdown Preview
" -----------------------------------------------------------------------------
let g:mkdp_path_to_chrome = "/usr/bin/chromium"
let g:mkdp_auto_close = 0


" -----------------------------------------------------------------------------
" Snippet configuration 
" -----------------------------------------------------------------------------
" https://developpaper.com/vim-code-snippet-plug-in-ultisnips-usage-tutorial/
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" -----------------------------------------------------------------------------
" Language specific configuration
" -----------------------------------------------------------------------------

" -- Python
"  highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/
" Wrap text
au BufRead,BufNewFile *.py set textwidth=100
" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" Full syntax highlighting:
let python_highlight_all=1

highlight pythonInclude         cterm=bold gui=bold
highlight pythonSelf            cterm=bold gui=bold
highlight pythonBuiltinFunc     cterm=bold gui=bold
highlight pythonException       cterm=bold gui=bold

highlight pythonBrackets        ctermfg=183 guifg=#d7afff
highlight MatchParen            cterm=bold ctermfg=cyan

au BufNewFile,BufRead *.py set foldmethod=indent


" -- Support Deoplete/neovim in pipenv
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" -- JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


" -- Yaml 
" au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim
autocmd FileType yaml set sw=2
autocmd FileType yaml set ts=2
autocmd FileType yaml set sts=2
autocmd FileType yaml set expandtab
"autocmd FileType yaml setl indentkeys-=<:>
autocmd FileType yaml setl indentexpr=GetYamlIndent()

function! GetYamlIndent()
  let lnum = v:lnum - 1
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let indent = indent(lnum)
  let increase = indent + &sw
  if line =~ ':$'
    return increase
  else
    return indent
  endif
endfunction

" -----------------------------------------------------------------------------
" File Automation
" -----------------------------------------------------------------------------
" Initialize default in new file and turn to endline
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "")
    endif
endfunction
autocmd BufNewFile * normal G


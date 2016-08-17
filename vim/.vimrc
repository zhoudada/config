set nocompatible

if has('win64')||has('win32')
    set shell=C:\WINDOWS\system32\cmd.exe
    set shellslash
else
    "shouldn't need any config
endif

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ===VUNDLE===
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'YankRing.vim'
Plugin 'fugitive.vim'
Bundle 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/matchit.zip'
Plugin 'terryma/vim-expand-region'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'iamcco/markdown-preview.vim'
Bundle 'kannokanno/previm'
Bundle 'tyru/open-browser.vim'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'chriskempson/base16-vim'

call vundle#end()            " required
" ===END of VUNDLE===

filetype plugin indent on    " required

syntax enable
set background=dark
if has('win64')||has('win32')
    if has('gui_running')
        set guifont=Consolas:h10
        set guifontwide=SimHei
        "let g:solarized_termcolors=16
        set lines=999 columns=999
        colorscheme base16-eighties
    else
        colorscheme default
    endif
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            set guifont=Monaco:h14
            let g:solarized_termcolors=16
        else
            set guifont=Monospace\ 12
        endif
    endif
    colorscheme solarized
    set t_Co=256
endif


set autoread
set relativenumber
set number
set ff=unix
set cindent
set laststatus=2
set shiftwidth=4
set sts=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set colorcolumn=80
"set cursorline
set cursorcolumn
set incsearch
set hlsearch
set nowrap
set ruler
set title
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" For switching between many opened file by using ctrl+j or ctrl+h
map <C-J> :tabprevious<CR>
map <C-K> :tabnext<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""Airline""""
let g:airline_theme = "base16"

""""""YCM""""
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {}

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"

"""""Syntastic""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height= 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_post_args = "--disable=W1234"
let g:syntastic_python_checkers = ['pylint']

"""""FORCE UltiSnip to USE PY2""""
let g:UltiSnipsUsePythonVersion = 2
"""""Snippets variables""""
let g:snips_author = 'Zhoudada'
let g:author = 'Zhoudada'

"""""NERDTree""""
nmap <Leader>nt :NERDTreeToggle<CR>

"""""NERDCommenter""""
" add a space to comment
let g:NERDSpaceDelims=1

""""YankRing""""
nnoremap <Leader>yr :YRShow<CR>

"""""Tagbar"""""
nmap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32
if has('win64')||has('win32')
    let g:tagbar_ctags_bin="C:/ctags58/ctags"
endif

"""""Indent Guide"""""
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"""""Code Folding""""
"za toggle current folding
"zM close all the folding
"zR open all the folding
set foldmethod=indent
set foldmethod=syntax
set nofoldenable

""""riv.vim"""""
if has('win64')||has('win32')
    let g:riv_web_browser="C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
endif


let g:previm_open_cmd = ''

""""Markdown Preview""""
if has('win64')||has('win32')
    let g:mkdp_path_to_chrome="C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
endif

""""Doxygen""""
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param   "
let g:DoxygenToolkit_returnTag=   "@return  "
"let g:DoxygenToolkit_blockHeader="-------------------------------"
"let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Yifei Zhang"
let g:DoxygenToolkit_licenseTag="MIT License"
nnoremap <Leader>dox :Dox<CR>

""""vim-signature""""
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "mda",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "ms",
    \ 'ListLocalMarkers'   :  "m?"
    \ }

""""Habit Breaking"""""
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

""""Remove Trailing Whitespace""""
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
if filereadable("tags.vim")
    source tags.vim
endif

""""Tab navigation""""
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 0gt
"New tab"
nnoremap <C-t> :tabnew<CR>


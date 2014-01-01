set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu!
colorscheme molokai
syntax enable
syntax on

"detect the os
let g:os = "unknown"
if has('win32')
    let g:os = "windows"
else "Assume it is UNIX with uname
    let uname = substitute(system('uname'), "\n", "", "")
    if uname == "SunOS"
        let g:os = "sun"
    elseif uname == "Linux"
        let g:os = "linux"
    elseif uname == "Darwin"
        let g:os = "osx"
    endif 
endif

"启动gVIM时最大化
au GUIEnter * simalt ~x
"默认字体为Consolas，字体大小为13
"
if g:os == "windows"
    set guifont=DejaVu\ Sans\ Mono\ 11
else
    set guifont=Consolas:h13
endif

" set patch mode
set patchmode=

" set backup files
set backup
set backupext=.bak
set backupdir=./.backup

" set swap file directory
set directory=./.backup

"set tags=./tags;
"set autochdir

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let tlist_js_settings = 'javascript;s:string;a:array;o:object;f:function'

"F8: Switch on/off Tagbar
"nnoremap <silent> <F8> :TagbarToggle <CR>
"let g:tagbar_ctags_bin = 'ctags -f - --format=2 --excmd=pattern --extra= --fields=nksaSmt myfile'

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1

:set guioptions-=T

nnoremap <silent> <F12> :A<CR>
nnoremap <silent> <F3> :Grep<CR>

function s:SetMainScript()
  let s:mainfile = bufname('%')
  let g:mainfile = bufname('%')
  echo s:mainfile . ' set as the starting program.'
endfunction

set fileencodings=gb2312,gb18030,utf-8
set termencoding=utf-8
set encoding=prc 


if g:os == "windows"
    set shell=C:/Windows/System32/cmd.exe
    set shellslash
endif

"ctrlp configuration
set runtimepath ^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_max_files = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_use_caching = 1000
let g:ctrlp_max_depth = 10
let g:ctrlp_cache_dir = '~/.cache/ctrlp'

if has("gui_gtk2")
    set wildignore+=*/tmp/*,*/test/*,*.jar,*.swp
else
    set wildignore+=*\\tmp\\*,*\\test\\*,*.jar,*.swp
endif

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git)|BIN|Sdk|SDKSolutions|3rdParty|lost\+found|build|Resource|JBProjects|ASPxMSTRWeb|QE|docs|Resource_Editor|utilities|donet)$',
    \ 'file': '\v\.(log|jar|properties|doc|jpx|class|bat|pl|gif|jpg|png|jpeg)$'
    \}

"===========================end ctrlp configuration=======================
"
:iab xtime <c-r>=strftime("%Y-%m-%d %H:%M")<C-I>
:iab xuser <c-r>="User: Sparkle Lin, Email: Sparklelin(at)outlook.com"<C-I>

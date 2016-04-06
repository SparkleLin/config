set nocompatible

" load configuration for Vundle
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu!
colorscheme molokai
syntax enable
syntax on

au GUIEnter * simalt ~x
"
if has("gui_gtk2")
    set guifont=Consolas\ 11
else
    set guifont=Consolas:h13
endif

iab xtime <c-r>=strftime("%Y-%m-%d %H:%M")<C-I>

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
"set shiftwidth=4
"set expandtab

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

"set diffexpr=
if has('win32')
    set diffexpr=MyDiff() 
    function MyDiff() 
      let opt = '-a --binary ' 
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif 
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif 
      let arg1 = v:fname_in 
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif 
      let arg2 = v:fname_new 
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif 
      let arg3 = v:fname_out 
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif 
      let eq = '' 
      if $VIMRUNTIME =~ ' ' 
        if &sh =~ '\<cmd' 
          let cmd = '"' . $VIMRUNTIME . '\diff"' 
          let eq = '""' 
        else 
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"' 
        endif 
      else 
        let cmd = $VIMRUNTIME . '\diff' 
      endif 
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq 
    endfunction 
endif

function s:SetMainScript()
  let s:mainfile = bufname('%')
  let g:mainfile = bufname('%')
  echo s:mainfile . ' set as the starting program.'
endfunction

set fileencodings=gb2312,gb18030,utf-8
set termencoding=utf-8
set encoding=prc 

if has("gui_gtk2")
    set shell=c:\\cygwin\\bin\\bash
    set shellcmdflag=--login\ -c
    set shellxquote=\"
endif

"ctrlp configuration
let g:ctrlp_working_path_mode='ra'
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

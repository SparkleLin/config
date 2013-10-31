set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu!
colorscheme torte
syntax enable
syntax on

"启动gVIM时最大化
au GUIEnter * simalt ~x
"默认字体为Consolas，字体大小为13
set guifont=Consolas:h13

iab xtime <c-r>=strftime("%Y-%m-%d %H:%M")<C-I>

" forbid producing backup files
set nobackup

set tags=tags;
set autochdir

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1

:set guioptions-=T

nnoremap <silent> <F12> :A<CR>
nnoremap <silent> <F3> :Grep<CR>

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
  if &c_Co>1 syntax enable endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

function s:SetMainScript()
  let s:mainfile = bufname('%')
  let g:mainfile = bufname('%')
  echo s:mainfile . ' set as the starting program.'
endfunction

set fileencodings=gb2312,gb18030,utf-8
set termencoding=utf-8
set encoding=prc 

set shell=C:/Windows/System32/cmd.exe
set shellslash

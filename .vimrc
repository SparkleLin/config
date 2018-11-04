
" vundle configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim "载入特定目录插件
" set rtp+=$HOME/.vim/bundle/vundle/ "Windows下

" load configuration for Vundle
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif


" load custom commands
if filereadable(expand("~/.vimrc.commands"))
    source ~/.vimrc.commands
endif

" vundle configuration end


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu!
syntax enable
set background=dark
colorscheme desert

if &diff
    colorscheme solarized
endif

"set t_Co=256
"colorscheme solarized
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
set backupdir=/home/ltang/.backup

" set swap file directory
"set directory=./.backup

"set tags=./tags;
"set autochdir

filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let tlist_js_settings = 'javascript;s:string;a:array;o:object;f:function'

nnoremap <silent> <F8> :TlistToggle<CR> 

" miniBufferexploer configuration"
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplForceSyntaxEnable=1
"let g:miniBufExplorerMoreThanOne=1
"let g:bufExplorerMaxHeight=20

:set guioptions-=T

nnoremap <silent> <F12> :A<CR>

"grep configuration
nnoremap <silent> <F3> :Rgrep<CR>
let Grep_Default_Filelist = '*.cpp *.h *.py *.go *.java'
let Grep_Skip_Files = '*.bak *.swp *~'
let Grep_Skip_Dirs = 'bin .backup build test'

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

" set fileencodings=gb2312,gb18030,utf-8
" set termencoding=utf-8
" set encoding=prc 
set fileencodings=ucs-bom,utf-8-bom,utf-8,cp936,big5,gb18030,ucs
let &termencoding=substitute($LANG, "[a-zA-Z_-]*\.", "", "")

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
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

if has("gui_gtk2")
    set wildignore+=*/tmp/*,*/test/*,*.jar,*.swp
else
    set wildignore+=*\\tmp\\*,*\\test\\*,*.jar,*.swp
endif

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git)|BIN|Sdk|SDKSolutions|3rdParty|lost\+found|build|Resource|JBProjects|ASPxMSTRWeb|QE|docs|Resource_Editor|utilities|donet)$',
    \ 'file': '\v\.(log|jar|properties|doc|jpx|class|bat|pl|gif|jpg|png|jpeg)$'
    \}

"Evervim configuration
let g:evervim_devtoken='S=s168:U=136a623:E=158ce512e31:C=15176a00000:P=1cd:A=en-devtoken:V=2:H=c713bf7168a086fb181107b840384d2e'

nnoremap el   :EvervimSetup<CR>
nnoremap enl  :EvervimNotebookList<CR>
nnoremap ec   :EvervimCreateNote<CR>

"vim-markdown configuration ================================

let g:vim_markdown_folding_disabled = 1

let g:vim_markdown_toml_formatter = 1
"end of vim-markdown configuration =========================

" quick fix configuration ==================================
nmap <F6> :cn <cr>
nmap <F7> :cp <cr>
" end of quickfix configuration ============================

" copen configuration ======================================
nmap <C-O> :copen <cr>
nmap <C-C> :cclose <cr>

" nunmap <C-z>
nunmap <C-z>

" bufexplorer configuration
nnoremap <C-x><C-b> :BufExplorer<cr>
inoremap <C-x><C-b> <esc>:BufExplorer<cr>

" vim shell configuration
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction

command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)

let g:go_version_warning = 0

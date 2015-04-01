" CT's vim setting
"
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Multi-encoding settings, MUST BE IN THE BEGINNING OF .vimrc!
if has("multi_byte")
  " When 'fileencodings' starts with 'ucs-bom', don't do this manually
  "set bomb
  set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
    set encoding=chinese
    set termencoding=chinese
    if &fileencoding == ''
      set fileencoding=chinese
    endif
      set ambiwidth=double
  elseif v:lang =~ "^zh_TW"
    " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
    set encoding=taiwan
    set termencoding=taiwan
    if &fileencoding == ''
      set fileencoding=taiwan
    endif
      set ambiwidth=double
  elseif v:lang =~ "^ja_JP"
    " Japanese, on Unix euc-jp, on MS-Windows cp932
    set encoding=japan
    set termencoding=japan
    if &fileencoding == ''
      set fileencoding=japan
    endif
      set ambiwidth=double
  elseif v:lang =~ "^ko"
    " Korean on Unix euc-kr, on MS-Windows cp949
    set encoding=korea
    set termencoding=korea
    if &fileencoding == ''
      set fileencoding=korea
    endif
      set ambiwidth=double
  endif
  " Detect UTF-8 locale, and override CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
  endif
else
  echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

"""""""""""""""""""""""""""
" Vundle.vim 插件管理工具 "
"""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
" pass a path where Vundle should install plugins
if has('win32')
    set runtimepath+=$HOME\vimfiles\bundle\Vundle.vim
    call vundle#begin('$HOME\vimfiles\bundle')
  elseif has('unix')
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/.vim/bundle/')
  elseif has('mac')
endif


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"""""""""""""""""
" TODO 插件列表 "
"""""""""""""""""
" Plugins for UI.
"""""""""""""""""
" Molokai color scheme for Vim.
"Plugin 'vim-scripts/molokai'
" precision color scheme for multiple applications (terminal, vim, etc.)
" with both dark/light modes
Plugin 'altercation/solarized', {'rtp': 'vim-colors-solarized'}
" aireline , a powerline
Plugin 'bling/vim-airline'

" Plugin for CODE READING.
""""""""""""""""
" Alternate Files quickly (.c --> .h etc)
Plugin 'vim-scripts/a.vim'
" Display tags of the current file
Plugin 'vim-scripts/Tagbar'
"*Extra highlighting of typedefs, enumerations etc (based on ctags)
Plugin 'abudden/taghighlight-automirror'

" Plugin for C/C++
" """"""""""""""""
" C/C++ omni-completion with ctags database
Plugin 'vim-scripts/OmniCppComplete'

Plugin 'vim-scripts/c.vim'

" Plugins for WEB DEVELOPMENT.
""""""""""""""""
" HTML5 omnicomplete and syntax
Plugin 'othree/html5.vim'
" Vastly improved Javascript indentation and syntax
Plugin 'pangloss/vim-javascript'
"  css/less/sass/html color preview for vim
Plugin 'gorodinskiy/vim-coloresque'
" Helps editing xml (and [x]html, sgml, xslt) files
Plugin 'othree/xml.vim'
" Emmet for vim
Plugin 'mattn/emmet-vim'

" Plugin for COMMON USE.
""""""""""""""""
" Intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'
" Turns simple structured data into nice-looking tables
Plugin 'Stormherz/tablify'

""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set number          " show line number all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if &term =~ "xterm"
  if has("terminfo")
	set t_Co=16
	set t_Sf=<Esc>[3%p1%dm
	set t_Sb=<Esc>[4%p1%dm
  else
	set t_Co=16
	set t_Sf=<Esc>[3%dm
	set t_Sb=<Esc>[4%dm
  endif
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on         " syntax highlight
  set hlsearch      " search highlightin
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


" gvim启动外观设置
if has("gui_running")
  set lines=33 columns=100  " 设置窗口启动大小, 行数、宽度
  "set guioptions-=m        " 不显示菜单栏Menu
  set guioptions-=T         " 不显示工具栏Toolbar
endif


" 字体与主题
if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 11,Fixed\ 11
	set guifontwide=WenQuanYi\ Zen\ Hei\ 12
  elseif has("x11")
    " Also for GTK 1
    set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI,Source_Code_Pro:h11:cANSI
    set guifontwide=YouYuan:h12:cGB2312,NSimSun:h12:cGB2312
  endif
  set cursorline        " highlight current line
  "highlight CursorLine      guibg=#003853 ctermbg=24  gui=none cterm=none

  "colorscheme desert
  "colorscheme molokai

  " vim-colors-solarized
  let g:solarized_menu=0
  let g:solarized_termcolors=16
  set background=dark
  colorscheme solarized
else
  " terminal settings
  colorscheme desert
  "colorscheme molokai
endif


" 缩进显示,将tab由8空格替换为4空格以便于程序的阅读
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab


" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.
set smartindent


" Insert mode completion
set completeopt=longest,menu


" statusline setup
"set statusline=\%F      " filename
"set statusline+=%m      " modified flag
"set statusline+=%r      " read only flag
"set statusline+=%h      " help file flag
"set statusline+=%w
"set statusline+=\ [FORMAT=%{&ff}]
"set statusline+=\ [TYPE=%Y]     " filetype,upper
"
"set statusline+=%=          " left/right separator
"set statusline+=%c,         " cursor column
"set statusline+=%l/%L       " cursor line/total lines
"set statusline+=\ \ %p%%\   " percent through file
" set statusline+=\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "date & time
" \ 代表空格
" %%代表'%'
"set laststatus=2    " 始终显示状态行


" 添加文件类型后缀名
au BufNewFile,BufRead *.gv set filetype=dot


" 插件
"""""""""""""""""""""""""""
" airline.vim
"""""""""""""""""""""""""""
set laststatus=2    " 始终显示状态行
" set airline theme
"let g:airline_theme='luna'
" enable tabline
let g:airline#extensions#tabline#enabled = 1

" display numbers in the tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1
" \1 tab with number 1, \2 tab with number 2.
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"""""""""""""""""""""""""""
" a.vim
"""""""""""""""""""""""""""
" :A 头文件／源文件切换
" :AS 分割窗后并切换头/源文件(切割为上下两个窗口)
" :AV 垂直切割窗口后切换头/源文件(切割为左右两个窗口)
" :AT 新建Vim标签式窗口后切换
" :AN 在多个匹配文件间循环切换
" :IH 切换至光标所在文件
" :IHS 分割窗口后切换至光标所在文件
" :IHV 垂直分割窗口后切换
" :IHT 新建标签式窗口后切换
" :IHN 在多个匹配文件间循环切换
" 快捷键操作
" <Leader>ih 切换至光标所在文件
" <Leader>is 切换至光标所在处(单词所指)文件的配对文件(如光标所在处为foo.h，则切换至foo.c/foo.cpp...)
" <Leader>ihn 在多个匹配文件间循环切换

"""""""""""""""""""""""""""
" tagbar.vim
"""""""""""""""""""""""""""
" set keymap
nnoremap <silent> <F9> :TagbarToggle<CR>
" Width of the Tagbar window
let g:tagbar_width = 35
" Vim window will be expanded by the width of the Tagbar window
"let g:tagbar_expand = 2

"""""""""""""""""""""""""""
" csupport
"""""""""""""""""""""""""""
let g:C_LoadMenus = 'yes'
let g:C_Root = '&Plugin.&C\/C\+\+.'
let g:C_MenuHeader = 'no'

"""""""""""""""""""""""""""
" vim.cpp
"""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""
" NERD_commenter.vim
"""""""""""""""""""""""""""
" n\cc | 为光标以下 n 行添加注释
" n\cu | 为光标以下 n 行取消注释
" n\cm | 为光标以下 n 行添加块注释

"""""""""""""""""""""""""""
" tablify.vim
"""""""""""""""""""""""""""
" \tl or \tt | turns selected lines into table (left-aligned text)
" \tc        | turns selected lines into table (centered text)
" \tr        | turns selected lines into table (right-aligned text)
" \tu        | convert selected table back into text

"""""""""""""""""""""""""""
" vim-colors-solarized
"""""""""""""""""""""""""""
call togglebg#map("<F5>")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       ChiTien
"       kitian616@outlook.com
"       https://github.com/kitian616/vimrc
"
" Version:
"       2.0.1 - 01/04/2015
"
" How To Use:
" To use it, copy it to
"       for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
" Sections:
"    -> Globle
"    -> General
"    -> VIM user interface
"    -> Plugins :Vundle.vim
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Status line :Plugin airline.vim
"    -> Plugin settings
"    -> FileTypes
"
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Globle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Multi_language setting
" default encoding utf-8
if has("multi_byte")
  set encoding=utf-8
  "set fenc=cp936
  " English messages only
  "language messages zh_CN.utf-8
  if has('win32')
    language chinese
    let &termencoding=&encoding
  endif
  set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
  set formatoptions+=mM
  set nobomb " 不使用Unicode签名
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

if has("gui_win32")
    source $VIMRUNTIME/mswin.vim
    source $ViMRUnTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" Turn on the WiLd menu
set wildmenu

" show line number all the time
set number

" display incomplete commands
set showcmd

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins :Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
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
""""""""""""""""""""""""""""""""""
" TODO:Plug-ins list
""""""""""""""""""""""""""""""""""

" Plugins for UI.
"
" precision color scheme for multiple applications (terminal, vim, etc.)
" with both dark/light modes
Plugin 'altercation/solarized', {'rtp': 'vim-colors-solarized'}
" aireline , a powerline
Plugin 'bling/vim-airline'

" Plugin for CODE READING.
"
" Alternate Files quickly (.c --> .h etc)
Plugin 'vim-scripts/a.vim'
" Display tags of the current file
Plugin 'vim-scripts/Tagbar'
"*Extra highlighting of typedefs, enumerations etc (based on ctags)
Plugin 'abudden/taghighlight-automirror'

" Plugin for C/C++
"
" C/C++ IDE -- Write and run programs. Insert statements, idioms, comments etc.
Plugin 'vim-scripts/c.vim'
" Additional Vim syntax highlighting for C++ (including C++11/14)
Plugin 'octol/vim-cpp-enhanced-highlight'
" C/C++ omni-completion with ctags database
Plugin 'vim-scripts/OmniCppComplete'

" Plugins fot Python
"
" python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'

" Plugins for WEB DEVELOPMENT.
"
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
"
" Intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'
" Turns simple structured data into nice-looking tables
Plugin 'Stormherz/tablify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on         " syntax highlight
  set hlsearch      " search highlightin
endif

if has("gui_running")
    " try colorscheme solarized
    try
        let g:solarized_menu=0
        set background=dark
        colorscheme solarized
    catch
        colorscheme desert
    endtry

    " Set font according to syste
    if has("gui_gtk2")
        set guifont=DejaVu\ Sans\ Mono\ 11,Fixed\ 11
        set guifontwide=WenQuanYi\ Zen\ Hei\ 12
    elseif has("x11")
        " Also for GTK 1
        set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI,Source_Code_Pro:h11:cANSI
        set guifontwide=YouYuan:h12:cGB2312,NSimSun:h12:cGB2312
    "elseif has("gui_macvim")
    endif

    " Set extra options when running in GUI mode
    set lines=35 columns=110  " window width and height
    "set guioptions-=m        " no Menu
    set guioptions-=T         " no Toolbar
    set t_Co=256
endif

set cursorline        " highlight current line
"highlight CursorLine      guibg=#003853 ctermbg=24  gui=none cterm=none


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" List of directory names for the swap file
set directory=.,$TEMP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "Auto indent

" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.
set smartindent "Smart indent

set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line :Plugin airline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2    " Always show the status line

" set airline theme
let g:airline_theme='luna'
"
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a.vim
"
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


" tagbar.vim
"
" set keymap
nnoremap <silent> <F12> :TagbarToggle<CR>
" Width of the Tagbar window
let g:tagbar_width = 35
" Vim window will be expanded by the width of the Tagbar window
"let g:tagbar_expand = 2


" csupport
"
let g:C_LoadMenus = 'yes'
let g:C_Root = '&Plugin.&C\/C\+\+.'
let g:C_MenuHeader = 'no'

" /OmniCppComplete
"
" Insert mode completion
set completeopt=longest,menu

" vim.cpp
"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" python-mode
" thogen load
"
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_trim_whitespaces = 1

" NERD_commenter.vim
"
" n\cc | 为光标以下 n 行添加注释
" n\cu | 为光标以下 n 行取消注释
" n\cm | 为光标以下 n 行添加块注释


" tablify.vim
"
" \tl or \tt | turns selected lines into table (left-aligned text)
" \tc        | turns selected lines into table (centered text)
" \tr        | turns selected lines into table (right-aligned text)
" \tu        | convert selected table back into text


" vim-colors-solarized
"
call togglebg#map("<F5>")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FileTypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.gv set filetype=dot

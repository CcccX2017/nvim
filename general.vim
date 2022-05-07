" 设置leader键
let mapleader=" "
" 显示行号
set number
" 显示相对行号
set relativenumber
" 设置代码高亮
syntax on
" 显示光标线
set cursorline
" 换行
set wrap
" 显示cmd
set showcmd
" tab补全菜单
set wildmenu
" 高亮搜索结果
set hlsearch
" 进入文件时取消之前的搜索内容高亮
exec "nohlsearch"
" 搜索时，实时高亮输入的内容
set incsearch
" 搜索忽略大小写
set ignorecase
" 智能大小写
set smartcase

set hidden
set updatetime=100
set shortmess+=c

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 识别鼠标
set mouse=a
set encoding=utf-8
" 颜色迁移
let &t_ut=''
" tab缩进修改
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" 显示空格
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
" 收起代码
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
" 光标记忆上次关闭文件位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

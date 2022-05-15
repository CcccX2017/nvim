"  __  __         _   _         __     ___
" |  \/  |_   _  | \ | | ___  __\ \   / (_)_ __ ___
" | |\/| | | | | |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |  | | |_| | | |\  |  __/ (_) \ V / | | | | | | |
" |_|  |_|\__, | |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"         |___/
	

" ============================== Pre settings ============================== 
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif
" ============================== END Pre settings ============================== 

" ============================
" ===== General settings =====
" ============================
if filereadable($HOME . "/.config/nvim/general.vim")
   source $HOME/.config/nvim/general.vim
endif
" ================================
" ===== END General settings =====
" ================================

" ================================
" ===== Keybindings settings =====
" ================================
if filereadable($HOME . "/.config/nvim/keybindings.vim")
   source $HOME/.config/nvim/keybindings.vim
endif
" ====================================
" ===== END Keybindings settings =====
" ====================================

" ============================
" ===== Plugins settings =====
" ============================
call plug#begin('~/.config/nvim/plugged')

" 加速插件
Plug 'lewis6991/impatient.nvim'

" 主题相关插件
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" An implementation of the Popup API from vim in Neovim
Plug 'nvim-lua/popup.nvim' 
" Useful lua functions used ny lots of plugins
Plug 'nvim-lua/plenary.nvim' 
" 通知插件
Plug 'rcarriga/nvim-notify'
" 图标
Plug 'kyazdani42/nvim-web-devicons'

" dap 调试相关
Plug 'ravenxrz/DAPInstall.nvim'
Plug 'ravenxrz/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-live-grep-raw.nvim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'

" 顶部标签页
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'romgrk/nvim-treesitter-context'
Plug 'andymass/vim-matchup'

" lsp相关
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'kosayoda/nvim-lightbulb'
Plug 'ray-x/lsp_signature.nvim'
Plug 'j-hui/fidget.nvim'

" editor enhance
" 自动补全括号
Plug 'windwp/nvim-autopairs'
" 代码注释
Plug 'tomtom/tcomment_vim'
" 用于代码大纲窗口
Plug 'stevearc/aerial.nvim'
" 快捷键
Plug 'folke/which-key.nvim'
" 目录结构
Plug 'kyazdani42/nvim-tree.lua'
" 状态栏
Plug 'nvim-lualine/lualine.nvim'
" 首页
Plug 'goolord/alpha-nvim'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'f3fora/cmp-spell'
Plug 'ethanholz/nvim-lastplace'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'github/copilot.vim'

" 代码片段
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Plug 'mfussenegger/nvim-jdtls'

Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'voldikss/vim-translator'
Plug 'nvim-pack/nvim-spectre'
Plug 'akinsho/toggleterm.nvim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ahmedkhalf/project.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'folke/todo-comments.nvim'
Plug 'sindrets/winshift.nvim'

Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-calltree.nvim'

Plug 'skanehira/preview-markdown.vim'

Plug 'thinca/vim-quickrun'

call plug#end()
" ================================
" ===== End Plugins settings =====
" ================================

" 主题设置
if has('termguicolors')
    set termguicolors
endif
" set background=dark
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_enable_bold = 1
" " only support GUI client
" let g:gruvbox_material_cursor = 'auto'
" let g:gruvbox_material_transparent_background = 0
" let g:gruvbox_material_menu_selection_background = 'green'
" let g:gruvbox_material_ui_contrast = 'high'
" let g:gruvbox_material_better_performance = 1
" 
" let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_diagnostic_virtual_text = "colored"
" colorscheme gruvbox-material
"

lua require('codex')

" ================
" === coc.nvim ===
" ================
" let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-java', 'coc-python', 'coc-go', 'coc-java-lombok', 'coc-java-dependency', 'coc-java-debug', 'coc-java-intellicode', 'coc-highlight', 'coc-emmet', 'coc-pyright', 'coc-sourcekit', 'coc-actions', 'coc-git', 'coc-html', 'coc-vetur', 'coc-yaml', 'coc-explorer', 'coc-css', 'coc-gitignore', 'coc-translator', 'coc-tsserver', 'coc-snippets', 'coc-docker', 'coc-prettier']
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" nnoremap tt :CocCommand explorer<CR>
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
" nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " Use K to show documentation in preview window.
" nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w


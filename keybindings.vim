let mapleader=" "

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap J 5j
noremap K 5k
noremap H 7h
noremap L 7l
" Ctrl s 到行首
noremap <C-s> 0
" Ctrl e 到行尾
noremap <C-e> $

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" 竖向分屏，光标在右边
map sl :set splitright<CR>:vsp<CR>
" 竖向分屏，光标在左边
map sh :set nosplitright<CR>:vsp<CR>
" 横向分屏，光标在下边
map sj :set splitbelow<CR>:sp<CR>
" 横向分屏，光标在上边
map sk :set nosplitbelow<CR>:sp<CR>
" 横向分屏切换为竖向分屏
map sv <C-w>t<C-w>H
" 竖向分屏切换为横向分屏
map sb <C-w>t<C-w>K

" Ctrl l 向左切换
map <C-l> <C-w>l
" Ctrl k 向上切换
map <C-k> <C-w>k
" Ctrl h 向右切换
map <C-h> <C-w>h
" Ctrl j 向下切换
map <C-j> <C-w>j

" 方向键上 分屏高度+5
map <up> :res +5<CR>
" 方向键下 分屏高度-5
map <down> :res -5<CR>
" 方向键左 分屏宽度-5
map <left> :vertical resize-5<CR>
" 方向键右 分屏宽度 +5
map <right> :vertical resize+5<CR>

" 新建标签
map tu :tabe<CR>
" 上一个标签
map th :-tabnext<CR>
" 下一个标签
map tl :+tabnext<CR>

" 顶部标签栏切换
nnoremap <silent><LEADER><right> :BufferLineCycleNext<CR>
nnoremap <silent><LEADER><left> :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" tree explorer 快捷键
nnoremap <silent>tt :NvimTreeToggle<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>
nnoremap <silent><leader>n :NvimTreeFindFile<CR>


runtime! debian.vim

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on

set scrolloff=5
set nu
set hlsearch
"set cursorline 
set wrap
set showcmd
exec "nohlsearch"
set incsearch
set wildmenu
set ignorecase
set smartcase

"smartcase diagnostic"
let mapleader=" "
"noremap i k
"noremap I 5k
"noremap j h
"noremap J H
"noremap k j
"noremap K 5j
"noremap h i
"noremap H I
 
noremap j k
noremap J 5k
noremap k j
noremap K 5j
noremap L 5l
noremap H 5h

map s :w<CR>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"分屏操作"
map sh :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

"分屏方向切换"
map sf <C-w>t<C-w>H
map sd <C-w>t<C-w>K

"分屏中光标切换"
map eh <C-w>h
map el <C-w>l
map ek <C-w>j
map ej <C-w>k
map ee <C-w>w

noremap n nzz
noremap N Nzz


"清除查找高亮"
map <LEADER><CR> :nohlsearch<CR>

"nmap <LEADER>r :call DoOneFileMake()<CR>
"function DoOneFileMake()
    "if(expand("%:p:h")!=getcwd())
        "echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
    "endif
    "exec "w"
    "call SetCompilation()
    ""exec "make"
    ""exec "copen"
"endfunction
    "
"function SetCompilation()
    "if &filetype=='c'    
        "set makeprg=gcc\ %\ -o\ %<
		"exec "!time ./%<"
    "elseif &filetype=='cpp'
        "set makeprg=g++ \ %\ -o\ %<
		"exec "!time ./%<"
	"elseif &filetype == 'python'
		"exec "!time python3 %"
    "endif
"endfunction

"将vim中的内容复制到系统剪贴板"
vnoremap Y "+y
nnoremap P "+p

"新建标签页和标签页切换"
map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"------------------------------------------
"Gnome-terminal的bash
"进入写入模式光标变成竖线
"------------------------------------------
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"分屏窗口大小调整"
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>


call plug#begin('/home/tak/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'
"Plug 'frazrepo/vim-rainbow'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'dense-analysis/ale'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

color snazzy

"vim-visual-multi <C-n> 多光标 

"vim启动时运行nerdtree-tabs
"let g:nerdtree_tabs_open_on_console_startup=1

"startify相关配置
map st :Startify<CR>

"python-mode 相关配置

"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"最大列的长度
let g:pymode_options_max_line_length = 89
"使用python3
let g:pymode_python = 'python3'
"取消代码折叠
let g:pymode_folding = 0
"启用python语法检查
let g:pymode_lint = 0 
"修改后保存时进行检查
let g:pymode_lint_on_write = 0
"光标下单词查阅文档
let g:pymode_rope_show_doc_bind = 'd'
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"重命名光标下的函数，方法，变量及类名
"let g:pymode_rope_rename_bind = '<C-C>rr'
"重命名光标下的模块或包
"let g:pymode_rope_rename_module_bind = 'r1r'
"g跳转到定义处，同时新建竖直窗口打开
"let g:pymode_rope_goto_definition_bind = '[g'
"let g:pymode_rope_goto_definition_cmd = 'vnew'

"关闭文档
let g:pymode_doc = 0

"使用python-mode运行
let g:pymode_run = 1
let g:pymode_run_bind = '<F5>'

"启用自动补全
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<LEADER>i'

"开启python所有的语法高亮
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let python_highlight_all=1

"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"coc相关配置"
set updatetime=100

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"函数跳转"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"同样的词高亮"
autocmd CursorHold * silent call CocActionAsync('highlight')

"变量重命名"
nmap <leader>rn <Plug>(coc-rename)

"切换报错信息"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"查看函数被调用"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"nerdtree相关配置 T在tab打开文件 X收起所有打开的目录
nnoremap <LEADER>t :NERDTreeToggle <CR> 
let NERDTreeMapOpenInTab="o" 
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"let NERDTreeMapOpenInTab='<ENTER>'
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" add tab space
set ts=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

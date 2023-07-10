source ~/.config/nvim/tool.vim
""==============
""===
""===	set
""===
""==============
""设置tab缩进
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
""设置行号
set number
""设置语法高亮
syntax on
""设置相对行号
set relativenumber
""高亮当前行
set cursorline
""设置字不会超出屏幕，会换行显示，但是仍然在同一行
set wrap
""显示自己输入了什么命令
set showcmd
""在输入命令时，按tab可以有选项提示
set wildmenu
""设置文件格式为utf-8
set encoding=utf-8
""设置搜索高亮
set hlsearch
""设置搜索输入时，高亮可以同步
set incsearch
""搜索忽略大小写
set ignorecase
""搜索只认大写
set smartcase
""显示末尾空格
set list
""更改末尾空格显示
" set listchars=tab:▸\ ,trail:♪
 set listchars=tab:\\\ ,trail:♪
set scrolloff=8
""设置按p可以直接从系统剪切板粘贴
""set clipboard=unnamedcol
"禁用鼠标
set mouse=""
"设置终端颜色
set termguicolors
"
""==============
""===
""===	let
""===
""==============
"
""将<LEADER>改为空格键
let mapleader=" "
"
"
""==============
""===
""===	map
""===
""==============


map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitbelow<CR>:split<CR>

map <C-h> <C-w>h
map <C-j> <C-w>l
map <C-l> <C-w>j
map <C-k> <C-w>k


map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>
"
"
"
""==============
""===
""===	noremap
""===
""==============
""方向键(移动)
""
""	      ^
""	      k
""
""	<h         j>
""	
""	      l
""	      v
""
noremap j l
noremap l j
noremap H 7h
noremap J 7l
noremap L 7j
noremap K 7k
noremap ff gg=Ggi<ESC>
noremap tn :tabe<CR>
noremap t, :-tabnext<CR>
noremap t/ :-tabnext<CR>
noremap t. :+tabnext<CR>
noremap V :call setreg("l",line('.'))<CR>V
noremap v :call setreg("n",col('.'))<CR>v
nnoremap q ZZ
nnoremap Q ZZ
nnoremap z q
noremap . $
noremap , 0
noremap n nzz
noremap N Nzz
noremap <SPACE><CR> :nohlsearch<CR>
nnoremap R :w<CR>:source $MYVIMRC<CR>
nnoremap U vU
nnoremap <C-S> <ESC>:w<CR>
nnoremap <C-q> <ESC>:q!<CR>
nnoremap <C-z> <ESC>u
nnoremap <C-x> <ESC><c-r>
nnoremap <C-n> :call IsEnableNum()<CR>
"
""==============
""===
""===	inoremap
""===
""==============
inoremap <c-s> <ESC>:w<CR>i
inoremap <C-q> <ESC>:q!<CR>
inoremap <C-z> <ESC>ui
inoremap <C-x> <ESC><c-r>i
inoremap ff <ESC>gg=Ggi
"
""==============
""===
""===	exec
""===
""==============
exec "nohlsearch"
"
""==============
""===
""===	auto
""===
""==============
"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""==============
""===
""===	plug
""===
""==============
let gh='https://github.wisteria.cf/'
let pa="~/.config/nvim/plugged/"
call plug#begin('~/.config/nvim/plugged')

"主题
"Plug gh.'folke/tokyonight.nvim'
Plug gh.'connorholyday/vim-snazzy'
"语法高亮
Plug gh.'nvim-treesitter/nvim-treesitter'
"Plug gh.'nvim-treesitter/playground'
"缩进线
Plug gh.'Yggdroot/indentLine'
"目录树
Plug gh.'nvim-tree/nvim-tree.lua'
"vim-go插件
Plug gh.'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"coc补全插件
Plug gh.'neoclide/coc.nvim', {'branch': 'release'}
""翻译,需要设置hosts--->108.177.97.100 translate.googleapis.com
 Plug gh.'asters1/vim-fy'
" Plug 'https://github.wisteria.cf/voldikss/vim-translator'
"git提示
Plug gh.'lewis6991/gitsigns.nvim'
"状态栏
Plug gh.'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }
"一键注释
Plug gh.'numToStr/Comment.nvim'
  
call plug#end()
""==================主题==================
"if g:IsExists("~/.config/nvim/plugged/tokyonight.nvim")
if g:IsExists("~/.config/nvim/plugged/vim-snazzy")
"colorscheme tokyonight-moon
color snazzy
endif

"=========语法高亮=================
if g:IsExists("~/.config/nvim/plugged/nvim-treesitter")
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { "vim", "go", "bash", "c", "cpp", "javascript",  "lua", "python", "typescript", "tsx", "css", "rust" },

  highlight = { enable = true },
  indent = { enable = false },

  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
EOF
endif

"一键注释
if g:IsExists(pa."Comment.nvim")

lua <<EOF
require('Comment').setup(
  {
toggler = {
        ---Line-comment toggle keymap
        line = '#',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '#',
        ---Block-comment keymap
        block = 'gb',
    }

})
EOF
"Ctrl+/注释
 map <C-_> #
endif

""==================
""===
""===	目录树
""===
""==================
if g:IsExists("~/.config/nvim/plugged/nvim-tree.lua")
lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  renderer={
  icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
           empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  }
})

EOF
nnoremap tt :NvimTreeToggle<CR>
endif
 let g:indentLine_char_list = ['¦', '¦']

""==================gitsigns==================

if g:IsExists("~/.config/nvim/plugged/gitsigns.nvim")

lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap H :Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>

endif

""==================
""===
""===	配置vim-go
""===
""==================
"K键在 ftplugin/go.vim"


let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 1
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 0
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mode='gopls'

""=======================
""===
""===	配置coc自动补全
""===
""=======================
" python3 -m pip install --user --upgrade pynvim
" pip install pylint
" pip install jedi"


"需要另外安装语言服务器
"c ---->ccls  pacman -S ccls

if IsExists("~/.config/nvim/plugged/coc.nvim")
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-xml',
            \ 'coc-go',
            \ 'coc-clangd',
            \ 'coc-css',
            \ 'coc-java',
            \ 'coc-diagnostic',
            \ 'coc-flutter-tools',
            \ 'coc-gitignore',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-sourcekit',
            \ 'coc-stylelint',
            \ 'coc-pyright',
            \ 'coc-syntax',
            \ 'coc-tasks',
            \ 'coc-todolist',
            \ 'coc-translator',
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-vetur',
            \ 'coc-yaml',
            \ 'coc-yank']
"允许不保存跳转"
set hidden
set updatetime=100
set shortmess+=c
"tab补全"
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
"向上补全"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"



function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"使用CR确定选项"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"跳转到上一个错误"
nmap <silent> g, <Plug>(coc-diagnostic-prev)
"跳转到下一个错误
nmap <silent> g. <Plug>(coc-diagnostic-next)
"跳转到函数定义处
nmap <silent> <c-]> <Plug>(coc-definition)
"跳转到函数类型定义处
"nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gh <Plug>(coc-implementation)
"nmap <silent> gn <Plug>(coc-references)
" 重命名变量
nmap <leader>c <Plug>(coc-rename)
endif




"===============
"==
"==	一键运行
"==
"===============
func! CompileRunGcc()
    exec "w"

    if filereadable("./run.sh") && @%[strlen(@%)-8:] != '_test.go'
        set splitbelow
        :sp
        :term bash ./run.sh
    else
        if &filetype == 'c'
            set splitbelow
            :sp
            :term gcc % -o %< && ./%<
        elseif &filetype == 'cpp'
            set splitbelow
            :sp
            :term g++ % -o %< && ./%<
        elseif &filetype == 'java'
            set splitbelow
            :sp
            term javac % && java %<
        elseif &filetype == 'sh'
            set splitbelow
            :sp
            :term bash %
        elseif &filetype == 'python'
            set splitbelow
            :sp
            :term python3 %
        elseif &filetype == 'html'
            silent! exec "!".g:mkdp_browser." % &"
        elseif &filetype == 'markdown'
            exec "InstantMarkdownPreview"
        elseif &filetype == 'tex'
            silent! exec "VimtexStop"
            silent! exec "VimtexCompile"
        elseif &filetype == 'dart'
            exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
            silent! exec "CocCommand flutter.dev.openDevLog"
        elseif &filetype == 'javascript'
            set splitbelow
            :sp
            :term node %
        elseif &filetype == 'go'
            set splitbelow
            :sp
            if strlen(@%)>8 && @%[strlen(@%)-8:] == '_test.go'

                :term go test
            else
                if filereadable("./run.sh")
                    :term bash ./run.sh
                else
                    :term go run .
                endif
            endif
        endif
    endif
endfunc

map <LEADER>s :call CompileRunGcc()<CR>

"===============
"==
"==	配置翻译
"==
"===============
" 需要设置hosts--->108.177.97.100 translate.googleapis.com
 " let g:translator_tool='fy'
  let g:translator_tool='bash'
 let g:translator_command=1
 let g:translator_file='translator.sh'
 nmap <silent> fy <Plug>TranslateW
 vmap <silent> fy <Plug>TranslateWV
 let g:translator_default_engines = [
            \ 'google']
"===============
"==
"==	配置模板
"==
"===============

noremap <LEADER>f :call TemplateFormat()<CR>
function! TemplateFormat()
    if &filetype == "html"
        r !echo -e "<\!DOCTYPE html>\n<html>\n<head>\n	<meta charset="UTF-8">\n	<title></title>\n</head>\n<body>\n\n\n</body>\n</html>"
        normal ggddG
    elseif &filetype == "sh"
        r !echo -e "\#\!/bin/bash"
        normal ggddG
    elseif &filetype == "go"
        r !echo -e "package main\n\nimport "fmt"\n\nfunc main() {\n 	fmt.Println("♧")\n}\n
        normal ggddG
    endif
endfunction

autocmd BufNewFile *.py 0r ~/.config/nvim/template/python.py

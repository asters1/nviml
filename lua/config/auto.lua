--自动跳转到上次关闭处上一行
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
--自动关闭搜索高亮
vim.cmd([[exec "nohlsearch"]])


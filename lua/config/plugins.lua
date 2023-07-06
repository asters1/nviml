local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		gh.."folke/lazy.nvim",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<leader><leader>", ":Lazy<CR>", { noremap = true })


require("lazy").setup({
	
	
--	主题
	-- require("config.plugins.colorscheme").background,
 --  --require("config.plugins.colorscheme").statusline1,
	-- require("config.plugins.colorscheme").statusline2,
 --  --注释
	-- require("config.plugins.comment"),
 --  --目录树
 --  require("config.plugins.nvim-tree"),
 --  --git提示
 --  require("config.plugins.gitsigns"),
  --翻译
  -- require("config.plugins.fy"),
  --LSP
   require("config.plugins.lspconfig"),
   
   
  --自动补全
  require("config.plugins.autocomplete"),

--
--
--
--
--
--
--	require("config.plugins.telescope").config,
--	require("config.plugins.fzf"),
--	require("config.plugins.notify"),
--	require("config.plugins.statusline"),
--	require("config.plugins.editor"),
--	require("config.plugins.scrollbar"),
--	require("config.plugins.tabline"),
--	require("config.plugins.autocomplete").config,
--	require("config.plugins.debugger"),
--	require("config.plugins.lspconfig").config,
--	require("config.plugins.flutter"),
--	require("config.plugins.go"),
--	require("config.plugins.treesitter"),
--	require("config.plugins.joshuto"),
--	require("config.plugins.comment"),
--	require("config.plugins.surround"),
--	require("config.plugins.project"),
--	require("config.plugins.wilder"),
--	require("config.plugins.multi-cursor"),
--	require("config.plugins.copilot"),
--	require("config.plugins.markdown"),
--	require("config.plugins.git"),
--	require("config.plugins.indent"),
--	require("config.plugins.search"),
--	require("config.plugins.yank"),
--	require("config.plugins.snippets"),
--	require("config.plugins.window-management"),
--	require("config.plugins.undo"),
--	require("config.plugins.ft"),
--	require("config.plugins.fun"),
--	require("config.plugins.winbar"),
--	require("config.plugins.leap"),
--	{ "dstein64/vim-startuptime" },
}, {
})

-- require("plugin.vertical_cursor_movement")
-- 
-- local swap_ternary = require("plugin.swap_ternary")
-- vim.keymap.set("n", "<leader>st", swap_ternary.swap_ternary, { noremap = true })
-- 
-- require("plugin.compile_run")

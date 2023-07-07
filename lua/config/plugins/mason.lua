return {
	gh.."williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		{gh.. "williamboman/mason.nvim", build = ":MasonUpdate", },
	},
	config = function()
    vim.keymap.set('n', '<leader>m',':Mason<CR>')
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", },
			automatic_installation = true,
		})
	end
}

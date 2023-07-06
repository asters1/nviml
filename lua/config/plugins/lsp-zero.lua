return {
  {
    gh..'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {gh..'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      gh..'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {gh..'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {gh..'hrsh7th/nvim-cmp'},     -- Required
    {gh..'hrsh7th/cmp-nvim-lsp'}, -- Required
    {gh..'L3MON4D3/LuaSnip'},     -- Required
  },
  config = function()
    -- LSP
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
  end
}



}

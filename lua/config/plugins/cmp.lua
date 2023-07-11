return {
  gh.."neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- luasnip setup
  local luasnip = require("luasnip")

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end


  local types = require("cmp.types")
  local str = require("cmp.utils.str")
  local lspkind = require("lspkind")

  -- nvim-cmp setup
  local cmp = require("cmp")
  --   פּ ﯟ   some other good icons
  --local kind_icons = {
  --Text = "",
  --Method = "m",
  --Function = "",
  --Constructor = "",
  --Field = "",
  --Variable = "",
  --Class = "",
  --Interface = "",
  --Module = "",
  --Property = "",
  --Unit = "",
  --Value = "",
  --Enum = "",
  --Keyword = "",
  --Snippet = "",
  --Color = "",
  --File = "",
  --Reference = "",
  --Folder = "",
  --EnumMember = "",
  --Constant = "",
  --Struct = "",
  --Event = "",
  --Operator = "",
  --TypeParameter = "",
  --}
  local kind_icons = {
    -- Class = '🅒',
    Class = "∴",
    -- Color = '☀',
    -- Color = '⛭',
    Color = "🖌",
    -- Constant = 'π',
    Constant = "𝜋",
    Constructor = "⬡",
    -- Constructor = '⌬',
    -- Constructor = '⎔',
    -- Constructor = '⚙',
    -- Constructor = 'ᲃ',
    Enum = "",
    EnumMember = "",
    Event = "",
    -- Field = '→',
    -- Field = '∴',
    --Field = '🠶',
    Field = "",
    File = "",
    Folder = "",
    Function = "ƒ",
    -- Function = 'λ',
    Interface = "",
    --Keyword = '🗝',
    Keyword = "",
    Method = "𝘮",
    -- Method = 'λ',
    --Module = '📦',
    Module = "",
    Operator = "≠",
    -- Operator = '±',
    -- Property = '::',
    Property = "∷",
    -- Reference = '⌦',
    Reference = "⊷",
    -- Reference = '⊶',
    -- Reference = '⊸',
    -- Snippet = '',
    -- Snippet = '↲',
    -- Snippet = '♢',
    -- Snippet = '<>',
    Snippet = "{}",
    Struct = "",
    --Text = '#',
    -- Text = '♯',
    -- Text = 'ⅵ',
    -- Text = "¶",
    -- Text = "𝒯",
    Text = "𝓣",
    -- Text = "𐄗",
    TypeParameter = "×",
    Unit = "()",
    -- Value           =
    -- Variable = '𝛼',
    -- Variable = 'χ',
    Variable = "𝓧",
    -- Variable = '𝛸',
    -- Variable = 'α',
    -- Variable = '≔',
  }
  -- other symbols that might be useful for something: -- ⊕ † ፨ ᯾ ⁂ ∎ ∹ ☖ ⚐ 🕮 🗈 🗉 🗈 🗉 ⬠  ⬡  ⮺  ⮻ ⯐  ⯒ ⟡ ✐  ✎ ꒾꙳ ꥟ ⤙ ⤚ ⤛ ⤜

  end,
  dependencies = {
    { "hrsh7th/nvim-cmp" }, -- Autocompletion plugin
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lua" },
    { "f3fora/cmp-spell" },
    { "hrsh7th/cmp-calc" },
    { "kdheepak/cmp-latex-symbols" },
    { "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
    {
      "L3MON4D3/LuaSnip",
      config = function()
      end,
      dependencies = {
        { "rafamadriz/friendly-snippets" },
      },
    },
    { "ray-x/cmp-treesitter" },
    { "onsails/lspkind.nvim" },
  },
}

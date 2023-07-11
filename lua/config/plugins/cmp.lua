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

 local select_opts = { behavior = cmp.SelectBehavior.Select }

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-l>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
      ["<Down>"] = cmp.mapping.select_next_item(select_opts),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-e>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- super tab GOOD! But I like tab to confirm
      --["<tab>"] = cmp.mapping(function(fallback)
      --if cmp.visible() then
      --cmp.select_next_item()
      --elseif luasnip.expand_or_jumpable() then
      --luasnip.expand_or_jump()
      --elseif has_words_before() then
      --cmp.complete()
      --else
      --fallback()
      --end
      --end, { "i", "s" }),

      --["<S-Tab>"] = cmp.mapping(function(fallback)
      --if cmp.visible() then
      --cmp.select_prev_item()
      --elseif luasnip.jumpable(-1) then
      --luasnip.jump(-1)
      --else
      --fallback()
      --end
      --end, { "i", "s" }),
      --}),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
            ""
          )
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    experimental = {
      ghost_text = false,
    },
    window = {
      --documentation = {
      --border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      --},
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      },
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = "treesitter" },
      {
        name = "latex_symbols",
        option = {
          strategy = 0, -- mixed
        },
      },
      { name = "calc" },
      { name = "path" },
      { name = "nvim_lua" },
      { name = "spell" },
    }),
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          -- omni = "[VimTex]",
          omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          spell = "[Spell]",
          latex_symbols = "[Symbols]",
          cmdline = "[CMD]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
      --fields = {
      --cmp.ItemField.Abbr,
      --cmp.ItemField.Kind,
      --cmp.ItemField.Menu,
      --},
      --format = lspkind.cmp_format({
      --mode = "symbol_text",
      --maxwidth = 60,
      --before = function(entry, vim_item)
      --vim_item.menu = ({
      --nvim_lsp = "ﲳ",
      --nvim_lua = "",
      --treesitter = "",
      --path = "ﱮ",
      --buffer = "﬘",
      --zsh = "",
      --luasnip = "",
      --spell = "",
      --})[entry.source.name]

      ---- Get the full snippet (and only keep first line)
      --local word = entry:get_insert_text()
      --if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
      --word = vim.lsp.util.parse_snippet(word)
      --end
      --word = str.oneline(word)
      --if
      --entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
      --and string.sub(vim_item.abbr, -1, -1) == "~"
      --then
      --word = word .. "~"
      --end

      --vim_item.abbr = word

      --return vim_item
      --end,
      --}),
    },
    --enable catppuccin integration
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  })

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

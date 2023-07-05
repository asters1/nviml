return {
  "https://github.wisteria.cf/numToStr/Comment.nvim",
  lazy = false,
  priority = 1000,
  config = function()
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
  end

  }

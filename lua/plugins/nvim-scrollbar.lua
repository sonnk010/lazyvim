return {
  enalbe = false,
  "petertriho/nvim-scrollbar",
  lazy = false,
  config = function()
    require("scrollbar").setup({
      show = true,
      hide_if_all_visible = true,
      set_highlight = true,
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        -- search = true, -- Requires hlslens
        ale = false, -- Requires ALE tb
      },
    })
  end,
  opts = function()
    local colors = require("catppuccin.palettes").get_palette()

    require("scrollbar").setup({
      handle = {
        color = colors.surface2,
      },

      marks = {
        Search = { color = colors.peach },
        Error = { color = colors.red },
        Warn = { color = colors.yellow },
        Info = { color = colors.blue },
        Hint = { color = colors.teal },
        Misc = { color = colors.mauve },

        GitAdd = { color = colors.green },
        GitChange = { color = colors.yellow },
        GitDelete = { color = colors.red },
      },
    })
  end,
}

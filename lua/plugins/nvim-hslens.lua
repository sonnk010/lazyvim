return {
  -- glance at matched information, include highlight scrollbar
  "kevinhwang91/nvim-hlslens",
  lazy = false,
  dependencies = { "petertriho/nvim-scrollbar" }, -- ensuring nvim-scrollbar is loaded first
  config = function()
    require("hlslens").setup()
    require("scrollbar.handlers.search").setup({ -- integrate with nvim-scrollbar
    })
  end,
}

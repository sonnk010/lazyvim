return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        function() -- Auto focus snacks explorer when exist
          for _, picker in pairs(Snacks.picker.get()) do
            if picker.opts and picker.opts.source == "explorer" then
              picker:focus()
              return
            end
          end

          Snacks.explorer()
        end,
        desc = "Explorer",
      },
    },
  },
}

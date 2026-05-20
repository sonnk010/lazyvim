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
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["Y"] = "copy_filename",
                  ["gY"] = "copy_filename_without_ext",
                },
              },
            },
            actions = {
              copy_filename = function(picker, item)
                local items = picker:selected({ fallback = true })

                if #items == 0 then
                  vim.notify("No file selected", vim.log.levels.WARN)
                  return
                end

                local filenames = {}

                for _, selected_item in ipairs(items) do
                  local path = selected_item.file

                  if path then
                    local filename = vim.fn.fnamemodify(path, ":t")
                    table.insert(filenames, filename)
                  end
                end

                if #filenames == 0 then
                  vim.notify("No file to copy", vim.log.levels.WARN)
                  return
                end

                local result = table.concat(filenames, "\n")

                vim.fn.setreg("+", result)
                vim.fn.setreg('"', result)

                vim.notify("Copied " .. #filenames .. " filename(s)")
              end,

              copy_filename_without_ext = function(picker, item)
                local items = picker:selected({ fallback = true })

                if #items == 0 then
                  vim.notify("No file selected", vim.log.levels.WARN)
                  return
                end

                local filenames = {}

                for _, selected_item in ipairs(items) do
                  local path = selected_item.file

                  if path then
                    local filename = vim.fn.fnamemodify(path, ":t:r")
                    table.insert(filenames, filename)
                  end
                end

                if #filenames == 0 then
                  vim.notify("No file to copy", vim.log.levels.WARN)
                  return
                end

                local result = table.concat(filenames, "\n")

                vim.fn.setreg("+", result)
                vim.fn.setreg('"', result)

                vim.notify("Copied " .. #filenames .. " filename(s) without extension")
              end,
            },
          },
        },
      },
    },
  },
}

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")

    oil.setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      }
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    keymap.set("n", "<space>-", oil.toggle_float, { desc = "Open parent directory in floating window" })
  end
}

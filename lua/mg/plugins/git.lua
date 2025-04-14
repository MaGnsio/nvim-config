return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup()

      local keymap = vim.keymap
      keymap.set("n", "<leader>gh", gitsigns.preview_hunk, { desc = "Preview the hunk at the cursor position in a floating window" })
      keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
    end,
  },
}

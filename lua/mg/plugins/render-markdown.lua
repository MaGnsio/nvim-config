return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    local render_markdown = require("render-markdown")
    render_markdown.setup()
    local keymap = vim.keymap
    keymap.set("n", "<leader>mt", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle render markdown" })
  end
}

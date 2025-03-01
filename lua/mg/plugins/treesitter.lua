return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag", },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      -- install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      -- automatically install missing parsers when entering buffer
      auto_install = false,
      -- list of parsers to ignore installing (or "all")
      ignore_install = {},
      modules = {},
      -- enable syntax highlighting
      highlight = { enable = true, },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true, },
      -- ensure these language parsers are installed
      ensure_installed = { "c", "cpp", "python", "go", "rust", "markdown", "markdown_inline", "bash", "lua", "gitignore", "query", "vim", "vimdoc", },
      incremental_selection = {
        enable = true,
        keymaps = { init_selection = "<C-space>", node_incremental = "<C-space>", scope_incremental = false, node_decremental = "<bs>", },
      },
    })
  end,
}

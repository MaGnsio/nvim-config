return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Automatically install missing parsers on enter
    local parsers = {
      "c", "cpp", "python", "go", "rust", "markdown", "markdown_inline",
      "bash", "lua", "gitignore", "query", "vim", "vimdoc"
    }

    -- Enable native treesitter syntax highlighting and indent per filetype
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Enable nvim-ts-autotag (now setup directly on its own module)
    require("nvim-ts-autotag").setup()

    -- Incremental Selection (Replaced treesitter.configs keymaps with native Neovim mappings)
    vim.keymap.set("n", "<C-space>", function()
      vim.treesitter.incremental_selection.init_selection()
    end, { desc = "Init Treesitter Selection" })

    vim.keymap.set("v", "<C-space>", function()
      vim.treesitter.incremental_selection.node_incremental()
    end, { desc = "Increment Treesitter Selection" })

    vim.keymap.set("v", "<bs>", function()
      vim.treesitter.incremental_selection.node_decremental()
    end, { desc = "Decrement Treesitter Selection" })
  end,
}

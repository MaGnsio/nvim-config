return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { 'stevearc/conform.nvim' },
    { "williamboman/mason.nvim", version = "^1.0.0" },
    { "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "lua-format" },
        python = { "ruff" },
        cpp = { "clang-format" }
      },
    })

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd", "pyright", "ruff", "marksman", "gopls" },
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("lspconfig").ruff.setup {}
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      },
    })
    require("lspconfig").lua_ls.setup { capabilities = capabilities }
    require("lspconfig").clangd.setup({
      cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--header-insertion=never' },
      init_options = {
        fallbackFlags = { '-std=c++20' },
      },
      capabilities = capabilities,
    })
    require("lspconfig").marksman.setup { capabilities = capabilities }
    require("lspconfig").gopls.setup { capabilities = capabilities }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == 'ruff' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = 'LSP: Disable hover capability from Ruff',
    })
  end,
}

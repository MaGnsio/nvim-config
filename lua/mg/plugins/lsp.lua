return {
  dir = vim.fn.stdpath("config"),
  name = "lsp",
  lazy = false,
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.enable({
      "lua_ls", "clangd", "pyright", "ruff",
      "marksman", "gopls", "buf_ls", "kotlin_lsp",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then return end
        if client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })
  end,
}

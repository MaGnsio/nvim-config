function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)
end

return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      ColorMyPencils("tokyonight-moon")
      -- ColorMyPencils("moonfly")
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly", lazy = false
  },
}

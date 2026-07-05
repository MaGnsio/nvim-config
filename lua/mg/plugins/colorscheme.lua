-- return {
--   {
--     "folke/tokyonight.nvim",
--     name = "tokyonight",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--       vim.cmd.colorscheme("tokyonight-moon")
--     end
--   }
-- }
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}

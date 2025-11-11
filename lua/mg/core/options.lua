vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- tabs & indentation
opt.tabstop = 4        -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4     -- 4 spaces for indent width
opt.expandtab = true   -- expand tab to spaces
opt.autoindent = true  -- copy indent from current line when starting new one
opt.wrap = false       -- line wrapping
opt.smartindent = true -- smart indentation

-- folding
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "" -- first line of the fold will be syntax highlighted
opt.foldlevel = 99

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- opt.cursorline = true

-- turn on termguicolor
-- (have a true color terminal)
opt.termguicolors = true   -- enable true color support
vim.opt.signcolumn = "yes" -- always show sign column (prevents shifting)
opt.background = "dark"    -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"     -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- < → allows moving left (h) to the previous line when at the beginning.
-- > → allows moving right (l) to the next line when at the end.
-- h → explicitly allows h to wrap to the previous line.
-- l → explicitly allows l to wrap to the next line.
opt.whichwrap:append("<,>,h,l")

-- allows "@" and "-" in filenames
opt.isfname:append("@-@")

function _G.MyTabline()
  local s = ""
  local total_tabs = vim.fn.tabpagenr("$")

  for i = 1, total_tabs do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local name = vim.api.nvim_buf_get_name(bufnr)
    local filename = vim.fn.fnamemodify(name, ":t") -- ":t" = tail (filename only)
    if filename == "" then filename = "📃" end

    local modified = vim.bo[bufnr].modified and " ●" or ""

    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel# " .. filename .. modified .. " "
    else
      s = s .. "%#TabLine# " .. filename .. modified .. " "
    end
  end

  return s .. "%#TabLineFill#"
end

vim.o.tabline = "%!v:lua.MyTabline()"

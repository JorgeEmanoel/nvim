-- local M = {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   opts = {
--     transparent_background = false,
--   },
-- }

-- https://github.com/navarasu/onedark.nvim
local M = {
  "navarasu/onedark.nvim",
  name = "onedark",
  opts = {
    style = "darker",
  },
}

function M.config()
  -- vim.cmd.colorscheme "catppuccin-frappe"
  vim.cmd.colorscheme "onedark"
end

return M

local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparent_background = false,
  },
}

function M.config()
  vim.cmd.colorscheme "catppuccin-frappe"
end

return M

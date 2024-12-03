local M = {
  "nvim-java/nvim-java",
}

function M.config()
  require("java").setup()
  require("lspconfig").jdtls.setup {}
end

return M

local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
  local event = "BufWritePre" -- or "BufWritePost"
  local async = event == "BufWritePost"

  null_ls.setup {
    sources = {
      formatting.stylua,
      formatting.prettier,
      -- formatting.prettierd.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        -- vim.keymap.set("n", "<Leader>f", function()
        --   vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
        -- end, { buffer = bufnr, desc = "[lsp] format" })

        -- format on save
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
        vim.api.nvim_create_autocmd(event, {
          buffer = bufnr,
          group = group,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr, async = async }
          end,
          desc = "[lsp] format on save",
        })
      end

      if client.supports_method "textDocument/rangeFormatting" then
        -- vim.keymap.set("x", "<Leader>f", function()
        --   vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
        -- end, { buffer = bufnr, desc = "[lsp] format" })
      end
    end,
  }
end

return M

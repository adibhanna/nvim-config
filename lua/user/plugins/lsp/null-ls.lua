-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    --  to disable file types use
    --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
    formatting.prettier, -- js/ts formatter
    formatting.stylua, -- lua formatter
    formatting.eslint,
    -- diagnostics.eslint_d.with({ -- js/ts linter
    --   -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
    --   condition = function(utils)
    --     return utils.root_has_file(".eslintrc.js")
    --   end,
    -- }),
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.name == "tsserver" then
      current_client.resolved_capabilities.document_formatting = false
    end
    -- if current_client.supports_method("textDocument/formatting") then
      -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format({
      --       filter = function(client)
      --         --  only use null-ls for formatting instead of lsp server
      --         return client.name == "null-ls"
      --       end,
      --       bufnr = bufnr,
      --     })
      --   end,
      -- })
    -- end
  end,
})

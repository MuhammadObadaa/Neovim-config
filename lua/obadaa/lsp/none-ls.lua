local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.blade_formatter,
    null_ls.builtins.formatting.phpcbf,
  }
})

vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, {})
-- download your formatter from :Mason and add it to the source here

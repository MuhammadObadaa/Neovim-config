local status_ok,_ = pcall(require,"lspconfig")
if not status_ok then
  return
end

require("obadaa.lsp.lsp-config")
require("obadaa.lsp.handlers").setup()
require "obadaa.lsp.none-ls"

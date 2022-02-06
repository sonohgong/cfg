-- Bash
local lsp = require("lspconfig")
local lspcfg = require("me/lsp")

lsp.bashls.setup {on_attach = lspcfg.on_attach, handlers = lspcfg.handlers}

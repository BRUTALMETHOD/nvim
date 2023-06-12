require('mason').setup()
require('mason-lspconfig').setup()



local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed = {
  "tsserver",
  "rust",
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {
  checkOnSave = { command = "clippy" }
}

lsp.format_on_save({

  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua-ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'}
  },
})

lsp.setup()


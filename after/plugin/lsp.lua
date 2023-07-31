local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end


require('mason').setup()
require('mason-lspconfig').setup()


lsp.preset("recommended")
lsp.ensure_installed = {
  "tsserver",
  "rust",
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {
  checkOnSave = { command = "clippy" }
}

lsp.setup_nvim_cmp({
  preselect = 'item', -- maybe this is fighting with cmp select=false
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})
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


local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- null-ls EOL ..

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- null_ls.setup({
-- 	debug = true,
-- 	sources = {
-- 		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
-- 		formatting.black.with({ extra_args = { "-l 88","--preview"} }),
-- 		formatting.stylua,
--     		formatting.gofmt,
-- 		-- formatting.autopep8,
--     		diagnostics.golangci_lint,
--     		-- diagnostics.pylint,
--     		-- diagnostics.flake8,
-- 	},
-- })

local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"rust_analyzer",
		"gopls",
		"golangci_lint_ls",
		"ruff",
		"bashls",
	},
})

lsp.preset("recommended")

require("lspconfig").taplo.setup({})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").gopls.setup({})

-- I thinks this not needed because we have rust-tools
-- require("lspconfig").rust_analyzer.setup({
-- 	checkOnSave = { command = "clippy" },
-- })

lsp.setup_nvim_cmp({
	preselect = true, -- maybe this is fighting with cmp select=false
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})
lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["lua-ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
	},
})

local util = require("lspconfig/util")
local path = util.path

-- local function get_poetry_dir()
-- 	return vim.fn.trim(vim.fn.system("poetry env info -p"))
-- end

-- local function get_python_dir(workspace)
-- 	local poetry_match = vim.fn.glob(path.join(workspace, "poetry.lock"))
-- 	if poetry_match ~= "" then
-- 		return get_poetry_dir()
-- 	end
-- 	-- Find and use virtualenv in workspace directory.
-- 	for _, pattern in ipairs({ "*", ".*" }) do
-- 		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
-- 		if match ~= "" then
-- 			return path.dirname(match)
-- 		end
-- 	end
-- 	-- Fallback to system Python.
-- 	return exepath("python3") or exepath("python") or "python"
-- end

require("lspconfig").ruff.setup({})
-- require("lspconfig").pyright.setup({})
require("lspconfig").pyright.setup({
	on_init = function(_, config)
		local poetry_match = vim.fn.glob(path.join(config.root_dir, "poetry.lock"))
		if poetry_match ~= "" then
			pcall(vim.cmd, "PoetvActivate")
		end
		-- config.settings.python.pythonPath = get_python_dir(config.root_dir)
	end,
})

require("lspconfig").terraformls.setup({ cmd = { "terraform-ls", "serve" } })
require("lspconfig").ansiblels.setup({})

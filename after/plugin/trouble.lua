local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({
	modes = {
		mydiags = {
			mode = "diagnostics", -- inherit from diagnostics mode
			auto_open = true,
			groups = {
				{ "filename", format = "{file_icon} {basename:Title} {count}" },
			},
			filter = {
				any = {
					buf = 0, -- current buffer
					{
						severity = vim.diagnostic.severity.ERROR, -- errors only
						-- limit to files in the current project
						function(item)
							return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
						end,
					},
				},
			},
		},
	},
	icons = {
		indent = {
			middle = " ",
			last = " ",
			top = " ",
			ws = "│  ",
		},
	},
	auto_close = true,
})

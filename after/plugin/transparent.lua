local status_ok, tr = pcall(require, "transparent")
if not status_ok then
	return
end

tr.setup({
  enable = true,
})

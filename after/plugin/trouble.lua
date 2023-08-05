local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup {
  icon = false,
  auto_open = true,
  auto_close = true,
}

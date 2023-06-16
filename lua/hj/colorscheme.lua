local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

require("tokyonight").setup({
        style="night",
        transparent=true,
        on_colors = function(colors)
          colors.error = "#ff0000"
        end
      })

local status_ok, tr = pcall(require, "transparent")
if not status_ok then
	return
end

tr.setup({
    groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {'NvimTreeNormal','NvimTreeWinSeparator'}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

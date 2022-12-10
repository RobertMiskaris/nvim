local status, indent = pcall(require, "indent_blankline")
if not status then
	return
end

indent.setup({
	show_current_context = false,
	show_current_context_start = false,
	enabled = true,
	colored_indent_levels = false,
})

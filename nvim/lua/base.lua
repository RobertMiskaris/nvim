vim.cmd("autocmd!")

-- File
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Off swap
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Color
vim.opt.termguicolors = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Base
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showcmd = false
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- Tab
vim.opt.smarttab = true
vim.opt.scrolloff = 1000
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
--vim.opt.cindent = true
--vim.opt.expandtab = true

vim.opt.breakindent = true

-- ???

-- UI
-- vim.opt.guifont = { "Hack Nerd Font Mono", "h12" }
vim.opt.guifont = { "FiraCode Nerd Font Mono", "h12" }
vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_input_use_logo = 1
vim.g.neovide_hide_mouse_when_typing = 1
vim.g.neovide_underline_automatic_scaling = 1
vim.g.neovide_refresh_rate = 120
vim.g.neovide_input_macos_alt_is_meta = 1

local status, zen = pcall(require, "true-zen")
if not status then
	return
end

zen.setup({
	modes = { -- configurations per mode
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 100,
				height = 100,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 30,
				right = 30,
				top = 0,
				bottom = 0,
			},
			callbacks = { -- run functions when opening/closing Ataraxis mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
	},
	integrations = {
		lualine = true, -- hide nvim-lualine (ataraxis)
		kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
			enabled = false,
			font = "+3",
		},
	},
})

vim.keymap.set("n", "zm", zen.ataraxis, { noremap = true })

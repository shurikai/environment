local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	--color_scheme = 'tokyonight',
	-- color_scheme = "Kanagawa (Gogh)",
	color_scheme = "kanagawabones",
	-- color_scheme = "nord",
	-- font = wezterm.font("M+CodeLat50 Nerd Font", { weight = "Regular" }),
	font = wezterm.font("IosevkaTermSlab Nerd Font", { weight = "Light" }),
	-- font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Light" }),
	font_size = 16,

	background = {
		{
			source = {
				File = "/Users/x318323/.config/wezterm/background.jpg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.0,
				brightness = 0.3,
			},
			width = "100%",
			height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.70,
		},
	},
	window_padding = {
		left = 14,
		right = 14,
		top = 14,
		bottom = 14,
	},
}

return config

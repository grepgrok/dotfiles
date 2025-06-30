local wez = require("wezterm")
return {
	default_prog = { "zsh" },
	scrollback_lines = 1024,
	warn_about_missing_glyphs = true,
	window_close_confirmation = "NeverPrompt",
	check_for_updates = false,

	------ Appearance -----
	-- window_padding = {
	-- 	left = "24pt",
	-- 	right = "24pt",
	-- 	bottom = "24pt",
	-- 	top = "24pt",
	-- },
	window_background_opacity = 0.7,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.8,
	},

	default_cursor_style = "SteadyUnderline",
	enable_scroll_bar = false,

	-- Tab Bar
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,

	-- Font
	font_size = 16.0,
	cell_width = 1,
	line_height = 1.15,
	dpi = 96.0,
	font = wez.font_with_fallback({
		"0xProto Nerd Font Propo",
		"Material Design Icons",
	}),
	font_rules = {
		{
			italic = true,
			font = wez.font("0xProto Nerd Font Propo", { italic = true }),
		},
	},
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" }, -- font shaping; only when font_shaper = "Harfbuzz"

	-- Colors
	bold_brightens_ansi_colors = true,
	color_scheme = "followSystem",

	----- Technical Details -----
	-- TODO: os dependent; if mac then WebGpu else OpenGL
	front_end = "WebGpu", -- WebGpu allows using Metal for Mac
	enable_wayland = true, -- no effect on Mac
}

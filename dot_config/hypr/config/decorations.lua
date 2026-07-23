hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		extend_border_grab_area = 3,
		resize_on_border = true,
	},
	decoration = {
		dim_special = 0.3,
		rounding = 1,
		active_opacity = 1,
		fullscreen_opacity = 1,
		-- Look and feel configuration
		blur = {
			enabled = true,
			size = 5,
			passes = 1,
			special = true,
		},
		shadow = {
			enabled = false,
		},
	},
})

-- Look and feel configuration

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,
		border_size = 2,
		extend_border_grab_area = 3,
		resize_on_border = false,
	},

	decoration = {
		dim_special = 0.3,
		rounding = 10,
		active_opacity = 1,
		fullscreen_opacity = 1,

    blur = {
			enabled = true,
			size = 1,
			passes = 4,
			special = true,
		},

		shadow = {
      enabled = false,
			range = 8,
		},
	},
})

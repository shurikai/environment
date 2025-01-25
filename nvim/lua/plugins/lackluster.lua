return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		local lackluster = require("lackluster")
		local colors = lackluster.color

		lackluster.setup({
			disable_plugin = {}, -- 'Required' by the plugin, so lua_ls complains without it.
			-- tweak_color = {
			--     -- you can set a value to a custom hexcode like' #aaaa77' (hashtag required)
			--     -- or if the value is 'default' or nil it will use lackluster's default color
			--     -- lack = "#aaaa77",
			--     luster = "#D699B6", -- Spring Violet
			--     lack = "#DBBC7F", -- Wave Aqua
			--     orange = "#E69875", -- Ronin Yellow
			--     yellow = "#DBBC7F", -- Autumn Yellow
			--     green = "#A7C080", -- Autumn Green
			--     blue = "#7FBBB3", -- Dragon Blue
			--     red = "#E67E80", -- Autumn Red
			--     -- WARN: Watchout! messing with grays is probs a bad idea, its very easy to shoot yourself in the foot!
			--     -- black = "default",
			--     -- gray1 = "default",
			--     -- gray2 = "default",
			--     -- gray3 = "default",
			--     -- gray4 = "default",
			--     -- gray5 = "default",
			--     -- gray6 = "default",
			--     -- gray7 = "default",
			--     -- gray8 = "default",
			--     -- gray9 = "default",
			-- },
			-- tweak_syntax = {
			--     comment = colors.gray5,
			--     keyword_return = colors.green,
			--     type = colors.orange,
			-- },
			tweak_background = {
				normal = "none", -- colors.gray2,
			},
		})

		-- vim.cmd.colorscheme("lackluster")
		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
		-- vim.cmd.colorscheme("lackluster-mint")
	end,
}

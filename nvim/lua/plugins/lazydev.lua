return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"${3rd}/luassert/library",
				"${3rd}/busted/library",
				-- "scratchpad.nvim",
				-- Load the wezterm types when the `wezterm` module is required
				-- Needs `justinsgithub/wezterm-types` to be installed
				{ path = "wezterm-types", mods = { "wezterm" } },
			},
		},
		-- disable when a .luarc.json file is found
		-- enabled = function(root_dir)
		-- 	return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
		-- end,
	},
}

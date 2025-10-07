local hl_list = {}
for i, color in pairs({ "#E06C75", "#E5C07B", "#61AFEF", "#D19A66", "#98C379", "#C678DD" }) do
	local name = "IndentBlanklineIndent" .. i
	vim.api.nvim_set_hl(0, name, { fg = color })
	table.insert(hl_list, name)
end

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config

	opts = function()
		return {
			indent = {
				char = "❤︎",
				tab_char = "❤︎",
				highlight = hl_list,
			},
			scope = { show_start = false, show_end = false },
			exclude = {
				filetypes = {
					"Trouble",
					"alpha",
					"dashboard",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
			},
		}
	end,
}

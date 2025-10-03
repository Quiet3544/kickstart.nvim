return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},

		lazy = false, -- neo-tree will lazily load itself

        ---@module 'neo-tree'
        ---@type neotree.Config
        opts = {
            close_if_last_window = true,
            enable_git_status = true,

            
            icon = {
                provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                    if node.type == "file" or node.type == "terminal" then
                        local success, web_devicons = pcall(require, "nvim-web-devicons")
                        local name = node.type == "terminal" and "terminal" or node.name     
                        if success then
                            local devicon, hl = web_devicons.get_icon(name)
                            icon.text = devicon or icon.text
                            icon.highlight = hl or icon.highlight
                        end
                    end
                end,
                default = "*",
                highlight = "NeoTreeFileIcon",
            },
        },


        vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { noremap = true, silent = true }),
    },

}



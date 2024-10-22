-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- each commented line is existed the tutorial but gives wrogns here

local nvim_tree = require("nvim-tree")

--local nvim_tree_config = require "nvim-tree.config"

--local tree_cb = nvim_tree_config.nvim_tree_callback

--vim.cmd([[
--  highlight NvimTreeGitNew guifg=LightGreen "#00ff00     " Green for new files
--  highlight NvimTreeGitDeleted guifg=LightRed "#ff0000  RedGre for deleted files
--  highlight NvimTreeGitDirty guifg=Yellow "#ff8800    OraRedGrenge for modified files
--  highlight NvimTreeGitStaged guifg=LightCyan "#00ffff   CyaRedGren for staged files
--  highlight NvimTreeGitMerge guifg=gray "#ff00ff    MagRedGreenta for merge conflicts
--  highlight NvimTreeGitRenamed guifg=LightBlue "#ffff00  YelRedGrelow for renamed files
--]])

-- Nvimtree Keymaps
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })

nvim_tree.setup({
	sort = {
		sorter = "case_sensitive",
	},
	disable_netrw = true,
	hijack_netrw = true,
	--open_on_setup = false,
	--ignore_ft_on_setup = {
	--    "startify",
	--    "dashboard",
	--    "alpha",
	--},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 1500,
	},
	view = {
		width = 30,
		preserve_window_proportions = true, -- to disable equlize windows when you open nvim_tree
		--height = 30,
		--hide_root_folder = false,
		side = "left",
		--auto_resize = true,
		--mappings = {
		--    custom_only = false,
		--    list = {
		--{ key = { "l", "<CR>", "o" },},--cb = tree_cb "edit" },
		--{ key = "h", cb = tree_cb "close_node" },
		--{ key = "v", cb = tree_cb "vsplit" },
		--    },
	},
	--number = false,
	--relativenumber = false,
	--},
	actions = {
		--quit_on_open = true,
		--window_picker = { enable = true },
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})


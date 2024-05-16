vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-32" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = false -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = true -- to see things like -- INSERT --
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav -- it seems like it's the number of lines before scrolling
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.opt.shortmess:append("c")

vim.opt.shell = "powershell"
--vim.opt.shellcmdflag = '-nologo -noprofile -ExecutePolicy RemoteSigned -command'
vim.opt.shellcmdflag = "-nologo -noprofile -command"
vim.opt.shellxquote = ""

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd([[au CursorHold * :exec 'match Search /\V\<'.expand('<cword>').'\>/']])
--auto highlight current word -- in vim you can use "gd" to do it
--this makes :intro screen disappeard after the hold time and with '../' or './' text makes some mistakes

--Add custom commands
--command

--auto save -- has to be moved to a sparated file
--require "autoSave" this gives '= expected' error

--auto save
local autosave = true

--vim.cmd [[autocmd TextChanged,TextChangedI <buffer> silent write]]

function saveBuffer()
	if vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "TelescopePrompt" then
		vim.cmd("silent write")
	end
end

function autoSaveToggle()
	if autosave then
		vim.cmd([[
              augroup Autosave
              autocmd TextChanged,TextChangedI * lua saveBuffer()
              augroup END
            ]])
		print("AutoSave is On")
	else
		vim.cmd('autocmd! Autosave')
		print("AutoSave is Off")
	end
	autosave = not autosave
end

vim.api.nvim_create_user_command("Autos", function()
	autoSaveToggle()
end, {})

autoSaveToggle()

-- close buffer without its window
vim.api.nvim_create_user_command("Q", function()
	vim.cmd("b#|bd#")
end, {})

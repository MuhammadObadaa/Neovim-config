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

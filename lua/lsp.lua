vim.keymap.set('n', '<A-s>', ':w<CR>', { silent = true, noremap = true })
vim.keymap.set('n', 'Q', ':q<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true, noremap = true })
vim.keymap.set('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>vd', '<Plug>(coc-definition)', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>ga', '<Plug>(coc-codeaction)', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>vl', '<Plug>(coc-codelens-action)', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>n', function() vim.fn['CocActionAsync']('format') end, { silent = false, noremap = true })

function organizeImport()
	vim.fn['CocActionAsync']('runCommand', 'editor.action.organizeImport')
end

vim.api.nvim_create_user_command('OR', organizeImport, {})

function showDocumentation()
	vim.api.nvim_exec(
	[[
		if CocAction('hasProvider', 'hover')
		 call CocAction('doHover')
		else
			call feedkeys('K', in)
		endif
	]],
	true)
end

vim.keymap.set('n', 'K', function() showDocumentation() end, { silent = true, noremap = true })

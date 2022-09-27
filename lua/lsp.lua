local keyset = vim.keymap.set
keyset('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true, noremap = true })
keyset('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true, noremap = true })
keyset('n', '<leader>vd', '<Plug>(coc-definition)', { silent = true, noremap = true })
keyset('n', '<leader>ga', '<Plug>(coc-codeaction)', { silent = true, noremap = true })
keyset('n', '<leader>vl', '<Plug>(coc-codelens-action)', { silent = true, noremap = true })
keyset('n', '<leader>n', function() vim.fn['CocActionAsync']('format') end, { silent = false, noremap = true })

function organizeImport()
  vim.fn['CocActionAsync']('runCommand', 'editor.action.organizeImport')
end

function eslintFix()
  vim.fn['CocActionAsync']('runCommand', 'eslint.executeAutofix')
end

-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<Cmd>lua _G.show_docs()<CR>', {silent = true})


vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
vim.api.nvim_create_user_command('Lint', eslintFix, {})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

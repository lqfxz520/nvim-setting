local keyset = vim.keymap.set
keyset('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true, noremap = true })
keyset('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true, noremap = true })
keyset('n', '<leader>vd', '<Plug>(coc-definition)', { silent = true, noremap = true })
keyset("n", "<leader>vi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "<leader>vr", "<Plug>(coc-references)", {silent = true})
keyset('n', '<leader>ga', '<Plug>(coc-codeaction)', { silent = true, noremap = true })
keyset('n', '<leader>vl', '<Plug>(coc-codelens-action)', { silent = true, noremap = true })
keyset('n', '<leader>n', function() vim.fn['CocActionAsync']('format') end, { silent = false, noremap = true })
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)

local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
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
vim.api.nvim_create_user_command('Lint', "call CocActionAsync('runCommand', 'eslint.executeAutofix')", {})
vim.api.nvim_create_user_command('Prettier', "call CocActionAsync('runCommand', 'prettier.forceFormatDocument')", {})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

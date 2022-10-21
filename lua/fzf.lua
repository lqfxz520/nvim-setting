vim.keymap.set({ 'x', 'n' }, '<leader>f', [[fzf-p]], {})
vim.keymap.set({'n'}, '<leader>fp', [[:<C-u>CocCommand fzf-preview.FromResources project_mru git --resume<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fgs', [[:<C-u>CocCommand fzf-preview.GitStatus<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fga', [[:<C-u>CocCommand fzf-preview.GitActions<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fb', [[:<C-u>CocCommand fzf-preview.Buffers<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fB', [[:<C-u>CocCommand fzf-preview.AllBuffers<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fo', [[:<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>f<C-o>', [[:<C-u>CocCommand fzf-preview.Jumps<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fg;', [[:<C-u>CocCommand fzf-preview.Changes<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>f/', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>f*', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fgr', [[:<C-u>CocCommand fzf-preview.ProjectGrep<Space>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>pw', [[:<C-u>CocCommand fzf-preview.ProjectGrep<Space><C-r>=expand('<cword>')<CR><CR>]], { silent = true, noremap = true })
vim.keymap.set({'x'}, '<leader>fgr', [["sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>ft', [[:<C-u>CocCommand fzf-preview.BufferTags<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fq', [[:<C-u>CocCommand fzf-preview.QuickFix<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>fl', [[:<C-u>CocCommand fzf-preview.LocationList<CR>]], { silent = true, noremap = true })
vim.keymap.set({'n'}, '<leader>ph', [[:<C-u>CocCommand fzf-preview.GrepHelp<CR>]], { silent = true, noremap = true })

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- vim.api.nvim_create_augroup("fzf_preview", {})

-- function fzf_preview_settings()
--   vim.g.fzf_preview_command = 'COLORTERM=truecolor ' .. vim.g.fzf_preview_command
--   print(vim.g.fzf_preview_command)
--   vim.g.fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' .. vim.g.fzf_preview_grep_preview_cmd
-- end

-- vim.api.nvim_create_autocmd("User fzf_preview#rpc#initialized", {
--   group = "fzf_preview",
--   command = "!",
--   callback = fzf_preview_settings
-- })

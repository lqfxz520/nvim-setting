local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
-- local xnoremap = Remap.xnoremap
local opt = { silent = true }
-- -- vim.keymap.set({ 'x', 'n' }, '<leader>f', [[fzf-p]], {})
-- nnoremap('<C-P>', [[:<C-u>CocCommand fzf-preview.FromResources project_mru git --resume<CR>]], opt)
-- nnoremap('<leader>fgs', [[:<C-u>CocCommand fzf-preview.GitStatus<CR>]], opt)
-- nnoremap('<leader>fga', [[:<C-u>CocCommand fzf-preview.GitActions<CR>]], opt)
-- nnoremap('<leader>fb', [[:<C-u>CocCommand fzf-preview.Buffers<CR>]], opt)
-- nnoremap('<leader>fB', [[:<C-u>CocCommand fzf-preview.AllBuffers<CR>]], opt)
-- nnoremap('<leader>fo', [[:<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>]], opt)
-- nnoremap('<leader>f<C-o>', [[:<C-u>CocCommand fzf-preview.Jumps<CR>]], opt)
-- nnoremap('<leader>fg;', [[:<C-u>CocCommand fzf-preview.Changes<CR>]], opt)
-- nnoremap('<leader>f/', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>]], opt)
-- nnoremap('<leader>f*', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>]], opt)
-- nnoremap('<leader>fgr', [[:<C-u>CocCommand fzf-preview.ProjectGrep<Space>]])
-- nnoremap('<leader>pw', [[:<C-u>CocCommand fzf-preview.ProjectGrep<Space><C-r>=expand('<cword>')<CR><CR>]], opt)
-- xnoremap('<leader>fgr', [["sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"]])
-- nnoremap('<leader>ft', [[:<C-u>CocCommand fzf-preview.BufferTags<CR>]], opt)
-- nnoremap('<leader>fq', [[:<C-u>CocCommand fzf-preview.QuickFix<CR>]], opt)
-- nnoremap('<leader>fl', [[:<C-u>CocCommand fzf-preview.LocationList<CR>]], opt)
-- nnoremap('<leader>ph', [[:<C-u>CocCommand fzf-preview.GrepHelp<CR>]], opt)
nnoremap('<C-\\>', [[:<C-u>CocCommand fzf-preview.CocOutline<CR>]], opt)

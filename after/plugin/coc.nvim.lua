local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

vim.o.pumheight = 20
vim.g.coc_global_extensions = {
  'coc-explorer',
  'coc-json',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-yank',
  'coc-fzf-preview',
  '@yaegassy/coc-volar',
  'coc-pairs',
  'coc-snippets',
  'coc-sumneko-lua',
  'coc-utools',
  'coc-git'
}

local opt = { silent = true }
nnoremap('[d', '<Plug>(coc-diagnostic-prev)', opt)
nnoremap(']d', '<Plug>(coc-diagnostic-next)', opt)
nnoremap('<leader>vd', '<Plug>(coc-definition)', opt)
nnoremap("<leader>vi", "<Plug>(coc-implementation)", opt)
nnoremap("<leader>vr", "<Plug>(coc-references)", opt)
nnoremap('<leader>ga', '<Plug>(coc-codeaction)', opt)
nnoremap('<leader>vl', '<Plug>(coc-codelens-action)', opt)
nnoremap('<leader>n', function() vim.fn['CocActionAsync']('format') end, opt)
-- inoremap('<c-j>', '<Plug>(coc-snippets-expand-jump)', opt)
inoremap('<CR>', '<C-g>u<CR><c-r>=coc#on_enter()<CR>', { silent = true, expr = false })

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
xnoremap("<leader>a", "<Plug>(coc-codeaction-selected)", opts)
nnoremap("<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Apply AutoFix to problem on the current line.
nnoremap("<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xnoremap("if", "<Plug>(coc-funcobj-i)", opts)
onoremap("if", "<Plug>(coc-funcobj-i)", opts)
xnoremap("af", "<Plug>(coc-funcobj-a)", opts)
onoremap("af", "<Plug>(coc-funcobj-a)", opts)
xnoremap("ic", "<Plug>(coc-classobj-i)", opts)
onoremap("ac", "<Plug>(coc-classobj-a)", opts)
xnoremap("ac", "<Plug>(coc-classobj-a)", opts)
onoremap("ac", "<Plug>(coc-classobj-a)", opts)

---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true, replace_keycodes = false }
nnoremap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
nnoremap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
inoremap("<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
inoremap("<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vnoremap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vnoremap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use K to show documentation in preview window.
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help', 'lua' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

nnoremap("K", '<Cmd>lua _G.show_docs()<CR>', { silent = true })

-- Auto complete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.refresh_or_expand()
  if not (check_back_space()) then
    return vim.api.nvim_call_function('coc#start', {})
  elseif vim.api.nvim_eval('coc#expandable()') then
    vim.api.nvim_eval('<Plug>(coc-snippets-expand-jump)>')
  elseif vim.fn.index({ 'html', 'typescript', 'javascriptreact', 'css', 'less', 'vue' }, vim.bo.filetype) >= 0 then
    -- vim.cmd([[call CocActionAsync('runCommand', 'emmet.expand-abbreviation')]])
    return vim.cmd([[CocCommand emmet.expand-abbreviation]])
  end
end

inoremap('<c-\\>', "<Cmd>CocCommand emmet.expand-abbreviation<CR>", {silent=true})
inoremap('<c-j>', 'v:lua.refresh_or_expand()', { silent = true, expr = true })
nnoremap("<leader>rn", "<Plug>(coc-rename)", {silent = true})

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
-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder"
})

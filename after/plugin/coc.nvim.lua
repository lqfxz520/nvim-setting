local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local imap = Remap.imap
local vmap = Remap.vmap
local nmap = Remap.nmap

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
  'coc-snippets'
}

local keyset = vim.keymap.set
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
local opts = {silent = true, nowait = true}
xnoremap("<leader>a", "<Plug>(coc-codeaction-selected)", opt)
nnoremap("<leader>a", "<Plug>(coc-codeaction-selected)", opt)

-- Apply AutoFix to problem on the current line.
nnoremap("<leader>qf", "<Plug>(coc-fix-current)", opt)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xnoremap("if", "<Plug>(coc-funcobj-i)", opt)
onoremap("if", "<Plug>(coc-funcobj-i)", opt)
xnoremap("af", "<Plug>(coc-funcobj-a)", opt)
onoremap("af", "<Plug>(coc-funcobj-a)", opt)
xnoremap("ic", "<Plug>(coc-classobj-i)", opt)
onoremap("ac", "<Plug>(coc-classobj-a)", opt)
xnoremap("ac", "<Plug>(coc-classobj-a)", opt)
onoremap("ac", "<Plug>(coc-classobj-a)", opt)

local opt = {silent = true, nowait = true, expr = true}
nnoremap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opt)
nnoremap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opt)
inoremap("<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opt)
inoremap("<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opt)
vnoremap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opt)
vnoremap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opt)

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
nnoremap("K", '<Cmd>lua _G.show_docs()<CR>', { silent = true })

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.refresh_or_expand()
  if _G.check_back_space() then
    vim.api.nvim_eval('coc#refresh()')
  elseif vim.api.nvim_eval('coc#expandable()') then
    vim.api.nvim_eval('<Plug>(coc-snippets-expand)>')
  elseif vim.fn.index({'html', 'typescript', 'javascriptreact', 'css', 'less', 'vue'}, vim.bo.filetype) >= 0 then
    vim.api.nvim_eval('<c-o>:CocCommand emmet.expand-abbreviation<CR>')
  end
end

inoremap('<c-j>', '<CMD>lua _G.refresh_or_expand()<CR>', { silent = truej })

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

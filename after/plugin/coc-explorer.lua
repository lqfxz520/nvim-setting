local Remap = require("restart.keymap")
local nnoremap = Remap.nnoremap
nnoremap('<leader>pv', ':CocCommand explorer<CR>', { nowait = true })
nnoremap('<leader>ff', ':CocCommand explorer --position floating --focus<CR>', { nowait = true })


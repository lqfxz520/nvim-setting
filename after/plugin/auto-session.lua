vim.opt.sessionoptions = 'curdir,folds,help,tabpages,terminal,winsize'

require('auto-session').setup{
  auto_session_suppress_dirs = { '~' },
}

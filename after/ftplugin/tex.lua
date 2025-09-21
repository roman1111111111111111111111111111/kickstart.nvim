-- vimtex keymaps
vim.keymap.set('n', '<leader>xc', '<Plug>(vimtex-compile)', { silent = true, noremap = true, desc = 'Continuous Compile' })
vim.keymap.set('n', '<leader>xv', '<Plug>(vimtex-view)', { silent = true, noremap = true, desc = 'Forward Search' })
vim.keymap.set('n', '<leader>xq', ':copen<CR>', { silent = true, noremap = true, desc = 'Show Errors' })

vim.keymap.set('n', 'dsm', '<Plug>(vimtex-env-delete-math)', { silent = true, noremap = true })
vim.keymap.set('n', 'csm', '<Plug>(vimtex-env-change-math)', { silent = true, noremap = true })
vim.keymap.set('n', 'tsm', '<Plug>(vimtex-env-toggle-math)', { silent = true, noremap = true })

require('luasnip.loaders.from_lua').lazy_load {
  paths = '~/.config/nvim/lua/snippets/',
}

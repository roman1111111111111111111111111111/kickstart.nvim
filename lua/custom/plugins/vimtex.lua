return {
  -- Latex setup
  {
    'lervag/vimtex',
    ft = { 'tex' },
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 0,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-pdf',
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-bibtex',
        },
      }

      vim.g.vimtex_indent_enabled = 0
      vim.g.vimtex_imaps_enabled = 0
      vim.g.vimtex_complete_enabled = 0
      vim.g.vimtex_syntax_enabled = 0
    end,
  },
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    -- vimtex isn't required if using treesitter
    ft = { 'tex' },
    dependencies = {
      'L3MON4D3/LuaSnip',
      'lervag/vimtex',
    },
    opts = {
      use_treesitter = true,
    },
    -- config = function()
    --   require('luasnip-latex-snippets').setup()
    -- end,
  },
}

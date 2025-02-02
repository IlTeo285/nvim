-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  init = function()
    local map = vim.keymap.set
    local set = vim.opt

    local opts = { noremap = true, silent = true, desc = '[G]it [S]status' }
    map('n', '<leader>gs', '<Cmd>Neotree float git_status<CR>', opts)
    vim.api.nvim_create_autocmd('VimEnter', {
      command = 'set nornu nonu | Neotree toggle',
    })
    vim.api.nvim_create_autocmd('BufEnter', {
      command = 'set rnu nu',
    })
  end,
}

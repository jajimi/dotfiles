---@type MappingsTable
local M = {}


M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gl"] = { "<cmd> lua vim.diagnostic.open_float() <CR>", "open "},
    ["<leader>ra"] = {
      function()
        require('neotest').run.run(vim.fn.expand("%"))
        require('neotest').output_panel.open()
        require('neotest').summary.open()
      end,
      "Run test suite", opts = { nowait = true }
    },
    ["<leader>rt"] = {
      function()
        require('neotest').run.run()
        require('neotest').output_panel.open()
        require('neotest').summary.open()
      end,
      "Run test", opts = { nowait = true }
    },
    ["<leader>ct"] = {
      function()
        require('neotest').output_panel.close()
        require('neotest').summary.close()
      end,
      "Close test tools", opts = { nowait = true }
    },
    ["<leader>to"] = {
      function()
        require('neotest').output.open({ last_run = true, enter = true })
      end,
      "Open test output", opts = { nowait = true }
    },
    ['<C-t>'] = {
      function ()
        local ft_cmds = {
          ruby = "bin/rspec " .. vim.fn.expand('%'),
        }
        require('nvterm.terminal').send(ft_cmds[vim.bo.filetype], 'vertical')
      end,
      "Run test in terminal", opts = { nowait = true }
    },
    ['<C-h>'] = { "<cmd> TmuxNavigateLeft <CR>", "window left" },
    ['<C-j>'] = { "<cmd> TmuxNavigateDown <CR>", "window down" },
    ['<C-k>'] = { "<cmd> TmuxNavigateUp <CR>", "window up" },
    ['<C-l>'] = { "<cmd> TmuxNavigateRight <CR>", "window right" },
  },
}

-- more keybinds!

return M

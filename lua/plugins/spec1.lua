return {
  -- the colorscheme should be available when starting Neovim
  {
    "OmniSharp/omnisharp-vim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
    end,
  },


  {
    'dense-analysis/ale',
    config = function()
        -- Set omnisharp executable
        vim.g.ale_cs_omnisharp_executable = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp"
        -- Configuration goes here.
        local g = vim.g
         -- Set DOTNET_ROOT environment variable if needed
        vim.g.ale_cs_omnisharp_options = '--hostPID ' .. vim.fn.getpid()
        g.ale_ruby_rubocop_auto_correct_all = 1
        vim.g.ale_completion_enabled = 1
        g.ale_linters = {
            cs = {'OmniSharp'},
            lua = {'lua_language_server'}
        }
    end,
  },
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
     "MunifTanjim/nui.nvim",
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{ 'echasnovski/mini.nvim', version = false },
 {
        'neoclide/coc.nvim',
        branch = 'release',
        lazy = false, -- Load immediately or use conditions like lazy=true for deferred loading
        config = function()
            -- Optional configuration settings for coc.nvim can go here
        end,
    }

}

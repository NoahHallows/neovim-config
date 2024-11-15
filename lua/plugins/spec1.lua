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
        vim.g.ale_completion_enabled = 0
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
    },

     {
    'hrsh7th/nvim-cmp',
    enabled = false,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',        -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',         -- Buffer completions
      'hrsh7th/cmp-path',           -- Path completions
      'hrsh7th/cmp-cmdline',        -- Command-line completions
      'saadparwaiz1/cmp_luasnip',   -- Snippet completions
      'L3MON4D3/LuaSnip',           -- Snippet engine
    },
    config = function()
      -- Setup nvim-cmp
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Use LuaSnip for snippets
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For LuaSnip users
        }, {
          { name = 'buffer' },
        })
      })
    end
  }

}

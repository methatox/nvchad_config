local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end
            }
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end -- Override to setup mason-lspconfig
    }, -- override plugin configs
    {"williamboman/mason.nvim", opts = overrides.mason}, {
        "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim"
        }
    }, {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim"
        },
        config = function()
            -- Configuration for the "rcarriga/nvim-dap-ui" plugin
            require("dapui").setup()
        end

    }, {
        "mfussenegger/nvim-dap",
        requires = {
            {
                "Pocco81/DAPInstall.nvim",
                config = function()
                    require("dap-install").config("dap")
                end
            }
            -- Add other dependencies if needed
        }
    }, {"nvim-treesitter/nvim-treesitter", opts = overrides.treesitter}, {
        -- configure dashboard here
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("dashboard").setup({
                theme = 'hyper',
                config = {
                    week_header = {enable = true},
                    shortcut = {
                        {
                            desc = '󰊳 Update',
                            group = '@property',
                            action = 'Lazy update',
                            key = 'u'
                        }, {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f'
                        }, {
                            desc = ' Apps',
                            group = 'DiagnosticHint',
                            action = 'Telescope.extensions.projects.projects{}',
                            key = 'a'
                        }, {
                            desc = ' dotfiles',
                            group = 'Number',
                            action = 'Telescope dotfiles',
                            key = 'd'
                        }
                    }
                }
            })
        end

    }, -- https://github.com/ahmedkhalf/project.nvim
  {
 'ahmedkhalf/project.nvim'
  },
    {"nvim-tree/nvim-tree.lua", opts = overrides.nvimtree}, -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function() require("better_escape").setup() end
    }

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins

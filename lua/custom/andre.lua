local dapui = require("dapui")
local dap = require("dap")

local php_config = {
    {type = "php", request = "launch", name = "Listen for Xdebug", port = 9003}
}

local php_adapter = {
    type = 'executable',
    command = 'node',
    port = 9003,
    args = {
        '/home/andre/.config/nvim/vscode-php-debug/out/phpDebug.js', '--port',
        '9003'
    },
    log = true,
    pathMappings = {
        {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/home/andre/.config/nvim/custom"
        }
    }
}

dap.configurations.php = php_config
dap.adapters.php = php_adapter

dapui.setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r"
    },
    sidebar = {
        elements = {
            {id = "scopes", size = 0.25}, {id = "breakpoints", size = 0.25},
            {id = "stacks", size = 0.25}, {id = "watches", size = 0.25}
        },
        size = 40,
        position = "left"
    },
    tray = {elements = {"repl"}, size = 10, position = "bottom"},
    floating = {
        max_height = nil, -- These can be adjusted to your preference
        max_width = nil
    }
})

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

require'lspconfig'.phpactor.setup{}

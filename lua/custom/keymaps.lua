-- TODO MAKE THIS WORK!
-- vim.keymap.set('n', '<Leader>ds', function() require('dap').run() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>bt',
               function() require('dap').toggle_breakpoint() end)
vim.keymap
    .set('n', '<Leader>bp', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>bpl', function()
    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)

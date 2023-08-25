# download nvim
this configuration requires nvim version 0.9.x or higher.
follow the instruction on <a href="https://github.com/neovim/neovim/tree/release-0.9">neovims github repo</a>

# neovim

Delete old configs (recommended to make a backup)

`rm -rf ~/.local/share/nvim`

`rm -rf ~/.config/nvim`

`git clone https://github.com/mehtatox/neovim.git ~/.config/nvim --depth 1 && nvim`

Restart nvim and go

<Leader>+ch is the cheatsheet. For own configured keymaps take a look under ./lua/custom/keymaps.lua 

# known issues
<ul>
<li>
debugger has to be started with a click on the green arrow, after toggling the debugger ui with space+du or `require'dapui'.toggle()`
</li>
<li>
in the dashboard the apps are currently not working
</li>
<li>
in the dashboard the dotfiles are currently not working
</li>


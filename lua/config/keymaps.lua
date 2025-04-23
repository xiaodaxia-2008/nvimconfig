-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<escape>")

-- powershell
vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal("pwsh.exe")
end, { desc = "Terminal Powershell(cwd)" })

-- msvc dev tools environment
vim.keymap.set("n", "<leader>fT", function()
  local cmd = [[ pwsh.exe -NoExit -Command "&{Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell c134da13 -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""}" ]]
  local cwd = LazyVim.root().. "/build"
  if vim.fn.isdirectory(cwd) == 0 then
    cwd = LazyVim.root()
  end
  Snacks.terminal(cmd, { cwd = cwd })
end, { desc = "Msvc Dev Environment Powershell(build)" })

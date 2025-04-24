-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<escape>")

-- powershell
vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal("pwsh.exe")
end, { desc = "Terminal Powershell(cwd)" })

local open_msvc_dev_env = function()
  local cmd = [[ 
    pwsh.exe -NoExit -Command 
    "&{
    Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; 
    Enter-VsDevShell c134da13 -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""
    ]]
  local cwd = LazyVim.root() .. "/build"
  if vim.fn.isdirectory(cwd) == 0 then
    cwd = LazyVim.root()
  end
  local venv_dir = LazyVim.root() .. "/.venv"
  if vim.fn.isdirectory(venv_dir) == 1 then
    local activate_script = string.format("%s/Scripts/activate.ps1", venv_dir)
    if vim.fn.filereadable(activate_script) == 1 then
      print("python venv activate script is detected at: " .. activate_script)
      cmd = cmd .. "; " .. activate_script
    end
  end

  cmd = cmd .. ' }"'
  cmd = cmd:gsub("[\r\n]", " ")
  print("cmd: " .. cmd)
  Snacks.terminal(cmd, { cwd = cwd })
end

-- msvc dev tools environment
vim.keymap.set("n", "<leader>fT", open_msvc_dev_env, { desc = "Msvc Dev Environment Powershell(build)" })
vim.keymap.set("n", "<c-/>", open_msvc_dev_env, { desc = "Msvc Dev Environment Powershell(build)" })
vim.keymap.set("n", "<c-_>", open_msvc_dev_env, { desc = "Msvc Dev Environment Powershell(build)" })

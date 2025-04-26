return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
  _____            ____  _                          
 |__  /___ _ __   / ___|| |__   __ ___      ___ __  
   / // _ \ '_ \  \___ \| '_ \ / _` \ \ /\ / / '_ \ 
  / /|  __/ | | |  ___) | | | | (_| |\ V  V /| | | |
 /____\___|_| |_| |____/|_| |_|\__,_| \_/\_/ |_| |_|
                                                    
        ]]
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}

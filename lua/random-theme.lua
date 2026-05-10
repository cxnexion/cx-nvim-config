local themes = { "vague", "rose-pine", "catppuccin" }

math.randomseed(os.time())
local random_theme = themes[math.random(#themes)]

vim.cmd.colorscheme(random_theme)

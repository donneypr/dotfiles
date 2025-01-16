return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = false -- Set to true if you would like to enable transparency
    local bg = "#1e1e2e"      -- Gray/black background
    local bg_dark = "#16161e" -- Darker gray
    local bg_highlight = "#2a2a37"
    local bg_search = "#3a3a4e"
    local bg_visual = "#44475a" -- Visual selection background
    local fg = "#c5c8c6"       -- Light gray foreground
    local fg_dark = "#a9a9b3"  -- Darker gray text
    local fg_gutter = "#8b8b99"
    local border = "#5e5e6e"

    require("tokyonight").setup({
      style = "night", -- Use the "night" style for a dark theme
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}


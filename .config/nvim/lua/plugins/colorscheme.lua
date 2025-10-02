return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      on_colors = function(colors)
        -- local bg_dark = "#16161e"
        -- colors.bg = "#1a1b26"
        local bg_dark = "#1a1b26"
        colors.bg = "#16161e"
        colors.bg_dark = bg_dark
        colors.bg_dark1 = "#0C0E14"
        colors.bg_float = bg_dark
        colors.bg_highlight = "#292e42"
        colors.bg_popup = bg_dark
        colors.bg_search = "#3d59a1"
        colors.bg_sidebar = bg_dark
        colors.bg_statusline = bg_dark
        colors.bg_visual = "#283457"
      end,
    },
  },
}

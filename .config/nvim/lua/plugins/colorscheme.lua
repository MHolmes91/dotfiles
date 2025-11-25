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
      on_highlights = function(hl, c)
        -- p3 displays
        local bufferline_bg = "#0C0C10"
        -- srgb displays
        -- local bufferline_bg = "#0A0A0C"

        -- Bufferline specific highlight groups
        hl.BufferLineFill = { bg = bufferline_bg } -- background/fill area
        hl.BufferLineBackground = { bg = bufferline_bg, fg = c.fg_dark } -- inactive buffers
        hl.BufferLineBufferVisible = { bg = bufferline_bg, fg = c.fg_dark }
        hl.BufferLineBufferSelected = { bg = c.bg, fg = c.blue, bold = true } -- active buffer
        hl.BufferLineTab = { bg = bufferline_bg, fg = c.fg_dark }
        hl.BufferLineTabSelected = { bg = c.bg, fg = c.blue }
        hl.BufferLineTabSeparator = { bg = bufferline_bg, fg = bufferline_bg }
        hl.BufferLineSeparator = { bg = bufferline_bg, fg = bufferline_bg }
      end,
    },
  },
}

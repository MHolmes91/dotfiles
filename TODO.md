# Everforest Light Soft — Remaining Migration

Palette ref (sainnhe/everforest, light soft):

```
bg0  #fdf6e3   fg     #5c6a72
bg1  #f4f0d9   red    #f85552
bg2  #efebd4   orange #f57d26
bg_dim #f2efdf yellow #dfa000
grey0 #a6b0a0  green  #8da101
grey1 #939f91  aqua   #35a77c
grey2 #829181  blue   #3a94c5
                purple #df69ba
```

## 5. Waybar hardcoded hex (`.config/waybar/style.css`)

File pulls `@background`/`@foreground` from `../omarchy/current/theme/waybar.css` (handled by step 6). Remaining hardcoded hex to recolor:

- Line 94: `.custom-mediaplayer { background-color: #202330; }` → `#efebd4` (bg2)
- Line 98: `.custom-spotify { background-color: #1db954; color: black; }` → keep (Spotify brand)
- Line 88: `#custom-screenrecording-indicator.active { color: #a55555; }` → `#f85552` (red)
- Line 107: `#custom-voxtype.recording { color: #a55555; }` → `#f85552`
- Lines 112-113: idle/notification-silence indicators `color: #a55552` → `#f85552`

## 6. Omarchy theme (Linux box only — drives Waybar via `~/.config/omarchy/current` symlink)

Source of truth on Linux. Steps on that machine:

1. Create theme dir: `~/.config/omarchy/themes/everforest-light-soft/`
2. Add `theme/waybar.css` defining:
   ```css
   @define-color background #fdf6e3;
   @define-color foreground #5c6a72;
   ```
   Plus any other vars Omarchy expects (check existing `current/theme/waybar.css` for full var list).
3. Mirror file structure of existing Omarchy themes (compare against current tokyonight dir).
4. Switch: `omarchy-theme-set everforest-light-soft` (or repoint `~/.config/omarchy/current` symlink directly).
5. Update `.config/omarchy/hooks/theme-set` if wallpaper logic needs adjustment — currently sets `backgrounds/shared/black.png`. Decide: keep black, or supply light bg later.

## Verify checklist (Linux box)

- [ ] `hyprctl reload`
- [ ] `pkill -SIGUSR2 waybar` (reload waybar)
- [ ] Restart Ghostty
- [ ] Open Neovim — confirm `:colorscheme` reports `everforest`, bg=light
- [ ] Open opencode — confirm theme renders (may need custom light variant if built-in `everforest` is dark only)
- [ ] gitui — confirm selection contrast acceptable

## Open

- opencode built-in `everforest` may be dark-only. If so, write custom theme JSON or pick `github_light` / similar.
- p3 colorspace + `font-thicken` in Ghostty on light bg — retune `font-thicken-strength` if text feels heavy.

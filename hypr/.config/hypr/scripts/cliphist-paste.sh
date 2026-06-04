#!/bin/bash

# 1. Open fuzzel and copy selection to clipboard
if ! cliphist list | fuzzel --dmenu | cliphist decode | wl-copy; then
    exit 0 # Exit quietly if user presses Escape
fi

# 2. Get the active window class (converted to lowercase)
WINDOW_CLASS=$(hyprctl activewindow -j | jq -r '.class' | tr '[:upper:]' '[:lower:]')

# 3. Define your terminal app names here
# (Common: kitty, alacritty, foot, wezterm)
if [[ "$WINDOW_CLASS" =~ "kitty"|"alacritty"|"foot"|"wezterm" ]]; then
    hyprctl dispatch sendshortcut "CTRL_SHIFT, V, activewindow"
else
    hyprctl dispatch sendshortcut "CTRL, V, activewindow"
fi

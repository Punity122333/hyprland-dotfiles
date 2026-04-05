# GDK BACKEND. Change to either wayland or x11 if having issues
BACKEND=wayland

# Check if rofi or yad is running and kill them if they are
if pidof rofi > /dev/null; then
  pkill rofi
fi

if pidof yad > /dev/null; then
  pkill yad
fi

# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad \
    --center \
    --title="KooL Quick Cheat Sheet" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
    --search-column=1 \
"ESC" "close this app" "" "SUPER = WINDOWS KEY" "SUPER KEY (Windows Key Button)" "(SUPER KEY)" \
"SUPER SHIFT K" "Searchable Keybinds" "(Search all Keybinds via rofi)" \
"SUPER SHIFT E" "Hyprland Settings Menu" "" \
"" "" "" \
"SUPER ENTER" "Terminal" "(kitty)" \
"SUPER SHIFT ENTER" "DropDown Terminal" "(kitty)" \
"SUPER A" "Desktop Overview" "through AGS" \
"SUPER B" "Launch Browser" "(Default browser)" \
"SUPER D" "Application Launcher" "(rofi-wayland)" \
"SUPER E" "Open File Manager" "(Thunar)" \
"SUPER S" "Google Search using rofi" "(rofi)" \
"SUPER Q" "close active window" "(not kill)" \
"SUPER SHIFT Q " "kills an active window" "(kill)" \
"SUPER ALT mouse scroll up/down   " "Desktop Zoom" "Desktop Magnifier" \
"SUPER ALT V" "Clipboard Manager" "(cliphist)" \
"SUPER W" "Choose wallpaper" "(Wallpaper Menu)" \
"SUPER SHIFT W" "Choose wallpaper effects" "(imagemagick + swww)" \
"CTRL ALT W" "Random wallpaper" "(via swww)" \
"SUPER CTRL ALT B" "Hide/UnHide Waybar" "waybar" \
"SUPER CTRL B" "Choose waybar styles" "(waybar styles)" \
"SUPER ALT B" "Choose waybar layout" "(waybar layout)" \
"SUPER ALT R" "Reload Waybar swaync Rofi" "CHECK NOTIFICATION FIRST!!!" \
"SUPER SHIFT N" "Launch Notification Panel" "swaync Notification Center" \
"SUPER PRINT" "screenshot" "(grim + slurp)" \
"SUPER SHIFT S" "screenshot region" "(grim + slurp)" \
"SUPER CTRL PRINT" "screenshot timer 5 secs " "(grim + slurp)" \
"SUPER CTRL SHIFT PRINT" "screenshot timer 10 secs " "(grim + slurp)" \
"ALT PRINT" "Screenshot active window" "active window only" \
"SUPER ALT ARROW KEYS" "Swap windows in specified direction" "swaps active window" \
"SUPER SHIFT D" "OCR from selected region" "(grim + slurp + tesseract + wl-copy)" \
"SUPER ALT D" "OCR fullscreen" "(grim + tesseract + wl-copy)" \
"CTRL ALT P" "power-menu" "(wlogout)" \
"CTRL ALT L" "screen lock" "(hyprlock)" \
"CTRL ALT Del" "Hyprland Exit" "(NOTE: Hyprland Will exit immediately)" \
"SUPER SHIFT F" "Fullscreen" "Toggles to full screen" \
"SUPER CTL F" "Fake Fullscreen" "Toggles to fake full screen" \
"SUPER ALT L" "Toggle Dwindle | Master Layout" "Hyprland Layout" \
"SUPER SPACEBAR" "Toggle float" "single window" \
"SUPER ALT SPACEBAR" "Toggle all windows to float" "all windows" \
"SUPER ALT O" "Toggle Blur" "normal or less blur" \
"SUPER CTRL O" "Toggle Opaque ON or OFF" "on active window only" \
"SUPER Shift A" "Animations Menu" "Choose Animations via rofi" \
"SUPER CTRL R" "Rofi Themes Menu" "Choose Rofi Themes via rofi" \
"SUPER CTRL Shift R" "Rofi Themes Menu v2" "Choose Rofi Themes via Theme Selector (modified)" \
"SUPER SHIFT G" "Gamemode! All animations OFF or ON" "toggle" \
"SUPER ALT E" "Rofi Emoticons" "Emoticon" \
"SUPER H" "Launch this Quick Cheat Sheet" "" \
"" "" "" \
"SUPER SHIFT DELETE" "Restart Hyprland" "restart-hyprland.sh" \
"SUPER ALT R" "Refresh Waybar, swaync, rofi" "Refresh.sh" \
"SUPER ALT E" "Emoji Menu" "RofiEmoji.sh" \
"SUPER S" "Google Search (rofi)" "RofiSearch.sh" \
"SUPER ALT O" "Toggle Blur" "ChangeBlur.sh" \
"SUPER SHIFT G" "Toggle Animations ON/OFF" "GameMode.sh" \
"SUPER ALT L" "Toggle Master/Dwindle Layout" "ChangeLayout.sh" \
"SUPER ALT V" "Clipboard Manager" "ClipManager.sh" \
"SUPER CTRL R" "Rofi Theme Selector" "RofiThemeSelector.sh" \
"SUPER CTRL SHIFT R" "Rofi Theme Selector (modified)" "RofiThemeSelector-modified.sh" \
"SUPER SHIFT F" "Fullscreen" "fullscreen" \
"SUPER CTRL F" "Fake Fullscreen" "fullscreen, 1" \
"SUPER SPACE" "Toggle Floating" "togglefloating" \
"SUPER ALT SPACE" "All Float Mode" "workspaceopt allfloat" \
"SUPER SHIFT RETURN" "Dropdown Terminal" "[float; move 15% 5%; size 70% 60%] $term" \
"SUPER LEFT ALT mouse_down" "Desktop Zoom In" "misc:cursor_zoom_factor * 2.0" \
"SUPER LEFT ALT mouse_up" "Desktop Zoom Out" "misc:cursor_zoom_factor / 2.0" \
"SUPER CTRL ALT B" "Hide/UnHide Waybar" "pkill -SIGUSR1 waybar" \
"SUPER CTRL B" "Waybar Styles Menu" "WaybarStyles.sh" \
"SUPER ALT B" "Waybar Layout Menu" "WaybarLayout.sh" \
"SUPER SHIFT M" "Online Music (rofi)" "RofiBeats.sh" \
"SUPER W" "Select Wallpaper" "WallpaperSelect.sh" \
"SUPER SHIFT W" "Wallpaper Effects" "WallpaperEffects.sh" \
"CTRL ALT W" "Random Wallpaper" "WallpaperRandom.sh" \
"SUPER CTRL O" "Toggle Opaque on Active Window" "setprop active opaque toggle" \
"SUPER SHIFT K" "Search Keybinds (rofi)" "KeyBinds.sh" \
"SUPER SHIFT A" "Animations Menu" "Animations.sh" \
"SUPER SHIFT O" "Change oh-my-zsh Theme" "ZshChangeTheme.sh" \
"LEFT ALT LEFT SHIFT" "Switch Keyboard Layout" "SwitchKeyboardLayout.sh" \
"SUPER ALT C" "Calculator" "RofiCalc.sh" \
"CTRL ALT DELETE" "Exit Hyprland" "hyprctl dispatch exit 0" \
"SUPER Q" "Close Active Window" "killactive" \
"SUPER SHIFT Q" "Kill Active Process" "KillActiveProcess.sh" \
"CTRL ALT L" "Lock Screen" "LockScreen.sh" \
"CTRL ALT P" "Power Menu" "Wlogout.sh" \
"SUPER SHIFT N" "Notification Panel" "swaync-client -t -sw" \
"SUPER SHIFT E" "Settings Menu" "Kool_Quick_Settings.sh" \
"SUPER CTRL D" "Remove Master (layout)" "layoutmsg removemaster" \
"SUPER I" "Add Master (layout)" "layoutmsg addmaster" \
"SUPER J" "Cycle Next (layout)" "layoutmsg cyclenext" \
"SUPER K" "Cycle Prev (layout)" "layoutmsg cycleprev" \
"SUPER CTRL RETURN" "Swap with Master" "layoutmsg swapwithmaster" \
"SUPER SHIFT I" "Toggle Split (dwindle)" "togglesplit" \
"SUPER P" "Pseudo (dwindle)" "pseudo" \
"SUPER M" "Split Ratio 0.3" "splitratio 0.3" \
"SUPER G" "Toggle Group" "togglegroup" \
"SUPER CTRL TAB" "Change Group Active" "changegroupactive" \
"LEFT ALT TAB" "Cycle Next Window" "cyclenext" \
"LEFT ALT TAB" "Bring Active Window to Top" "bringactivetotop" \
"SUPER PRINT" "Screenshot" "grim + wl-copy" \
"SUPER SHIFT PRINT" "Screenshot Region" "grim + slurp + wl-copy" \
"SUPER CTRL PRINT" "Screenshot Timer 5s" "sleep 5 + grim + wl-copy" \
"SUPER CTRL SHIFT PRINT" "Screenshot Timer 10s" "sleep 10 + grim + wl-copy" \
"LEFT ALT PRINT" "Screenshot Active Window" "grim + slurp -b" \
"SUPER SHIFT S" "Screenshot Region (swappy)" "grim + slurp + wl-copy" \
"SUPER SHIFT P" "Screenshot Region to Pictures" "grim + slurp + notify-send" \
"SUPER SHIFT D" "OCR Region to Clipboard" "grim + slurp + tesseract + wl-copy" \
"SUPER ALT D" "OCR Fullscreen to Clipboard" "grim + tesseract + wl-copy" \
"SUPER SHIFT left/right/up/down" "Resize Active Window" "resizeactive" \
"SUPER CTRL left/right/up/down" "Move Window" "movewindow" \
"SUPER ALT left/right/up/down" "Swap Window" "swapwindow" \
"SUPER left/right/up/down" "Move Focus" "movefocus" \
"SUPER TAB" "Next Workspace" "workspace m+1" \
"SUPER SHIFT TAB" "Previous Workspace" "workspace m-1" \
"SUPER SHIFT U" "Move to Special Workspace" "movetoworkspace special" \
"SUPER U" "Toggle Special Workspace" "togglespecialworkspace" \
"SUPER [0-9]" "Switch Workspace" "workspace [number]" \
"SUPER SHIFT [0-9]" "Move Window to Workspace" "movetoworkspace [number]" \
"SUPER CTRL [0-9]" "Move Window to Workspace Silently" "movetoworkspacesilent [number]" \
"SUPER mouse_down" "Next Workspace (scroll)" "workspace e+1" \
"SUPER mouse_up" "Previous Workspace (scroll)" "workspace e-1" \
"SUPER ." "Next Workspace" "workspace e+1" \
"SUPER ," "Previous Workspace" "workspace e-1" \
"SUPER SHIFT [" "Move Window to Previous Workspace" "movetoworkspace -1" \
"SUPER SHIFT ]" "Move Window to Next Workspace" "movetoworkspace +1" \
"SUPER CTRL [" "Move Window to Previous Workspace Silently" "movetoworkspacesilent -1" \
"SUPER CTRL ]" "Move Window to Next Workspace Silently" "movetoworkspacesilent +1" \
"SUPER mouse:272" "Move Window (drag)" "movewindow" \
"SUPER mouse:273" "Resize Window (drag)" "resizewindow" \
"CTRL SHIFT RIGHT" "Medium Mouse Move Right (ydotool)" "sudo ydotool mousemove -- 40 0" \
"CTRL SHIFT LEFT" "Medium Mouse Move Left (ydotool)" "sudo ydotool mousemove -- -40 0" \
"CTRL SHIFT UP" "Medium Mouse Move Up (ydotool)" "sudo ydotool mousemove -- 0 -40" \
"CTRL SHIFT DOWN" "Medium Mouse Move Down (ydotool)" "sudo ydotool mousemove -- 0 40" \
"CTRL SHIFT ALT RIGHT" "Extra Fine Mouse Move Right (ydotool)" "sudo ydotool mousemove -- 5 0" \
"CTRL SHIFT ALT LEFT" "Extra Fine Mouse Move Left (ydotool)" "sudo ydotool mousemove -- -5 0" \
"CTRL SHIFT ALT UP" "Extra Fine Mouse Move Up (ydotool)" "sudo ydotool mousemove -- 0 -5" \
"CTRL SHIFT ALT DOWN" "Extra Fine Mouse Move Down (ydotool)" "sudo ydotool mousemove -- 0 5" \
"CTRL SHIFT ALT ENTER" "Extra Fine Mouse Left Click (ydotool)" "sudo ydotool click C0" \
"KP_HOME" "Mouse Move Diagonal Left-Up (ydotool)" "sudo ydotool mousemove -- -40 -40" \
"KP_PRIOR" "Mouse Move Diagonal Right-Up (ydotool)" "sudo ydotool mousemove -- 40 -40" \
"KP_END" "Mouse Move Diagonal Left-Down (ydotool)" "sudo ydotool mousemove -- -40 40" \
"KP_NEXT" "Mouse Move Diagonal Right-Down (ydotool)" "sudo ydotool mousemove -- 40 40" \
"KP_LEFT" "Mouse Move Left (ydotool)" "sudo ydotool mousemove -- -40 0" \
"KP_RIGHT" "Mouse Move Right (ydotool)" "sudo ydotool mousemove -- 40 0" \
"KP_UP" "Mouse Move Up (ydotool)" "sudo ydotool mousemove -- 0 -40" \
"KP_DOWN" "Mouse Move Down (ydotool)" "sudo ydotool mousemove -- 0 40" \
"KP_BEGIN" "Mouse Left Click (ydotool)" "sudo ydotool click C0" \
"KP_DIVIDE" "Mouse Click (ydotool)" "sudo ydotool click 0x40" \
"KP_MULTIPLY" "Mouse Click (ydotool)" "sudo ydotool click 0x42 0x82" \
"KP_SUBTRACT" "Mouse Click (ydotool)" "sudo ydotool click 0x41 0x81" \
"KP_INSERT" "Mouse Toggle Click (ydotool)" "sudo sh -c 'if [ \"$(cat /tmp/mouse_state)\" = \"40\" ]; then echo \"80\" > /tmp/mouse_state && ydotool click 0x80; else echo \"40\" > /tmp/mouse_state && ydotool click 0x40; fi'" \
"SHIFT KP_HOME" "Fine Mouse Move Diagonal Left-Up (ydotool)" "sudo ydotool mousemove -- -10 -10" \
"SHIFT KP_PRIOR" "Fine Mouse Move Diagonal Right-Up (ydotool)" "sudo ydotool mousemove -- 10 -10" \
"SHIFT KP_END" "Fine Mouse Move Diagonal Left-Down (ydotool)" "sudo ydotool mousemove -- -10 10" \
"SHIFT KP_NEXT" "Fine Mouse Move Diagonal Right-Down (ydotool)" "sudo ydotool mousemove -- 10 10" \
"SHIFT KP_LEFT" "Fine Mouse Move Left (ydotool)" "sudo ydotool mousemove -- -10 0" \
"SHIFT KP_RIGHT" "Fine Mouse Move Right (ydotool)" "sudo ydotool mousemove -- 10 0" \
"SHIFT KP_UP" "Fine Mouse Move Up (ydotool)" "sudo ydotool mousemove -- 0 -10" \
"SHIFT KP_DOWN" "Fine Mouse Move Down (ydotool)" "sudo ydotool mousemove -- 0 10" \
"SHIFT KP_BEGIN" "Fine Mouse Left Click (ydotool)" "sudo ydotool click C0" \
"SHIFT KP_DIVIDE" "Fine Mouse Click (ydotool)" "sudo ydotool click 0x40" \
"SHIFT KP_MULTIPLY" "Fine Mouse Click (ydotool)" "sudo ydotool click 0x42 0x82" \
"SHIFT KP_SUBTRACT" "Fine Mouse Click (ydotool)" "sudo ydotool click 0x41 0x81" \

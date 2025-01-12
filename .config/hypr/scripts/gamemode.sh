#!/bin/bash

# Store the original animation values (if you want to restore them later)
save_animations() {
    hyprctl animations list | grep -B 2 "^$" | grep enabled > ~/.cache/hypr/animations_backup
}

# Disable animations and effects for gaming mode
enable_gamemode() {
    # Disable all animations
    hyprctl keyword animations:enabled 0
    
    # Disable blur
    hyprctl keyword decoration:blur:enabled 0
    
    # Disable rounded corners
    hyprctl keyword decoration:rounding 0
    
    # Disable window shadows
    hyprctl keyword decoration:drop_shadow 0
    
    # Disable window borders
    hyprctl keyword general:border_size 0
    
    # Optional: Set maximum performance settings
    hyprctl keyword misc:vfr 1  # Variable refresh rate
    hyprctl keyword misc:no_direct_scanout 0  # Enable direct scanout
    
    # Notify user via ags
    ags -r "notify('Game Mode Enabled', 'Performance optimizations active')"
    
    echo "Game Mode Enabled"
}

# Restore normal settings
disable_gamemode() {
    # Re-enable animations
    hyprctl keyword animations:enabled 1
    
    # Restore blur
    hyprctl keyword decoration:blur:enabled 1
    
    # Restore rounded corners (adjust value as needed)
    hyprctl keyword decoration:rounding 10
    
    # Restore window shadows
    hyprctl keyword decoration:drop_shadow 1
    
    # Restore window borders (adjust value as needed)
    hyprctl keyword general:border_size 2
    
    # Restore default performance settings
    hyprctl keyword misc:vfr 1
    hyprctl keyword misc:no_direct_scanout 1
    
    # Notify user via ags
    ags -r "notify('Game Mode Disabled', 'Normal settings restored')"
    
    echo "Game Mode Disabled"
}

# Check command line argument
case "$1" in
    "enable")
        enable_gamemode
        ;;
    "disable")
        disable_gamemode
        ;;
    *)
        echo "Usage: $0 {enable|disable}"
        exit 1
        ;;
esac

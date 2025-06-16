#!/bin/bash

# Exit on error
set -e

# Base directory for dotfiles
DOTFILES="$HOME/Dotfiles"

# Function to create parent directories if they don't exist
create_parent_dir() {
    local file_path="$1"
    local parent_dir=$(dirname "$file_path")
    if [ ! -d "$parent_dir" ]; then
        mkdir -p "$parent_dir"
    fi
}

# Function to backup existing file/directory
backup_existing() {
    local target="$1"
    if [ -e "$target" ]; then
        local backup_path="${target}.backup"
        if [ -e "$backup_path" ]; then
            rm -rf "$backup_path"
        fi
        mv "$target" "$backup_path"
        echo "Backed up existing $target to $backup_path"
    fi
}

# Check if we're in the correct directory
if [ ! -d "$DOTFILES" ]; then
    echo "Error: $DOTFILES directory not found!"
    echo "Please run this script from your dotfiles directory."
    exit 1
fi

# Create symbolic links for .config directories
echo "Creating symbolic links for .config directories..."
if [ -d "$DOTFILES/.config" ]; then
    for dir in "$DOTFILES/.config/"*/; do
        if [ -d "$dir" ]; then
            config_name=$(basename "$dir")
            target="$HOME/.config/$config_name"
            create_parent_dir "$target"
            backup_existing "$target"
            ln -sfn "$dir" "$target"
            echo "Linked: .config/$config_name"
        fi
    done
else
    echo "Warning: No .config directory found in $DOTFILES"
fi

# Create symbolic links for dotfiles in root directory
echo -e "\nCreating symbolic links for dotfiles..."
for file in "$DOTFILES"/.*; do
    # Skip . and .. and .git directory
    if [[ ! "$file" =~ /\.{1,2}$ ]] && [ "$file" != "$DOTFILES/.git" ] && [ -f "$file" ]; then
        filename=$(basename "$file")
        target="$HOME/$filename"
        create_parent_dir "$target"
        backup_existing "$target"
        ln -sf "$file" "$target"
        echo "Linked: $filename"
    fi
done

echo -e "\nDotfiles installation completed successfully!"
echo "Note: Any existing files were backed up with .backup extension" 
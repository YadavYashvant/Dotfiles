#!/bin/bash

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

# Create symbolic links for .config directories
echo "Creating symbolic links for .config directories..."
for dir in "$DOTFILES/.config/"*/; do
    if [ -d "$dir" ]; then
        config_name=$(basename "$dir")
        target="$HOME/.config/$config_name"
        create_parent_dir "$target"
        ln -sfn "$dir" "$target"
        echo "Linked: .config/$config_name"
    fi
done

# Create symbolic links for dotfiles in root directory
echo -e "\nCreating symbolic links for dotfiles..."
for file in "$DOTFILES"/.*; do
    # Skip . and .. and .git directory
    if [[ ! "$file" =~ /\.{1,2}$ ]] && [ "$file" != "$DOTFILES/.git" ] && [ -f "$file" ]; then
        filename=$(basename "$file")
        target="$HOME/$filename"
        create_parent_dir "$target"
        ln -sf "$file" "$target"
        echo "Linked: $filename"
    fi
done

echo -e "\nSymbolic links created successfully!" 
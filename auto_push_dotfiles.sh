#!/bin/bash

WATCH_DIR=~/Dotfiles

# Monitor the directory for changes
inotifywait -m -r -e modify,create,delete,move "$WATCH_DIR" | while read -r; do
    cd "$WATCH_DIR" || exit
    git add .
    git commit -m "Auto-update: $(date +'%Y-%m-%d %H:%M:%S')"
    git push
done


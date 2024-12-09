#!/bin/bash
cd ~/dotfiles
./backup_configs.sh
git add .
git commit -m "Update dotfiles - $(date +%Y-%m-%d)"
git push 
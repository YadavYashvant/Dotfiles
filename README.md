# Arch Linux Dotfiles

❗ THESE REPOSITORY IS MADE FOR MY PERSONAL USE ONLY

Personal dotfiles for Arch Linux system running Hyprland, AGS, and other tools.

## Prerequisites

Install base packages:
```bash
sudo pacman -S git hyprland kitty foot fish neovim ags
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```

2. Make scripts executable:
```bash
chmod +x install.sh backup.sh backup_configs.sh
```

3. Create symbolic links:
```bash
./install.sh
```

## Configuration Files

- `.config/`
  - `hypr/` - Hyprland window manager
  - `ags/` - AGS widgets and bars
  - `foot/` - Foot terminal
  - `kitty/` - Kitty terminal
  - `nvim/` - Neovim configuration
  - `fish/` - Fish shell

## Backup Your Changes

To backup your current configs:
```bash
./backup_configs.sh
```

To automatically backup and push to git:
```bash
./backup.sh
```

## Post-Installation

1. Set fish as default shell:
```bash
chsh -s /usr/bin/fish
```

2. Start Hyprland:
- Add to `~/.bash_profile` or `~/.zprofile`:
```bash
exec Hyprland
```

## Updating

Pull latest changes:
```bash
cd ~/Dotfiles
git pull
./install.sh
```

## Note

- Backup your existing configs before installation
- Review scripts before running them
- Modify paths in scripts if your setup differs


hyprland and ags dots are taken from [[end-4 hyprland dots](https://github.com/end-4/dots-hyprland)]
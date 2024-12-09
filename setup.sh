#!/bin/bash

# Create the base directory structure
mkdir -p dotfiles/.config
cd dotfiles

# Initialize git repository
git init

# Create a basic .gitignore
cat > .gitignore << EOL
*.log
*.swp
*~
.DS_Store
EOL

# Create installation script
cat > install.sh << EOL
#!/bin/bash

DOTFILES="\$HOME/dotfiles"

# Create symbolic links for .config
for dir in \$DOTFILES/.config/*; do
    if [ -d "\$dir" ]; then
        ln -sfn "\$dir" "\$HOME/.config/\$(basename \$dir)"
    fi
done

# Create symbolic links for other dotfiles
ln -sf \$DOTFILES/.bashrc \$HOME/.bashrc
ln -sf \$DOTFILES/.zshrc \$HOME/.zshrc
ln -sf \$DOTFILES/.xinitrc \$HOME/.xinitrc
ln -sf \$DOTFILES/.Xresources \$HOME/.Xresources
EOL

# Make installation script executable
chmod +x install.sh 
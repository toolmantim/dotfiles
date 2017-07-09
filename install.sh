#!/bin/bash

# Installs all the things
#
# This can safely be run as many times as you like on an existing machine

set -u

# Setup homebrew and friends

if ! which brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/bundle

# Install all the things

# cd ~/.dotfiles/homebrew && brew bundle

# Setup Bash

if [[ ! -f ~/.bash_profile ]]; then
  echo -e '#!/bin/bash\n' > ~/.bash_profile
fi
if ! grep dotfiles ~/.bash_profile; then
  echo -e '\n. ~/.dotfiles/bash_profile.bash' >> ~/.bash_profile
fi

# Setup iCloud symlinks for things that I don't want to check in, but are
# annoying to keep in sync between machines

icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/System Configs"

aws_dir="$HOME/.aws"
mkdir -p "$aws_dir"
if [[ -e "$aws_dir/config" || -L "$aws_dir/config" ]]; then rm "$aws_dir/config"; fi
ln -s "$icloud/aws/config" "$aws_dir/config"

ssh_dir="$HOME/.ssh"
mkdir -p "$ssh_dir"
if [[ -e "$ssh_dir/config" || -L "$ssh_dir/config" ]]; then rm "$ssh_dir/config"; fi
ln -s "$icloud/ssh/config" "$ssh_dir/config"

if [[ -e "$HOME/.gitconfig" || -L "$HOME/.gitconfig" ]]; then rm "$HOME/.gitconfig"; fi
ln -s "$icloud/git/config" "$HOME/.gitconfig"

if [[ -e "$HOME/.gitignore" || -L "$HOME/.gitignore" ]]; then rm "$HOME/.gitignore"; fi
ln -s "$icloud/git/ignore" "$HOME/.gitignore"

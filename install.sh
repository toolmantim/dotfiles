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

cd ~/.dotfiles/homebrew && brew bundle

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

sublime_app_support="$HOME/Library/Application Support/Sublime Text 3"
for dir in Packages Installed\ Packages; do
  mkdir -p "$sublime_app_support"
  rm -r "$sublime_app_support/$dir" || true
  ln -s "$icloud/Sublime/Application Support/$dir" "$sublime_app_support/$dir"
done

aws_dir="$HOME/.aws"
mkdir -p "$aws_dir"
rm "$aws_dir/config" || true
ln -s "$icloud/aws/config" "$aws_dir/config"

ssh_dir="$HOME/.ssh"
mkdir -p "$ssh_dir"
rm "$ssh_dir/config" || true
ln -s "$icloud/ssh/config" "$ssh_dir/config"

rm "$HOME/.gitconfig" || true
ln -s "$icloud/git/config" "$HOME/.gitconfig"
ln -s "$icloud/git/identities" "$HOME/.gitidentities"

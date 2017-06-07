# dotfiles

My dotfiles.

## Setup

```bash
git clone https://github.com/toolmantim/dotfiles.git ~/.dotfiles

if [[ ! -f ~/.bash_profile ]]; then
  echo -e '#!/bin/bash\n' > ~/.bash_profile
fi

# Setup .bash_profile
echo ". ~/.dotfiles/bash_profile.bash" >> ~/.bash_profile
source ~/.bash_profile
```
